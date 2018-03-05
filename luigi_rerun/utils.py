import collections

import warnings
warnings.filterwarnings("ignore")

import luigi
from luigi.tools import deps

def flatten(l):
    """
     @input:
        l - iterable

     recursively flatten iterable
    """

    for el in l:
        if isinstance(el, dict):
            el = el.values()

        if isinstance(el, collections.Iterable) and not isinstance(el, (str, bytes)):
            yield from flatten(el)
        else:
            yield el


def all_deps():
    return deps.find_deps_cli()

def outputs():
    deps = all_deps()

    mapped = []

    for task in deps:
        flattened = flatten([task.output()])

        mapped += map(lambda out: Output(out, task), flattened)

    return mapped

RED    = '\033[0;31m'
GREEN  = '\033[0;32m'
YELLOW = '\033[0;33m'
BLUE   = '\033[0;34m'
NC     = '\033[0m' # No Color

class AbstractOutput():

    def __init__(self, output, task):
        self.output = output
        self.task = task

    def clear():
        raise NotImplemented(f"Function clear not implemented in {type(self).__name__}")

    @property
    def output_type_name(self):
        return type(self.output).__name__

    def __str__(self):
        return "%-20s: %-40s %s" % (f"{YELLOW}{self.output_type_name}{NC}", f"({BLUE}{type(self.task).__name__}{NC})", f": {self.to_str()}")

    # redefine for nice command line view
    def __repr__(self):
        return self.__str__()

class LocalOutput(AbstractOutput):

    def to_str(self):
        return self.output.path

    def clear(self):
        print(f"Removing LocalTarget output from {self.output.path}")
        if self.output.exists():
            self.output.remove()

class RedshiftOutput(AbstractOutput):

    def to_str(self):
        return (f"Marker in {self.output.marker_table}"
                f" with update_id: {GREEN}{self.output.update_id}{NC}"
                f" for table {RED}{self.output.table}{NC}")

    def clear(self):
        sql = f"""
            DELETE FROM {self.output.marker_table}
            WHERE update_id = '{self.output.update_id}'
        """

        with self.output.connect() as conn:
            with conn.cursor() as cur:
                try:
                    cur.execute(sql)
                except psycopg2.Error as e:
                    print(f"""Error raised with {RED}{e}{NC}
                              for query {GREEN}{cur.query}{NC}
                           """)

            conn.commit()

class RedshiftTableOutput(AbstractOutput):

    def to_str(self):
        return (f"Table {GREEN}{self.output.table}{NC}"
                f" created in database {RED}{self.output.database}{NC}")

    def clear(self):
        print("You dont have to remove the table")

class S3Output(AbstractOutput):

    def to_str(self):
        return self.output.path

    def clear(self):
        print(f"Removing S3Target output from {self.output.path}")
        self.output.remove()

class DefaultOutput(AbstractOutput):

    def to_str(self):
        return ""

    def clear(self):
        if hasattr(self.output, 'remove'):
            self.output.remove()
        else:
            print(f"Default output for {RED}{self.output_type_name}{NC} cannot remove itself. Define the remove() method")

outputs_map = {
    'RedshiftTableTarget': RedshiftTableOutput,
    'RedshiftTarget': RedshiftOutput,
    'S3Target': S3Output,
    'LocalTarget': LocalOutput,
}

def Output(luigi_output, luigi_tsk):
    output_type = type(luigi_output).__name__

    output_class = outputs_map[output_type] if output_type in outputs_map else DefaultOutput

    return output_class(luigi_output, luigi_tsk)

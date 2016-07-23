# switch default editor for pry to sublime text
Pry.config.editor = proc { |file, line| %("subl" "#{file}":#{line}) }

# format prompt to be <Rails version>@<ruby version>(<object>)>
Pry.config.prompt = proc do |obj, level, _|
  prompt = "\e[1;36m"
  prompt << "#{Rails.version} @ " if defined?(Rails)
  prompt << "#{RUBY_VERSION}"
  "#{prompt} (#{obj})>\e[0m "
end

# use awesome print for all objects in pry
begin
  require 'awesome_print'
  Pry.config.print = proc { |output, value| output.puts "=> #{ap value}" }
rescue
  puts "=> Unable to load awesome_print, please type 'gem install awesome_print' or 'sudo gem install awesome_print'."
end

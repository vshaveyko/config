require 'cucumber/formatter/console'
require 'cucumber/formatter/ansicolor'
require 'cucumber/formatter/io'
require 'pry'

class Cucumber::Formatter::Vim

  include Cucumber::Formatter::Console
  include Cucumber::Formatter::Io

  attr_reader :runtime
  alias_method :step_mother, :runtime

  attr_reader :config, :summary

  def initialize(runtime, path_or_io, options)
    @runtime = runtime
    @io      = ensure_io(path_or_io)
    @options = options

    @step_count = @issues_count = 0
  end

  def step_name(keyword, step_match, status, source_indent, background, file_colon_line)
    if status == :failed
      step_name    = step_match.format_args(lambda{|param| "*#{param}*"})
      fail_message = "[FAIL] #{step_name}"

      @io.puts "#{file_colon_line}: #{fail_message}"
      @io.flush
    end
  end

  def before_scenario(cuke_scenario)
    @scenario = Scenario.new.tap do |x|
      x.name = "#{cuke_scenario.keyword}: #{cuke_scenario.name}"
    end
  end

  def after_scenario(cuke_scenario)
    test_name = @scenario.name
    if @exception
      if @exception.is_a? ::Cucumber::Pending
        @io.puts('Pending test')
      else
        @io.puts(test_name)
      end
    end
    # a background step previously failed and was reported the first time the failure happened
    if (cuke_scenario.status == :skipped) && (@exception == nil)
      @io.puts('Background failure')

      # @logger.test_failed(test_name,)
    end

    @io.puts('OK')
    # @logger.test_finished(test_name)
  end

  def after_features(features)
    fails = collect_failing_scenarios(runtime)

    pry binding unless fails.empty?
    # @state = :red if runtime.scenarios(:failed).any?
    # @io.puts
    # @io.puts
    # print_summary(features)
  end

  def after_step_result(keyword, step_match, multiline_arg, status, exception, source_indent, background, file_colon_line)
    # pry binding
    # if status == :failed
    #   @io.puts '.'.red
    # else
    #   @io.puts '.'.green
    # end
  end

  def exception(exception, status)
    @delayed_messages ||= []
    print_messages
    # print_exception(exception, status, @indent)
    # @io.flush
  end

  # def exception(exception, status)
  #   pry binding
  #   @io.print "\e[K" if colors_enabled?
  #   @issues_count += 1
  #   @io.puts
  #   @io.puts "#{@issues_count})"
  #   print_exception(exception, status, 2)
  #   @io.puts
  #   @io.flush
  # end

end

# frozen_string_literal: true
# require 'cucumber/core/report/summary'
# require 'cucumber/formatter/backtrace_filter'
# require 'cucumber/formatter/console'
# require 'cucumber/formatter/console_counts'
# require 'cucumber/formatter/console_issues'
# require 'cucumber/formatter/io'
# require 'cucumber/formatter/duration_extractor'
# require 'cucumber/formatter/hook_query_visitor'
#
# module Cucumber
#   module Formatter
#     The formatter used for <tt>--format progress</tt>
#     class Progress
#       include Console
#       include Io
#       attr_reader :runtime
#       attr_reader :config, :summary
#
#       def initialize(config)
#         @config, @io = config, ensure_io(config.out_stream)
#         @previous_step_keyword = nil
#         @snippets_input = []
#         @total_duration = 0
#         @summary = Cucumber::Core::Report::Summary.new(config.event_bus)
#         @matches = {}
#         @pending_step_matches = []
#         @failed_results = []
#         @failed_test_cases = []
#         @passed_test_cases = []
#         @counts = ConsoleCounts.new(config)
#         @issues = ConsoleIssues.new(config)
#         config.on_event :step_activated, &method(:on_step_activated)
#         config.on_event :test_case_started, &method(:on_test_case_started)
#         config.on_event :test_step_finished, &method(:on_test_step_finished)
#         config.on_event :test_case_finished, &method(:on_test_case_finished)
#         config.on_event :test_run_finished, &method(:on_test_run_finished)
#       end
#
#       def on_step_activated(event)
#         @matches[event.test_step.source] = event.step_match
#       end
#
#       def on_test_case_started(_event)
#         unless @profile_information_printed
#           do_print_profile_information(config.profiles) unless config.skip_profile_information? || config.profiles.nil? || config.profiles.empty?
#           @profile_information_printed = true
#         end
#         @previous_step_keyword = nil
#       end
#
#       def on_test_step_finished(event)
#         test_step = event.test_step
#         result = event.result.with_filtered_backtrace(Cucumber::Formatter::BacktraceFilter)
#         progress(result.to_sym) if !HookQueryVisitor.new(test_step).hook? || result.failed?
#
#         return if HookQueryVisitor.new(test_step).hook?
#         collect_snippet_data(test_step, result)
#         @pending_step_matches << @matches[test_step.source] if result.pending?
#         @failed_results << result if result.failed?
#       end
#
#       def on_test_case_finished(event)
#         test_case = event.test_case
#         result = event.result.with_filtered_backtrace(Cucumber::Formatter::BacktraceFilter)
#         @failed_test_cases << test_case if result.failed?
#         @passed_test_cases << test_case if result.passed?
#         @total_duration += DurationExtractor.new(result).result_duration
#       end
#
#       def on_test_run_finished(_event)
#         @io.puts
#         @io.puts
#         print_summary
#       end
#
#       private
#
#       def print_summary
#         print_elements(@pending_step_matches, :pending, 'steps')
#         print_elements(@failed_results, :failed, 'steps')
#         print_statistics(@total_duration, @config, @counts, @issues)
#         snippet_text_proc = lambda { |step_keyword, step_name, multiline_arg|
#           snippet_text(step_keyword, step_name, multiline_arg)
#         }
#         do_print_snippets(snippet_text_proc) if config.snippets? && summary.test_steps.total(:undefined) > 0
#         return unless config.wip?
#         messages = @passed_test_cases.map do |test_case|
#           linebreaks("#{test_case.location.on_line(test_case.location.line)}:in `#{test_case.name}'", ENV['CUCUMBER_TRUNCATE_OUTPUT'].to_i)
#         end
#         do_print_passing_wip(messages)
#       end
#
#       CHARS = {
#         :passed    => '.',
#         :failed    => 'F',
#         :undefined => 'U',
#         :pending   => 'P',
#         :skipped   => '-'
#       }
#
#       def progress(status)
#         char = CHARS[status]
#         @io.print(format_string(char, status))
#         @io.flush
#       end
#
#       def table_header_cell?(status)
#         status == :skipped_param
#       end
#
#       TestCaseData = Struct.new(:name, :location)
#     end
#   end
# end

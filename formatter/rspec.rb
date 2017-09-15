# Format spec results for display in the Vim quickfix window
# Use this custom formatter like this:
#   bin/rspec -r spec/support/vim_formatter -f RSpec::Core::Formatters::VimFormatter spec
#
# Rspec 3+ syntax
#
class RSpec::Core::Formatters::VimFormatter

  RSpec::Core::Formatters.register self, :example_failed, :dump_summary

  attr_reader :output

  def initialize(output)
    @output = output
  end

  def example_failed(notification)
    @output << format(notification) + "\n"
  end

  def dump_summary(notification)
    duration  = notification.formatted_duration
    total     = notification.example_count
    failed    = notification.failure_count

    output    = "(#{duration}) "

    if failed.zero?
      output << "Passed".green
    else
      output << "Failed: #{failed}, Passed: #{total - failed}, Total: #{total}."
    end

    @output << output
  end

  private

  def format(notification)
    path         = notification.example.location
    message      = notification.exception.message[0, 100]
    fail_message = "[FAIL] #{message}".gsub("\n", ' ').red

    "#{path}: #{fail_message}"
  end

end

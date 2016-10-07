# frozen_string_literal: true
# author: Vadim Shaveiko <@vshaveyko>
# add some pry aliases
Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 's', 'step'
Pry.commands.alias_command 'n', 'next'
Pry.commands.alias_command 'wai', 'whereami'
Pry.commands.alias_command 'e', 'edit'
Pry.commands.alias_command 'p', 'play'

# switch default editor for pry to current editor
Pry.config.editor = ENV['EDITOR']

# format prompt to be <Rails version>@<ruby version>(<object>)>
Pry.config.prompt = proc do |obj, _level, _|
  prompt = "\e[1;36m"
  prompt += "#{Rails.version} @ " if defined?(Rails)
  prompt += RUBY_VERSION.to_s
  "#{prompt} (#{(obj.to_s || '')[0..10]})>\e[0m "
end

# use awesome print for all objects in pry
begin
  require 'awesome_print'
  Pry.config.print = proc { |output, value| output.puts "=> #{ap value}" }
  require 'hirb'
  Hirb.enable
rescue
  puts "=> Unable to load awesome_print, please type 'gem install awesome_print' or 'sudo gem install awesome_print'."
end

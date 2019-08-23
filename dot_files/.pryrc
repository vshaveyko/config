# frozen_string_literal: true
# author: Vadim Shaveiko <@vshaveyko>
# add some pry aliases

Pry.commands.alias_command 'wai', 'whereami'
Pry.commands.alias_command 'e', 'edit'

Pry.commands.alias_command 's', 'step'
Pry.commands.alias_command 'n', 'next'
Pry.commands.alias_command 'p', 'play'
Pry.commands.alias_command 'c', 'continue'

Pry.commands.alias_command 'ss', 'show-stack'
Pry.commands.alias_command 'u', 'up'
Pry.commands.alias_command 'd', 'down'


# switch default editor for pry to current editor
Pry.config.editor = ENV['EDITOR'] || 'nvim'

# format prompt to be <Rails version>@<ruby version>(<object>)>
Pry.config.prompt = proc do |obj, _level, _|
  prompt = "\e[1;36m"
  prompt += "#{Rails.version} @ " if defined?(Rails)
  prompt += RUBY_VERSION.to_s
  # '' # For jump back in tmux.
  "\e[92m➜ #{prompt}> "
end

# use awesome print for all objects in pry
begin
  require 'awesome_print'

  Pry.config.print = proc { |output, value| output.puts "=> #{ap value}" }
rescue
  puts "=> Unable to load awesome_print, please type 'gem install awesome_print' or 'sudo gem install awesome_print'."
end

# begin
#   require 'hirb'
#   Hirb.enable
# rescue
# end

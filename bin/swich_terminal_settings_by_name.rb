#!/usr/bin/env ruby

require 'appscript'
include Appscript

if ARGV[0] then
  terminal = app("Terminal")
  terminal.windows[1].current_settings.set(terminal.settings_sets[ARGV[0]])
end


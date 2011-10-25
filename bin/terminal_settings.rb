#!/System/Library/PrivateFrameworks/MacRuby.framework/Versions/Current/usr/bin/macruby

require 'optparse'

opt = OptionParser.new

opts = {}

opt.on('--all') { opts[:all] = true }
opt.on('--list') { opts[:list] = true }
opts[:name] = opt.parse(ARGV).last

framework 'ScriptingBridge'
terminal = SBApplication.applicationWithBundleIdentifier('com.apple.Terminal')

if opts[:list] then
  terminal.settingsSets.each do |settingsSet|
    puts settingsSet.name
  end
elsif opts[:name] then
  if settingsSet = terminal.settingsSets.find {|settingsSet| settingsSet.name == opts[:name]}
    if opts[:all] then
      terminal.windows.each do |window|
        window.tabs.each do |tab|
          tab.currentSettings = settingsSet
        end
      end
    else
      if window = terminal.windows.find {|window| window.frontmost}
        window.selectedTab.currentSettings = settingsSet
      end
    end
  end
else
  if window = terminal.windows.find {|window| window.frontmost}
    puts window.selectedTab.currentSettings.name
  end
end

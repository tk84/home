#!/System/Library/PrivateFrameworks/MacRuby.framework/Versions/Current/usr/bin/macruby

framework 'ScriptingBridge'



se = SBApplication.applicationWithBundleIdentifier 'com.apple.systemevents'
#se = SBApplication.applicationWithBundleIdentifier 'com.apple.finder'


#chrome = se.processes.find {|p| 'com.google.Chrome' == p.bundleIdentifier}
#chrome = SBApplication.applicationWithBundleIdentifier 'com.google.Chrome'
#chrome.activate
#chrome.windows[2].index = 1
#chrome.windows[1].index = 1
#chrome.windows[0].index = 2
#SBApplication.applicationWithBundleIdentifier 'com.apple.Terminal'
#chrome.activate
#chrome.window[2].zoomed = true

#exit



process = se.processes.find do |process|
  process.frontmost == true
end


#p process.menuBars

# bundleId = process.bundleIdentifier
# procs = se.processes.select do |process|
#   bundleId == process.bundleIdentifier
# end


#puts process.methods(false, true)


#exit

#open("/tmp/hoge.txt", "w") {|f| f.write process.bundleIdentifier}

app = SBApplication.applicationWithBundleIdentifier process.bundleIdentifier

app.windows.each do |window|
#if 0 < window.tabs.size and 1 < window.index then
#window.index = 1
  if 1 == window.index then
    window.index = 99
#  elsif 2 == window.index then
#    window.index = 0
  else
    window.index = (window.index - 1)
  end
end
#app.activate

  # if 1 <= window.index then
  #   window.index = 99
  # else
  #   window.index = 1
  # end
#end


exit


windows = app.windows.select do |window|
  0 < window.tabs.size
end

windows.each_index do |index|
  if windows[index].frontmost then
    if windows[index + 1] then
      windows[index + 1].frontmost = true
    else
      windows[0].frontmost = true
    end
  end
end


#p app.methods(false, true)
#p app.bundleIdentifier

#p app

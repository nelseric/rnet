require "rake/task"

libdir = File.expand_path(File.join(File.dirname(__FILE__),"lib"))
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require "net_game"

task :default => :run

desc "Run the game"
task :run do
  NetGame.run
end

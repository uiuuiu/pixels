working_dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'app'))
require 'logger'
require "#{working_dir}/models/pixel.rb"
require "#{working_dir}/../lib/store.rb"
STDOUT.sync = true
logger = Logger.new(STDOUT)
logger.info 'Start building Pixel community'
root_parent_1 = Pixel.new(123, 123, 123)
root_parent_2 = Pixel.new(124, 124, 124)
Store.push_populations [root_parent_1, root_parent_2]
loop do
  parent_1 = Store.populations[Store.populations.keys.sample]
  populations = Store.populations.reject {|id, pixel| pixel == parent_1}
  parent_2 = populations[populations.keys.sample]
  baby_pixel = Pixel.new_child(parent_1, parent_2)
  Store.push_populations [baby_pixel]
  puts Store.populations
  sleep 3
end

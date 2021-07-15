working_dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'app'))
require_relative "#{working_dir}/../config/environment"
require 'logger'
# require "#{working_dir}/models/pixel.rb"
# require "#{working_dir}/../lib/store.rb"
STDOUT.sync = true
logger = Logger.new(STDOUT)
logger.info 'Start building Pixel community'

# Init root parent
root_parent_1 = Pixel.new(123, 123, 123)
root_parent_2 = Pixel.new(124, 124, 124)
Store.push_populations [root_parent_1, root_parent_2]
loop do
  if Store.populations.length >= Store::MAX_POPULATIONS
    logger.info 'Pixel comunity reach the maximum popluations'
    logger.info 'Skip to create new pixel'
    logger.info '------------------------'
    sleep 3
    next
  end
  populations = Store.populations.clone
  babies = {}
  
  # 50% of the pixel's populations will be combined to create new pixel
  total_pairs = populations.length/4
  total_pairs = 1 if total_pairs == 0
  
  total_pairs.times do
    parent_1 = populations[populations.keys.sample]
    populations.delete(parent_1.id)
    parent_2 = populations[populations.keys.sample]
    populations.delete(parent_2.id)
    baby_pixel = Pixel.new_child(parent_1, parent_2)

    # each pixel has a uniqueness set of gene
    babies[baby_pixel.id] = baby_pixel if !Store.populations[baby_pixel.id] || !babies[baby_pixel.id]
  end
  Store.push_populations babies.map {|key, value| value}

  # Enqueue data to active job for saving 
  CreatePixelJob.perform_later(babies.as_json)
  
  logger.info "-----New Pixel Generation-----"
  logger.info babies.map{|key, value| key}.join(", ")
  logger.info "==============================="
  sleep 3
end

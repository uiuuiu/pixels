working_dir = File.expand_path(File.join(File.dirname(__FILE__)))
God.watch do |w|
  w.name = "pixels_generator"
  w.start = "ruby #{working_dir}/pixels_generator.rb"
  w.log = "#{working_dir}/../log/pixels_generator.log"
  w.keepalive
end
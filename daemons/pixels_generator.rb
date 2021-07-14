require 'logger'
logger = Logger.new(STDOUT)
loop do
  logger.info "hello"
  sleep 3
end
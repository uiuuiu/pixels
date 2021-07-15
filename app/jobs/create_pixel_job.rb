class CreatePixelJob < ApplicationJob
  queue_as :default

  # We will store pixel data to database or file here
  def perform(*args)
    logger.info "Received data"
    logger.info args
    logger.info "================================="
  end
end

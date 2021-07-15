module Store
  # MAX_POPULATIONS = 773232 # 1068 x 724
  MAX_POPULATIONS = 1000
  class << self
    attr_accessor :populations

    def populations
      @populations ||= {}
    end

    def push_populations pixels
      pixels.each do |pixel|
        self.populations[pixel.id] = pixel
      end
    end
  end
end
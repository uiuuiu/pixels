module Store
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
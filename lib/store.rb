module Store
  class << self
    attr_accessor :populations

    def populations
      @populations || []
    end
  end
end
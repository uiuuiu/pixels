class Pixel
  class << self
    def new_child fisrt_parent, second_parent
      inherted_gen_r_type = [0,fisrt_parent.r,second_parent.r].sample
      inherted_gen_b_type = [0,fisrt_parent.b,second_parent.b].sample
      inherted_gen_g_type = if inherted_gen_r_type || inherted_gen_b_type
        [0,fisrt_parent.g,second_parent.g].sample
      else
        [fisrt_parent.g,second_parent.g].sample
      end

      gen_r = generate_gen(inherted_gen_r_type)
      gen_b = generate_gen(inherted_gen_b_type)
      gen_g = generate_gen(inherted_gen_g_type)
      
      self.new(gen_r, gen_b, gen_g)
    end

    def generate_gen inherted
      inherted == 0 ? (1..255).to_a.sample : inherted
    end
  end
  attr_accessor :id, :r, :b, :g

  def initialize r, b, g
    @r = r
    @b = b
    @g = g
    @id = [r,b,g].join
  end
end
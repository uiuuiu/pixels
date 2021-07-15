class Pixel
  GENE_LIST = (0..255).to_a
  class << self
    def new_child fisrt_parent, second_parent

      # inherted_gen type is used for presenting the inheritance of new pixel to its parent
      # if the inherted_gen is 0, the new pixel will have a random gene
      inherted_gen_r_type = [0,fisrt_parent.r,second_parent.r].sample
      inherted_gen_b_type = [0,fisrt_parent.b,second_parent.b].sample

      # To make sure the new pixel has at least one gene from parent
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
      inherted == 0 ? GENE_LIST.sample : inherted
    end
  end
  attr_accessor :id, :r, :b, :g

  def initialize r, b, g
    @r = r
    @b = b
    @g = g
    @id = [
      r.to_s.rjust(3, "0"),
      b.to_s.rjust(3, "0"),
      g.to_s.rjust(3, "0")
    ].join
  end
end
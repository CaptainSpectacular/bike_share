class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || Hash.new(0)
  end

  def total_accessory_count
    @contents.values.sum
  end

  def add_accessory(accessory)
    @contents[accessory.id.to_s] +=1
  end

  def accessory_count(id)
    @contents[id]
  end
end

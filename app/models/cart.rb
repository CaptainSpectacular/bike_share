class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || Hash.new(0)
  end

  def total_accessory_count
    @contents.values.sum
  end

  def add_accessory(accessory)
    @contents[accessory.id.to_s] ||= 0
    @contents[accessory.id.to_s] += 1
  end

  def remove_accessory(accessory)
    @contents[accessory.id.to_s] -= 1
  end

  def accessory_count(id)
    @contents[id]
  end

  def delete_accessory(accessory)
    @contents.delete(accessory.id.to_s)
  end

  def total
    @contents.map do |accessory_id, count|
      Accessory.find(accessory_id).price.to_f * count
    end.sum
  end

end

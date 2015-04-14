class LinkedListItem
  include Comparable
  attr_reader :payload
  attr_reader :next_item
  def initialize(payload)
  	@payload = payload
  end
  def payload=(item)
  	@payload = item
  end
  def next_item=(item)
  	if item===self
  		raise ArgumentError
  		else @next_item = item
  	end
  end
  def last?
  	next_item.nil?
  end
  def to_s
  	@payload
  end
  def <=>(other)
  	if self.payload.to_s == other.payload.to_s
  		self.payload.class.to_s <=> other.payload.class.to_s
  	else self.payload.to_s <=> other.payload.to_s
  	end
  end
  def ===(other)
  	self.object_id === other.object_id
  end
end


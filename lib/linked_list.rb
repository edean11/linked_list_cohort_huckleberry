require_relative 'linked_list_item'

class LinkedList
  def initialize(*payload)
  	if payload[0]
  		lli = LinkedListItem.new(payload[0])
  		@currItem = lli
  		@firstItem = lli
  		@count = 0
  		num = @count + 1
  		while payload[num]
  			lli2 = LinkedListItem.new(payload[num])
  			@currItem.next_item = lli2
  			@currItem = lli2
  			num += 1
  			@count += 1
  		end
  	else
  		@currItem = nil
  		@count = -1
  	end
  end
  def push(pushedPayload)
  	@count += 1
  	lli = LinkedListItem.new(pushedPayload)
  	if @currItem != nil
  		@currItem.next_item = lli
  	else @firstItem = lli
  	end
  	@currItem = lli
  end
  def get_item(index)
  	item_iteration = @firstItem
	index.times do |num|
		nexting = item_iteration.next_item
		item_iteration = nexting
	end
	return item_iteration
  end
  def get(index)
  	if index < 0 || index > @count
  		raise IndexError
  	elsif index == @count
  		return @currItem.payload
  	else
  		return get_item(index).payload
  	end
  end
  def set(index,item)
  	if index < 0 || index > @count
  		raise IndexError
  	else
  		get_item(index).payload = item
  	end
  end
  def delete(index)
  	if index > @count
  		raise IndexError
  	elsif index > 0
  		get_item(index-1).next_item = get_item(index+1)
  	else
  		@firstItem = @firstItem.next_item
  	end
  	@count -= 1
  end
  def [](num)
  	get(num)
  end
  def []=(num,item)
  	set(num,item)
  end
  def index(value)
  	iterator = 0
  	item_iteration = @firstItem
  	while iterator <= @count
  		if item_iteration.payload.to_s == value
  			return iterator
  		else
  			iterator += 1
  			item_iteration = item_iteration.next_item
  		end
  	end
  end
  def size
  	@count + 1
  end
  def last
  	if @currItem
  		@currItem.payload
  	else @currItem
  	end
  end
  def sorted?
  	iterator = 0
  	item_iteration = @firstItem
  	if @count <= 0
  		return true
  	else
	  	while iterator <= @count
	  		if iterator == @count
	  			return true
	  		elsif item_iteration.payload.to_s > item_iteration.next_item.payload.to_s &&
	  			  item_iteration.payload.class.to_s == item_iteration.next_item.payload.class.to_s
	  			return false
	  		elsif item_iteration.payload.class.to_s != item_iteration.next_item.payload.class.to_s &&
	  			  item_iteration.payload.class.to_s > item_iteration.next_item.payload.class.to_s
	  			return false
	  		else
	  			iterator += 1
	  			item_iteration = item_iteration.next_item
	  		end
	  	end
	end
  end
  def sort!
  	iterator = 0
  	item_iteration = @firstItem
  	while iterator <= @count
  		if iterator == @count
  			puts "break"
  			break
  		elsif item_iteration.payload.to_s > item_iteration.next_item.payload.to_s &&
  			  item_iteration.payload.class.to_s == item_iteration.next_item.payload.class.to_s
  			puts "one"
  			puts item_iteration.next_item
  			if item_iteration == @firstItem
  				@firstItem = item_iteration.next_item
  			end
  			item_iteration.next_item.next_item = item_iteration
  			item_iteration = item_iteration
  			iterator += 1
  		elsif item_iteration.payload.class.to_s != item_iteration.next_item.payload.class.to_s &&
  			  item_iteration.payload.class.to_s > item_iteration.next_item.payload.class.to_s
  			puts "two"
  			if item_iteration == @firstItem
  				@firstItem = item_iteration.next_item
  			end
  			item_iteration.next_item.next_item = item_iteration
  			item_iteration = item_iteration
  			iterator += 1
  		else
  			puts "three"
  			iterator += 1
  			item_iteration = item_iteration.next_item
  		end
  	end
  end
  def to_s
  	if @currItem
  		iterator = 0
  		string = ""
  		item_iteration = @firstItem
  		while iterator <= @count
  			if iterator == @count
  				string << item_iteration.payload.to_s
  			else string << item_iteration.payload.to_s + ", "
  			item_iteration = item_iteration.next_item
  			end
  			iterator += 1
  		end
  		return "| "+string+" |"
  	else return "| |"
  	end
  end
end


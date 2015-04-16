#!/usr/bin/env ruby

require_relative 'lib/linked_list'

payloads = ARGV # ARGV holds the command line arguments that were passed in

# Now, build a LinkedList
ll = LinkedList.new

# And, populate it
string = "* ->"
payloads.each do |argument|
	ll.push(argument)
	size = ll.size
	string << ' "'+ll[size-1]+'" ->'
end
string << " nil"

# Then, print it out
print string
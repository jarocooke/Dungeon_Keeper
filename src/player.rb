# consider making this a Struct

	class Player
		attr_accessor :name, :location, :inventory
    
		def initialize(name)
			@name = name
			@inventory = []
		end
		
#	def show_inventory
#		if @inventory == []
#			puts "You don't currently have any items"
#		else
#			puts "Your inventory currently contains:"
#			@inventory.each { |item| my_dungeon.find_item_in_dungeon(item).item_description }
#		end
#	end

		
#		def add_to_inventory(object)
#			@inventory << object
#		end
		
	end

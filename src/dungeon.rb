class Dungeon
	attr_accessor :player, :item
  
	def initialize(player_name)
		@player = Player.new(player_name)
		@rooms = []
		@items = []
	end
  
	def add_room(reference, name, description, connections, items)
		@rooms << Room.new(reference, name, description, connections, items)
	end
  
	def add_item(reference, name, description)
		@items << Item.new(reference, name, description)
	end
  
	def start(location)
		@player.location = location
	end
  
	def help
		system "clear"
		puts "To exit type \"exit\""
		puts "To go in a direction type for example \"go west\""
		puts "To look for items type \"look around\" or simply \"look\""
		puts "To pick up an item type \"pickup the_item\""
		puts "To drop an item type \"drop the_item\""
		puts "To see your current inventory type \"inventory\""
	end
  
	def show_current_description
		puts find_room_in_dungeon(@player.location).full_description
	end
  
	def find_room_in_dungeon(reference)
		@rooms.detect { |room| room.reference == reference }
	end
  
	def find_item_in_dungeon(reference)
		@items.detect { |item| item.reference == reference }
	end
  
	def find_room_in_direction(direction)
		find_room_in_dungeon(@player.location).connections[direction]
	end
  
	def items_in_room
		find_room_in_dungeon(@player.location).items
	end
  
	def go(direction)
		if find_room_in_dungeon(@player.location).connections.keys.include?(direction) == true
			#system "clear"
			puts "You go " + direction.to_s + "\n"
			@player.location = find_room_in_direction(direction)
		else
			puts "That is not a valid command and/or direction!"
		end
	end
	
	
	
	def pickup_item(object)
		if items_in_room.include?(object) == true
			puts "You pickup the " + object.to_s + "\n"
			items_in_room.delete(object)
			#@player.add_to_inventory(object)
			@player.inventory << object
		else
			puts "That item is not in this room (or does not exist)!"
		end
	end
	
	def drop_item(object)
		if @player.inventory.include?(object) == true
			puts "You drop the " + object.to_s + "\n"
			@player.inventory.delete(object)
			items_in_room << object
		else
			puts "That item is not in your inventory"
		end
	end
	
	def show_inventory
		if player.inventory == []
			puts "You don't currently have any items"
		else
			puts "Your inventory currently contains:"
			player.inventory.each { |item| find_item_in_dungeon(item).item_description }
		end
	end
	
	
	
	def arrive_in_room
		puts "There are doors to the " + find_room_in_dungeon(@player.location).room_connections
	end
	
	def look_around
		puts "You find the following items:"
		find_room_in_dungeon(@player.location).items.each { |item| find_item_in_dungeon(item).item_description }
	end
	
	require_relative 'player'	

	require_relative 'room'

	require_relative 'item'		

end

class Dungeon
	attr_accessor :player, :item, :rooms
  
	def initialize(player_name)
		@player = Player.new(player_name)
		@rooms = []
		@items = []
	end
  
	def add_room(reference, name, description, connections, items)
		rooms << Room.new(reference, name, description, connections, items)
	end
  
	def add_item(reference, name, description)
		items << Item.new(reference, name, description)
	end
  
	def start(location)
		player.location = location
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
		puts find_room_in_dungeon(player.location).full_description
	end
  
	def find_room_in_dungeon(reference)
		rooms.detect { |room| room.reference == reference }
	end
  
	def find_item_in_dungeon(reference)
		items.detect { |item| item.reference == reference }
	end
  
	def find_room_in_direction(direction)
		find_room_in_dungeon(player.location).connections[direction]
	end
  
	def go(direction)
		if find_room_in_dungeon(player.location).connections.keys.include?(direction) == true
			#system "clear"
			puts "You go " + direction.to_s + "\n"
			player.location = find_room_in_direction(direction)
		else
			puts "That is not a valid command and/or direction!"
		end
	end
	
	def pickup_item(object)
		if available_items.include?(object)
			puts "You pickup the " + object.to_s + "\n"
			player.inventory << available_items.delete(object)
		else
			puts "That item is not in this room (or does not exist)!"
		end
	end

	def available_items
    find_room_in_dungeon(player.location).items
	end
	
	def drop_item(object)
		if player.inventory.include?(object)
			puts "You drop the " + object.to_s + "\n"
			availabe_items << player.inventory.delete(object)
		else
			puts "That item is not in your inventory"
		end
	end
	
	def show_inventory
		if player.inventory.empty?
			puts "You don't currently have any items"
		else
			puts "Your inventory currently contains:"
			player.inventory.each { |object| find_item_in_dungeon(object).item_description }
		end
	end
	
	def arrive_in_room
		puts "There are doors to the " + find_room_in_dungeon(player.location).room_connections
	end
	
	def look_around
		puts "You find the following items:"
		find_room_in_dungeon(player.location).items.each { |object| find_item_in_dungeon(object).item_description }
	end
	
	require_relative 'player'	

	require_relative 'room'

	require_relative 'item'		

end

	class Room
		attr_accessor :reference, :name, :description, :connections, :items
    
		def initialize(args)
			@reference = args[:reference]
			@name = args[:name]
			@description = args[:description]
			@connections = args[:connections]
			@items = args[:items]
		end
    
		def full_description
			"\nYou are in " + description
		end
    
		def room_connections
			connections.keys.join(" and ")
		end
	end

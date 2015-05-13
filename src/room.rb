	class Room
		attr_accessor :reference, :name, :description, :connections, :items
    
		def initialize(reference, name, description, connections, items)
			@reference = reference
			@name = name
			@description = description
			@connections = connections
			@items = items
		end
    
		def full_description
			"\nYou are in " + @description
		end
    
		def room_connections
			@connections.keys.join(" and ")
		end
	end

	class Item
		attr_accessor :reference, :name, :description
		
		def initialize(args)
			@reference = args[:reference]
			@name = args[:name]
			@description = args[:description]
		end
		
		def item_description
			puts reference.to_s + ": " + description
		end
	end
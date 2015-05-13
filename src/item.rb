	class Item
		attr_accessor :reference, :name, :description
		
		def initialize(reference, name, description)
			@reference = reference
			@name = name
			@description = description
		end
		
		def item_description
			puts @reference.to_s + ": " + @description
		end
	end
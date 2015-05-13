#require 'rubygems'
#require 'debugger'

require_relative 'src/dungeon'

#Create dungeon
system "clear"
puts "Enter your name:"
my_dungeon = Dungeon.new(gets.chomp)
my_dungeon.help



#Add items ---------------------------------
my_dungeon.add_item(:spade, "Spade", "a dirty spade")
my_dungeon.add_item(:skull, "Skull", "a scary skull, with tufts of hair still stuck to the top of it")
my_dungeon.add_item(:coconut, "Coconut", "a giant hairy coconut!")
my_dungeon.add_item(:egg, "Egg", "a small yellowish egg")
# ------------------------------------------


#Add rooms ---------------------------------
my_dungeon.add_room(:large_cave, "Large Cave", "a large cavernous cave", { :west => :small_cave }, [:spade, :skull])
my_dungeon.add_room(:small_cave, "Small Cave", "a small claustrophobic cave", { :east => :large_cave, :south => :medium_cave }, [:coconut])
my_dungeon.add_room(:medium_cave, "Medium Cave", "a medium sized cave", { :north => :small_cave, :east => :long_tunnel, :south => :short_tunnel }, [])

	#Rooms to the east of medium cave
	my_dungeon.add_room(:long_tunnel, "Long Tunnel", "a long dark tunnel", { :west => :medium_cave, :east => :tiny_cave }, [:egg])
	my_dungeon.add_room(:tiny_cave, "Tiny Cave", "a very small cave, you can barely stand up in", { :west => :long_tunnel, :north => :medium_cellar }, [])
	my_dungeon.add_room(:medium_cellar, "Medium Cellar", "an average sized cellar", { :south => :tiny_cave, :north => :small_cellar, :east => :large_cellar }, [])

		#Rooms to the north of medium cellar
		my_dungeon.add_room(:small_cellar, "Small Cellar", "a small cellar", { :south => :medium_cellar }, [])

		#Rooms to the east of medium cellar
		my_dungeon.add_room(:large_cellar, "Large Cellar", "a large cellar", { :west => :medium_cellar }, [])

	#Rooms to the south of medium cave
	my_dungeon.add_room(:short_tunnel, "Short Tunnel", "a short, wide tunnel", { :north => :medium_cave, :south => :waterfall_cave }, [])
	my_dungeon.add_room(:waterfall_cave, "Waterfall Cave", "a cave with a large waterfall to the side", { :north => :short_tunnel, :east => :hidden_cave }, [])
	my_dungeon.add_room(:hidden_cave, "Hidden Cave", "a secret cave hidden behind the waterfall", { :west => :waterfall_cave }, [])
# -----------------------------------------


#Start the dungeon
my_dungeon.start(:large_cave)

#my_dungeon.show_current_description
#STDOUT.flush

command = :go
object = :nothing
while command != :exit
	my_dungeon.show_current_description
	my_dungeon.arrive_in_room
	
	puts "\nType your command:"
	input = gets.chomp
	system "clear"
	
	command = input.scan(/\w+/)[0].to_sym if input.scan(/\w+/)[0] != nil
	object = input.scan(/\w+/)[1].to_sym if input.scan(/\w+/)[1] != nil
	
	if command == :inventory
		my_dungeon.show_inventory
	elsif command == :look
		my_dungeon.look_around
	elsif command == :pickup
		my_dungeon.pickup_item(object)
	elsif command == :drop
		my_dungeon.drop_item(object)
	elsif command == :help
		my_dungeon.help
	elsif command != :exit
		my_dungeon.go(object)
	end
end


#Debug command below
#debugger



system "clear"
puts "Bye " + my_dungeon.player.name
puts "Come again soon!\n\n"




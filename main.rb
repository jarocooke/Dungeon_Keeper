#require 'rubygems'
#require 'debugger'

require_relative 'src/dungeon'

#Create dungeon
system "clear"
puts "Enter your name:"
my_dungeon = Dungeon.new(gets.chomp)
my_dungeon.help



#Add items ---------------------------------
my_dungeon.add_item({reference: :spade, name: "Spade", description: "a dirty spade"})
my_dungeon.add_item({reference: :skull, name: "Skull", description: "a scary skull, with tufts of hair still stuck to the top of it"})
my_dungeon.add_item({reference: :coconut, name: "Coconut", description: "a giant hairy coconut!"})
my_dungeon.add_item({reference: :egg, name: "Egg", description: "a small yellowish egg"})
# ------------------------------------------


#Add rooms ---------------------------------
my_dungeon.add_room({reference: :large_cave, name: "Large Cave", description: "a large cavernous cave", connections: { :west => :small_cave }, items: [:spade, :skull]})
my_dungeon.add_room({reference: :small_cave, name: "Small Cave", description: "a small claustrophobic cave", connections: { :east => :large_cave, :south => :medium_cave }, items: [:coconut]})
my_dungeon.add_room({reference: :medium_cave, name: "Medium Cave", description: "a medium sized cave", connections: { :north => :small_cave, :east => :long_tunnel, :south => :short_tunnel }, items: []})

	#Rooms to the east of medium cave
	my_dungeon.add_room({reference: :long_tunnel, name: "Long Tunnel", description: "a long dark tunnel", connections: { :west => :medium_cave, :east => :tiny_cave }, items: [:egg]})
	my_dungeon.add_room({reference: :tiny_cave, name: "Tiny Cave", description: "a very small cave, you can barely stand up in", connections: { :west => :long_tunnel, :north => :medium_cellar }, items: []})
	my_dungeon.add_room({reference: :medium_cellar, name: "Medium Cellar", description: "an average sized cellar", connections: { :south => :tiny_cave, :north => :small_cellar, :east => :large_cellar }, items: []})

		#Rooms to the north of medium cellar
		my_dungeon.add_room({reference: :small_cellar, name: "Small Cellar", description: "a small cellar", connections: { :south => :medium_cellar }, items: []})

		#Rooms to the east of medium cellar
		my_dungeon.add_room({reference: :large_cellar, name: "Large Cellar", description: "a large cellar", connections: { :west => :medium_cellar }, items: []})

	#Rooms to the south of medium cave
	my_dungeon.add_room({reference: :short_tunnel, name: "Short Tunnel", description: "a short, wide tunnel", connections: { :north => :medium_cave, :south => :waterfall_cave }, items: []})
	my_dungeon.add_room({reference: :waterfall_cave, name: "Waterfall Cave", description: "a cave with a large waterfall to the side", connections: { :north => :short_tunnel, :east => :hidden_cave }, items: []})
	my_dungeon.add_room({reference: :hidden_cave, name: "Hidden Cave", description: "a secret cave hidden behind the waterfall", connections: { :west => :waterfall_cave }, items: []})
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




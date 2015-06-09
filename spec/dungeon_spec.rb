require 'dungeon'

describe 'Dungeon' do
	
	let(:dungeon){Dungeon.new("James")} #shortcut so that all the tests below will know that dungeon references a new instance of dungeon
	
	it 'can add a room' do
		dungeon.add_room({reference: :large_cave, name: "Large Cave", description: "a large cavernous cave", connections: { :west => :small_cave }, items: [:spade, :skull]})
		expect(dungeon.rooms.length).to equal(1)
	end
	
	it 'can add items to the dungeon' do
		dungeon.add_item ({reference: :spade, name: "Spade", description: "a dirty spade"})
		expect(dungeon.items.length).to equal(1)
	end
	
	#Another way fo doing the first one
	it 'can add a room' do
		expect{ dungeon.add_room({stuff: :something}) }.to change{dungeon.rooms.length}.from(0).to(1)
	end
	
end
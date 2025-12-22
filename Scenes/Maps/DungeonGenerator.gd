extends Node

enum RoomTypes{
	Hallway,
	Spawn,
	Electrical,
}

enum RoomDirection{
	Positive_X,
	Negative_X,
	Positive_Y,
	Negative_Y,
}

class Room:
	var type: RoomTypes
	var area_in_region: Rect2i
	var paths: Array[Vector2i]
	
	func _init(room_type, room_area, room_paths):
		type = room_type
		self.area_in_region = room_area
		self.paths.append_array(room_paths)

class Region:
	var area: Rect2i
	var grid: AStarGrid2D
	var rooms: Array[Room]
	
	func print_region():
		for x in range(grid.region.position[0], grid.region.end[0]):
			var string_value = ""
			for y in range(grid.region.position[1], grid.region.end[1]):
				if grid.is_in_bounds(x, y):
					string_value += 'x ' if grid.is_point_solid(Vector2i(x, y)) else 'o '
					# Can't print without new line for some reason?
				else:
					string_value += "?"
			print(string_value)
		
	func _init(given_area: Rect2i, entrance = [Room]):
		grid = AStarGrid2D.new() # doesn't have per cel directions so multiply each room by three to enable doors. 
		area = given_area.grow(3) 
		grid.region = area
		grid.update()
		grid.fill_solid_region(area, true) # start everything as blocked
		crawl(entrance[0])
		
	func crawl(start: Room):
		for x in range(start.area_in_region.size[0] - 2): # for every square besides the corners
			for y in range(start.area_in_region.size[1] - 2):
				grid.set_point_solid(start.area_in_region.position + Vector2i(x, y), false) # set as walk-able
		for path in start.paths:
			grid.set_point_solid(start.area_in_region.position + path, false) # set as walk-able
		
func generate_dungeon():
	var spawn_room = Room.new(RoomTypes.Spawn, Rect2i(0, 0, 3, 3), [])
	var spawn_region = Region.new(Rect2i(-5, -5, 10, 10), [spawn_room])
	spawn_region.print_region()
	
func _ready():
	generate_dungeon()	

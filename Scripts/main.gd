extends Node3D

var player_node = preload("res://Scenes/player.tscn")
var monster_nodes = [
	preload("res://Scenes/monster.tscn")
]

var monster_spawn_point: Vector3
var monsters = []
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	var spawn_point = $PlayerSpawnPoint
	monster_spawn_point = $MonsterSpawnPoint.position
	player = player_node.instantiate()
	player.spawn(spawn_point.position)
	add_child(player)
	
func add_monster():
	print("Added monster")
	var monster_instance = monster_nodes[0].instantiate()
	monster_instance.position = monster_spawn_point
	monster_instance.target = player
	add_child(monster_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"): # enter
		add_monster()
	

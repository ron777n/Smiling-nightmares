extends Node3D

@export var target: Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	#var rotation = player.position - position
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(target.position)
	

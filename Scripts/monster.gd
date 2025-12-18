extends CharacterBody3D
@export var target: Node3D

func _ready():
	pass

func _process(_delta):
	look_at(target.position)
	

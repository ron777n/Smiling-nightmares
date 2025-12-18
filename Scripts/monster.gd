extends CharacterBody3D

@export var other_target: Node3D

func _process(_delta):
	look_at(other_target.position)
	velocity.angle_to(rotation)

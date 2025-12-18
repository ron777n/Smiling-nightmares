extends Node3D

@onready var target: CharacterBody3D = $Player


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().call_group("monster", "target_position", target.global_transform.origin)

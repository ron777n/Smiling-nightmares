extends Node3D

@onready var roof: MeshInstance3D = $Walls/Roof

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	roof.visible = true

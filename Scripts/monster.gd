<<<<<<< HEAD
extends Node3D

@export var target: Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	#var rotation = player.position - position
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	look_at(target.position)
=======
extends CharacterBody3D

@export var other_target: Node3D
@onready var nav: NavigationAgent3D = $NavigationAgent3D

var speed = 3400
var _gravity = 9.8
func _process(_delta):
	look_at(other_target.position)
	if not is_on_floor():
		velocity.y -= _gravity * _delta
	else :
		velocity.y -= 2
	var next_loc = nav.get_next_path_position()
	var current_loc = global_transform.origin
	var new_vel = (next_loc - current_loc).normalized() * speed
	velocity = velocity.move_toward(new_vel,0.25)
	
	move_and_slide()

func target_pos(target):
	nav.target_position = target
>>>>>>> 0c5b8117fa160c3f5d2f5e42179c7f70f4403858

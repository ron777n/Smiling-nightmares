extends Node3D
@onready var audio_stream1: AudioStreamPlayer3D = $AudioStreamPlayer3D
@onready var audio_stream2: AudioStreamPlayer3D = $AudioStreamPlayer3D2
@onready var anim: AnimationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_area_3d_body_shape_entered(_body_rid: RID, _body: Node3D, _body_shape_index: int, _local_shape_index: int) -> void:
	audio_stream1.play()
	anim.play("Spin")
	await get_tree().create_timer(26.24).timeout
	audio_stream2.play()
	anim.stop()

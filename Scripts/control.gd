extends Control


@onready var audio: AudioStreamPlayer2D = $"../AudioStreamPlayer2D"
@onready var jumpscare: TextureRect = $TextureRect
func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Maps/Map_1.tscn")


func _on_quit_pressed() -> void:
	
	get_tree().quit()


func _on_hit_me_pressed() -> void:
	audio.play()
	jumpscare.visible = true
	await get_tree().create_timer(3.0).timeout
	jumpscare.visible = false

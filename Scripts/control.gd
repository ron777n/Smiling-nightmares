extends Control


@onready var audio: AudioStreamPlayer2D = $"../AudioStreamPlayer2D"

func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Maps/Map_1.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_hit_me_pressed() -> void:
	#audio.play()
	pass

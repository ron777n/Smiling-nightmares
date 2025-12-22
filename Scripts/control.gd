extends Control


@onready var audio: AudioStreamPlayer2D = $"../AudioStreamPlayer2D"
@onready var jumpscare: TextureRect = $TextureRect

func _ready():
	randomize()

func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Maps/Map_1.tscn")


func _on_quit_pressed() -> void:
	var probability : int = 50
	if ((randi() % probability) == (probability - 1)):
		audio.play()
		jumpscare.visible = true
		await get_tree().create_timer(3.0).timeout
		jumpscare.visible = false
	
	get_tree().quit()

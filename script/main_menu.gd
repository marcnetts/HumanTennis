extends Control

@onready var play: Button = $VBoxContainer/Play

func _ready() -> void:
	play.grab_focus()


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/main.tscn")


func _on_fullscreen_pressed() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

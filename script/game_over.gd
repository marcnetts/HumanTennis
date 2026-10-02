class_name GameOverScreen
extends Control

@onready var game_over_label: RichTextLabel = $VBoxContainer/GameOverLabel

func update_game_over_text(_text: String) -> void:
	game_over_label.text = _text

func _on_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	

extends Node2D

var score_player: int = 0
var score_bot: int = 0

signal ball_resetted
@export var max_score: int = 3

@onready var goal_player_sound: AudioStreamPlayer2D = $GoalPlayerSound
@onready var goal_bot_sound: AudioStreamPlayer2D = $GoalBotSound
@onready var score_label: RichTextLabel = %ScoreLabel
@onready var game_over: GameOverScreen = %GameOver


func _ready() -> void:
	ball_resetted.emit()
	update_score()
	game_over.hide()


func _on_goal_left_body_entered(body: Node2D) -> void:
	reset_ball(body)
	goal_bot_sound.play()
	score_player += 1
	update_score()


func _on_goal_right_body_entered(body: Node2D) -> void:
	reset_ball(body)
	goal_player_sound.play()
	score_bot += 1
	update_score()


func reset_ball(body):
	body.global_position = Vector2(325.0, 183.0)
	ball_resetted.emit()


func update_score() -> void:
	var score_text: String = str(score_player, " / ", score_bot)
	score_label.text = score_text
	
	var tween: Tween = create_tween()
	tween.tween_property(score_label, "offset_transform_scale", Vector2.ONE, 0.2).from(Vector2.ONE * 1.5)
	
	if score_player >= max_score or score_bot >= max_score:
		game_over.update_game_over_text("GAME OVER!\n" + score_text)
		get_tree().paused = true
		game_over.show()
		
	

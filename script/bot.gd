extends CharacterBody2D

@onready var ball: CharacterBody2D = $"../Ball"

func _physics_process(delta: float) -> void:
	#global_position.y = ball.global_position.y
	var direction = global_position.direction_to(ball.global_position) * Vector2 (0, 1)
	velocity.y = direction.normalized().y * 230
	move_and_slide()

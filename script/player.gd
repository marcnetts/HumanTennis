extends CharacterBody2D


func _physics_process(delta: float) -> void:
	var direction: float = Input.get_axis("move_up", "move_down")
	velocity.y = 500 * direction
	move_and_slide()

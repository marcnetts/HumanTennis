extends CharacterBody2D

@onready var hit_sound: AudioStreamPlayer2D = $HitSound

var direction: Vector2 = Vector2(-1, 1).normalized()
const BASE_SPEED = 500
var speed: float = BASE_SPEED


func _physics_process(delta: float) -> void:
	velocity = direction * speed
	move_and_slide()
	
	if get_slide_collision_count() > 0:
		var normal = get_last_slide_collision().get_normal()
		direction = direction.bounce(normal)
		hit_sound.play()


func _on_ball_resetted() -> void:
	speed = 0
	await get_tree().create_timer(1.0).timeout
	speed = BASE_SPEED

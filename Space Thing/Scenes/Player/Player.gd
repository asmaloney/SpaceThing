extends KinematicBody2D

export var speed: int = 220

onready var _collision_x_extents: int = get_node("CollisionShape2D").shape.extents.x
onready var _screen_size: Vector2 = get_viewport_rect().size


func _process(delta: float) -> void:
	var velocity: Vector2 = Vector2()
	var changed: bool = false

	if Input.is_action_pressed("input_right"):
		velocity.x += 1
		changed = true

	if Input.is_action_pressed("input_left"):
		velocity.x -= 1
		changed = true

	if !changed:
		return
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	position += velocity * delta

	position.x = clamp(position.x, 0 + _collision_x_extents, _screen_size.x - _collision_x_extents)
	position.y = clamp(position.y, 0, _screen_size.y)

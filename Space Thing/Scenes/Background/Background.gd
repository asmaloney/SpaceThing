extends ParallaxBackground


export var camera_velocity: Vector2 = Vector2( 0, 100 );


func _process(delta: float) -> void:
	var new_offset: Vector2 = get_scroll_offset() + camera_velocity * delta
	set_scroll_offset( new_offset )

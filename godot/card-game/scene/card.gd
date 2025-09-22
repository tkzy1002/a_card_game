extends Control

var velocity = Vector2.ZERO
var damping = 0.35
var stiffness = 500


enum cardState{following,dragging}
@export var cardCurrentState = cardState.following


var follow_target

func _process(delta: float) -> void:
	match cardState:
		cardState.dragging:
			var target_position=get_global_mouse_position()-size/2
			global_position=global_position.lerp(target_position,0.4)
		cardState.following:
			if follow_target!=null:
				var target_posision=follow_target.global_possion
				var displacement = target_posision - global_position
				var force = displacement * stiffness
				velocity += force * delta
				velocity *= (1.0 - damping)
				global_position += velocity * delta

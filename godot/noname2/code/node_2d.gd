extends Node2D


func _process(delta: float) -> void:
	if Global.level == 1:
		queue_free()
		pass

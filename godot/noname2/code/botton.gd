extends Button



#func _process(delta: float) -> void:
	#if Global.game_start == true:
		#queue_free()

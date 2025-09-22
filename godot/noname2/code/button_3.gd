extends Button


#func _process(delta: float) -> void:
	#if Global.game_start == true:
		#queue_free()

func _on_button_down() -> void:
	get_tree().quit()
	print("test2")
	pass

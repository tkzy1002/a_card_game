extends Control



func _on_button_2_button_down() -> void:
	print("test3")
	var load_first_scene = PreLoad.load_scene2.instantiate()
	get_tree().root.add_child.call_deferred(load_first_scene)
	pass



 



	

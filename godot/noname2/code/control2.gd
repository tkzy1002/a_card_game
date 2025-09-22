extends Control




func _on_button_button_down() -> void:
	var load_level1 = PreLoad.load_level1.instantiate()
	get_tree().root.add_child.call_deferred(load_level1)
	print("test5")
	
	
	
	var load_card_desk = PreLoad.load_card_desk.instantiate()
	get_tree().root.add_child.call_deferred(load_card_desk)
	print("test6")

extends Node2D

var mouse_in = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.





func _input(event: InputEvent) -> void:
	if event.is_action_pressed("mouse_left_botton"):
		if mouse_in == true:
			Global.game_start = true
			print("test1")
			if Global.game_start == true:
				print("test2")






func mouse_enter() -> void:
	mouse_in = true


func _on_area_2d_mouse_exited() -> void:
	mouse_in = false
	

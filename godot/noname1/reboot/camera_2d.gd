extends Camera2D

@export var move_speed = 100

func _physics_process(delta: float) -> void:
	if Global.game_start == true:
		print("test3")
		

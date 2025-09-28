extends Control
class_name card

var velocity = Vector2.ZERO
var damping = 0.35
var stiffness = 500

var preDeck 

@export var cardClass:String
@export var cardName:String
@export var maxStackNum:int
@export var cardWeight:float
@export var cardInfo:Dictionary
@export var price:int
@export var pickButton:Button




enum cardState{following,dragging}
@export var cardCurrentState = cardState.following


@export var follow_target:Node
var whichDeckMouseIn

func _process(delta: float) -> void:
	match cardCurrentState:
		cardState.dragging:
			var target_position = get_global_mouse_position()-size/2
			#print("test3")
			global_position = global_position.lerp(target_position,0.4)
			
			var mouse_position = get_global_mouse_position()
			var nodes = get_tree().get_nodes_in_group("cardDropable")
			for node in nodes:
				if node.get_global_rect().has_point(mouse_position)&&node.visible==true:
					whichDeckMouseIn=node
		cardState.following:
			if follow_target!=null:
				follow(follow_target.global_position,delta)



func follow(target_position:Vector2,delta:float):
		var displacement = target_position - global_position
		var force = displacement * stiffness
		velocity += force * delta
		velocity *= (1.0 - damping)
		global_position += velocity * delta

func _on_button_button_down() -> void:
	cardCurrentState = cardState.dragging
	if follow_target!=null:
		follow_target.queue_free()
	#print("test1")
	pass



func _on_button_button_up() -> void:
	
	if whichDeckMouseIn!=null:
		whichDeckMouseIn.add_card(self)
	else:
		if preDeck!=null:
			preDeck.add_card(self)

	
	cardCurrentState = cardState.following
	#print("test2")
	pass


func initCard(Nm) -> void:
	cardInfo=cardInfos.infosDic[Nm]
	cardWeight=float(cardInfo["base_cardWeight"])
	cardClass=cardInfo["base_cardClass"]
	cardName=cardInfo["base_cardName"]
	maxStackNum=int(cardInfo["base_maxStack"])
	cardCurrentState=cardState.following
	drawCard()

func drawCard():
	
	#print(cardInfo)
	pickButton=$Button
	var imgPath="res://cardimg/"+str(cardName)+".png"
	$Panel/ColorRect/itemImg.texture=load(imgPath)
	$Panel/ColorRect/name.text=cardInfo[ "base_displayName"]

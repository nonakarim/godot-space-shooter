extends CanvasLayer

static var image = load("res://Graphics/PNG/playerShip2_orange.png")

func set_health(amount):
	#Remove all children
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
	
	#Add new children set by health	
	for i in amount:
		var texRect = TextureRect.new()
		texRect.texture = image
		
		$MarginContainer2/HBoxContainer.add_child(texRect)
		texRect.stretch_mode = TextureRect.STRETCH_KEEP
		
func set_score(score): 
	$MarginContainer/Label.text = "Score: " + str(score)
	
func set_laser_count(laser):
	$MarginContainer3/Label.text = "Lasers left: " + str(laser)

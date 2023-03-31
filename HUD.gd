extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	$Coins.text = "00"
	update_health(2)
	

func update_health(health):
	$Health.value = health


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Coin_coin_collected():
	$Coins.text = str(int($Coins.text) + 1)

func _on_Area2D_win_condition():
	show_message("Level Complete")
	
	pass # Replace with function body.
	
func show_message(text):
	$Message.text = text
	$Message.show()
	$Message_Timer.start()
	

func _on_Message_Timer_timeout():
	get_tree().reload_current_scene()

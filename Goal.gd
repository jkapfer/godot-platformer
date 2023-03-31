extends Area2D

signal win_condition

func _ready():
	pass

func _on_Area2D_body_entered(body):
	emit_signal("win_condition")

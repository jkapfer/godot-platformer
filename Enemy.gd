extends KinematicBody2D

const GRAVITY = 1100
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	velocity.y += delta*GRAVITY
	move_and_slide(velocity, Vector2.UP)

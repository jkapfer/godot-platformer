extends KinematicBody2D

const GRAVITY = 650sss
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	velocity.y += delta*GRAVITY
	velocity = move_and_slide(velocity, Vector2.UP)

func _on_Hurtbox_body_entered(body):
	$AnimatedSprite.play("ded")
	
	set_collision_layer_bit(2,false)
	set_collision_mask_bit(0,false)
	yield(get_tree().create_timer(2), 'timeout')
	queue_free()	

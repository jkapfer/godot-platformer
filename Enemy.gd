extends KinematicBody2D

const GRAVITY = 650
var velocity = Vector2.ZERO
enum DirectionEnum {
	LEFT=-1,
	RIGHT=1
}
export(DirectionEnum) var direction

# Called when the node enters the scene tree for the first time.
func _ready():
	if direction == DirectionEnum.RIGHT:
		$AnimatedSprite.flip_h = true
	$floor_check.position.x = $CollisionShape2D.shape.get_extents().x * direction

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	if is_on_wall() or not $floor_check.is_colliding():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
	$floor_check.position.x = $CollisionShape2D.shape.get_extents().x * direction
	
	velocity.y += delta*GRAVITY
	
	velocity.x = 50*direction
	
	velocity = move_and_slide(velocity, Vector2.UP)

func _on_Hurtbox_body_entered(body):
	$AnimatedSprite.play("ded")
	
	set_collision_layer_bit(2,false)
	set_collision_mask_bit(0,false)
	velocity.x = 0
	body.bounce()
	
	yield(get_tree().create_timer(2), 'timeout')
	queue_free()	

extends Area2D

const SPEED = 800
#Trying to put gravity on fireball
const GRAVITY = 100
var velocity = Vector2();
var direction = 1;
var gscale = 5;
#Added motion to try to apply gravity to fireball
var motion = Vector2();

func set_gravity_scale(scale):
	gscale = scale	


func _ready():
	pass

func set_fireball_direction(dir):
	direction = dir	
	if dir == -1:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false 

func _physics_process(delta):
	velocity.x = SPEED * delta	* direction
	#Trying to apply gravity in the same way as player
	motion.y += GRAVITY
	
	translate(velocity)
	$AnimatedSprite.play("shoot")	

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Fireball_body_entered(body):
	if "Enemy" in body.name:
		body.dead(1)
		
	queue_free()

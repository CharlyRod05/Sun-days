extends Node

@export var astroman_scene: PackedScene

var modify_timer
var mob_scale

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modify_timer = false
	$MobTimer.start()
	$MobTimer.wait_time = 0.2
	mob_scale = 0.8

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if modify_timer:
		# $Timer.wait_time = randf_range(4, 8) 
		modify_timer = false

func _on_mob_timer_timeout() -> void:
	modify_timer = true
	
	 # Create a new instance of the Mob scene.
	var mob = astroman_scene.instantiate()

	# Choose a random location on Path2D.
	var mob_spawn_location = $World/EntityPath/EntitySpawnLocation
	mob_spawn_location.progress_ratio = randf()

	# Set the mob's position to the random location.
	mob.position = mob_spawn_location.position
	mob.scale = Vector2(mob_scale,mob_scale)

	# Set the mob's direction perpendicular to the path direction.
	var direction = mob_spawn_location.rotation

	# Add some randomness to the direction.
	# direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction

	# Spawn the mob by adding it to the Main scene.
	# $World/Sprite2D.add_child(mob)
	$World.add_child(mob)

extends Node

@export var astroman_scene: PackedScene
@export var plant_scene: PackedScene

var a_modify_timer
var p_modify_timer
var mob_scale

var FIRST_PLANT_SPAWN = 5
var FIRST_ASTROMAN_SPAWN = 2
var ASTROMAN_SPAWN_TIME_LO = 20
var ASTROMAN_SPAWN_TIME_HI = 25
var PLANT_AFTER_ASTROMAN_TIME_LO = 7
var PLANT_AFTER_ASTROMAN_TIME_HI = 10


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	a_modify_timer = false
	p_modify_timer = false
	$AstromanTimer.wait_time = FIRST_ASTROMAN_SPAWN
	$PlantTimer.wait_time = FIRST_PLANT_SPAWN
	$AstromanTimer.start()
	$PlantTimer.start()
	$AudioStreamPlayer.play()
	mob_scale = 0.8

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if a_modify_timer:
		$AstromanTimer.wait_time = randf_range(ASTROMAN_SPAWN_TIME_LO, ASTROMAN_SPAWN_TIME_HI)
		a_modify_timer = false
	if p_modify_timer:
		$PlantTimer.wait_time = randf_range(PLANT_AFTER_ASTROMAN_TIME_LO, PLANT_AFTER_ASTROMAN_TIME_HI)
		p_modify_timer = false

func _on_mob_timer_timeout() -> void:
	a_modify_timer = true
	
	 # Create a new instance of the Mob scene.
	var mob = astroman_scene.instantiate()

	# Choose a random location on Path2D.
	var mob_spawn_rotation
	mob_spawn_rotation = randf_range(0,2*PI)

	# Set the mob's position to the random location.
	
	mob.get_node("Pivot").rotation = mob_spawn_rotation 
	mob.get_node("Pivot").position = Vector2(0,0)
	mob.scale = Vector2(mob_scale,mob_scale)
	# Set the mob's direction perpendicular to the path direction.


	# Add some randomness to the direction.
	# direction += randf_range(-PI / 4, PI / 4)
	

	# Spawn the mob by adding it to the Main scene.
	# $World/Sprite2D.add_child(mob)
	$World.add_child(mob)


func _on_plant_timer_timeout() -> void:
	p_modify_timer = true
	
	 # Create a new instance of the Mob scene.
	var mob = plant_scene.instantiate()

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

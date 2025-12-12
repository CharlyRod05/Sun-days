extends Area2D

@export var astroman_scene: PackedScene

var modify_timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("RotatePlanetLeft"):
		rotation_degrees += -60 * delta
	if Input.is_action_pressed("RotatePlanetRight"):
		rotation_degrees += 60 * delta

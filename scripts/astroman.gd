extends Area2D
@export var speed = 400
var screen_size
var ratio_hambre
var hambreActual

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	ratio_hambre = 0.1
	$Hambre.value = 100
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	$Hambre.value -= ratio_hambre
	if $Hambre.value == 0:
		queue_free()
	

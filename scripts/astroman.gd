extends Area2D
@export var speed = 400
var screen_size
var ratio_hambre
var hambreado
var inactivo

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	ratio_hambre = 0.001
	$Hambre.value = 100
	hambreado = false
	inactivo = true
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	$Hambre.value -= ratio_hambre
	
	if $Hambre.value == 0:
		queue_free()
	if inactivo: 
		if !hambreado:
			deambulando()
		
		
func deambulando() -> void:
	var direccion = randf_range(0,2)
	match direccion:
		0:#izquierda
			position += Vector2(1,0)
		1:
			pass
		2:
			pass
		_:
			pass

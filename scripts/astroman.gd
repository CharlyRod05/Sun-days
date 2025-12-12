extends Area2D
@export var speed = 0.1
var screen_size
var ratio_hambre
var hambreado
var caminando
var direccion



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	ratio_hambre = 0.01
	$Pivot/AnimatedSprite2D/Hambre.value = 100
	hambreado = false
	caminando = false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	$Pivot/AnimatedSprite2D/Hambre.value -= ratio_hambre
	
	if $Pivot/AnimatedSprite2D/Hambre.value == 0:
		queue_free()
	if $Pivot/AnimatedSprite2D/Hambre.value <= 25:
		hambreado = true
	else:
		hambreado = false
		
			
	if caminando:
		match direccion:
			0:  # izquierda
				$Pivot.rotation += speed * delta
				$Pivot/AnimatedSprite2D.flip_h = false
				$Pivot/AnimatedSprite2D.play("walking")
			1:  # derecha
				$Pivot.rotation -= speed * delta
				$Pivot/AnimatedSprite2D.flip_h = true
				$Pivot/AnimatedSprite2D.play("walking")
	else:
		$Pivot/AnimatedSprite2D.play("standing")


func _on_timer_pasos_timeout() -> void:
	if hambreado:
		caminando = false
		return# Replace with function body.
		# Decidimos si se mueve en este ciclo
	direccion = randi() % 3

	# Decide aleatoriamente si caminar o quedarse quieto
	caminando = direccion != 2

	# Cambia el tiempo para el siguiente movimiento
	$TimerPasos.wait_time = randf_range(1.5, 4.0)

extends Area2D
var dentro
var ratio_planta_crecido
var ratio_planta_decrecido

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dentro = false
	ratio_planta_crecido = 0.3
	ratio_planta_decrecido = 0.1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $ProgressBar.value >= 0 && $ProgressBar.value<25:
		$AnimatedSprite2D.frame = 0
	if $ProgressBar.value >= 25 && $ProgressBar.value<50:
		$AnimatedSprite2D.frame = 1
	if $ProgressBar.value >= 50 && $ProgressBar.value<75:
		$AnimatedSprite2D.frame = 2
	if $ProgressBar.value >= 75 && $ProgressBar.value<=100:
		$AnimatedSprite2D.frame = 3
		
	if dentro:
		$ProgressBar.value += ratio_planta_crecido
	else:
		$ProgressBar.value -= ratio_planta_decrecido
		
		


func _on_rayo_de_sol_area_entered(area: Area2D) -> void:
	dentro = true


func _on_rayo_de_sol_area_exited(area: Area2D) -> void:
	dentro = false

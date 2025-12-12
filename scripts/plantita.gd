extends Area2D
var dentro
var ratio_planta_crecido
var ratio_planta_decrecido

var sPlant1
var sPlant2
var sPlant3
var sPlant4

var previous_plant_frame

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dentro = false
	ratio_planta_crecido = 0.3
	ratio_planta_decrecido = 0.1
	sPlant1 = load("res://Sounds/plant1.wav")
	sPlant2 = load("res://Sounds/plant2.wav")
	sPlant3 = load("res://Sounds/plant3.wav")
	sPlant4 = load("res://Sounds/plant4.wav")
	previous_plant_frame = -1
	

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
		
	if previous_plant_frame != $AnimatedSprite2D.frame:
		previous_plant_frame = $AnimatedSprite2D.frame
		if $AnimatedSprite2D.frame == 0:
			$AudioStreamPlayer2D.stream = sPlant1
		if $AnimatedSprite2D.frame == 1:
			$AudioStreamPlayer2D.stream = sPlant2
		if $AnimatedSprite2D.frame == 2:
			$AudioStreamPlayer2D.stream = sPlant3
		if $AnimatedSprite2D.frame == 3:
			$AudioStreamPlayer2D.stream = sPlant4
		$AudioStreamPlayer2D.play()
		
	if dentro:
		$ProgressBar.value += ratio_planta_crecido
	else:
		$ProgressBar.value -= ratio_planta_decrecido

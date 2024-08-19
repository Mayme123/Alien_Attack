extends Node

var lives = 3
var score = 0
@onready var player = $Player
@onready var hud = $UI/HUD

func _ready():
	hud.set_score_label(score)
	hud.set_lives_label(lives)

func _on_deathzone_area_entered(area):
	area.die()

func _on_player_took_damage():
	lives -= 1
	hud.set_lives_label(lives)
	if(lives == 0):
		print("Game Over")
		player.die()

func _on_enemy_spawner_enemy_spawned(enemy_instance):
	enemy_instance.connect("died", on_enemy_died)
	add_child(enemy_instance)
	
func on_enemy_died():
	score += 100
	hud.set_score_label(score)

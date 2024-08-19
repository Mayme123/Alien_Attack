extends Node

var lives = 3
var score = 0
@onready var player = $Player
@onready var hud = $UI/HUD

var gos_scene = preload("res://scenes/game_over_screen.tscn")

func _ready():
	hud.set_score_label(score)
	hud.set_lives_label(lives)

func _on_deathzone_area_entered(area):
	area.queue_free()

func _on_player_took_damage():
	lives -= 1
	hud.set_lives_label(lives)
	if(lives == 0):
		var gos = gos_scene.instantiate()
		player.die()
		gos.set_score(score)
		await get_tree().create_timer(1.5).timeout
		
		$UI.add_child(gos)
		

func _on_enemy_spawner_enemy_spawned(enemy_instance):
	enemy_instance.connect("died", on_enemy_died)
	add_child(enemy_instance)
	
func on_enemy_died():
	score += 100
	hud.set_score_label(score)

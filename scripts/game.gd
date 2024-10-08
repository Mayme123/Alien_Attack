extends Node

var lives = 3
var score = 0
@onready var player = $Player
@onready var hud = $UI/HUD
@onready var enemy_hit_sound = $EnemyHitSound
@onready var explode_sound = $ExplodeSound

var gos_scene = preload("res://scenes/game_over_screen.tscn")

func _ready():
	hud.set_score_label(score)
	hud.set_lives_label(lives)

func _on_deathzone_area_entered(area):
	area.queue_free()

func _on_player_took_damage():
	explode_sound.play()
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
	enemy_hit_sound.play()
	hud.set_score_label(score)


func _on_enemy_spawner_path_enemy_spawned(path_enemy_instance):
	add_child(path_enemy_instance)
	path_enemy_instance.enemy.connect("died", on_enemy_died)
	

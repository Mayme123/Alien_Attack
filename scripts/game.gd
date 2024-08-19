extends Node


func _on_deathzone_area_entered(area):
	area.die()

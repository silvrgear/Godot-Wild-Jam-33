extends Node2D

var heroes = [0,5,10] #temp
var weapons = [0,3,6]

var selected_hero
var selected_weapon

func _ready():
	randomize()
	selected_hero = heroes[randi() % heroes.size()]
	selected_weapon = weapons[randi() % weapons.size()]
	$plains_01/characters/player.hero_frame = selected_hero
	$plains_01/characters/player.weap_frame = selected_weapon
	$plains_01/characters/player.initialize_hero()
	pass 

extends Node2D

var levels = ["plains_01", "plains_02", "forest_01", "forest_02", "cave_01",
				"castle_01", "castle_02"]
var curr_level = 5

var heroes = [0,5,10] #temp
var weapons = [0,3,6]

var selected_hero
var selected_weapon

var new_game

func _ready():
	randomize()
	selected_hero = heroes[randi() % heroes.size()]
	selected_weapon = weapons[randi() % weapons.size()]
	var hub = load("res://scenes/hub_main.tscn")
	var x = hub.instance()
	x.new_start = true
	add_child(x)
	pass 

func change_to_next_scene():
	curr_level += 1
	if curr_level == 7:
		get_parent().get_node("label").show()
		return
	get_child(0).queue_free()
	
	var level = load("res://scenes/" + levels[curr_level] + ".tscn")
	var x = level.instance()
	add_child(x)
	
	x.get_node("characters/player").hero_frame = selected_hero
	x.get_node("characters/player").weap_frame = selected_weapon
	x.get_node("characters/player").initialize_hero()
	pass

func go_back_to_hub():
	get_child(0).queue_free()
	
	var hub = load("res://scenes/hub_main.tscn")
	var x = hub.instance()
	x.new_start = false
	add_child(x)
	pass

func reload_this_scene(path):
	get_child(0).queue_free()
	
	var scn = load(path)
	var x = scn.instance()
	add_child(x)
	
	x.get_node("characters/player").hero_frame = selected_hero
	x.get_node("characters/player").weap_frame = selected_weapon
	x.get_node("characters/player").initialize_hero()









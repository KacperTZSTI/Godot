extends Node

@onready var menu = load("res://sound/music/MENU.mp3")
@onready var city = load("res://sound/music/CITY.mp3")
@onready var park = load("res://sound/music/PARK.mp3")
@onready var mall = load("res://sound/music/MALL.mp3")
@onready var what = load("res://sound/music/OUT 0003 [2023-11-18 144823]-1.mp3")

func set_volume(vol):
	$AudioStreamPlayer.volume_db = vol

func play_menu():
	$AudioStreamPlayer.stream = menu
	$AudioStreamPlayer.play()

func play_city():
	$AudioStreamPlayer.stream = city
	$AudioStreamPlayer.play()
	
func play_park():
	$AudioStreamPlayer.stream = park
	$AudioStreamPlayer.play()
	
func play_mall():
	$AudioStreamPlayer.stream = mall
	$AudioStreamPlayer.play()
	
func play_w():
	$AudioStreamPlayer.stream = what
	$AudioStreamPlayer.play()

extends Node

@onready var menu = load("res://music/MENU.mp3")
@onready var city = load("res://music/CITY.mp3")
@onready var park = load("res://music/PARK.mp3")
@onready var mall = load("res://music/MALL.mp3")
@onready var what = load("res://music/CITY.mp3")


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

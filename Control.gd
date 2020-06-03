extends Control

# Godot seems so refuse to export most Soundfiles such as .wav, .ogg that are 
# stored inside the project (even if specified in the export settings).
# Instead we have to use an AudioStreamSample-Ressource.
# To get it drag a sound file into an AudioStreamPlayer, make it unique and 
# then save it to disk.
# Run the project in the editor vs. an built version (e.g. as html or Windows)
# to see that the .wav is not in the directory if exported.


func _ready():
	$Label.text = audio_contents()


func audio_contents():
	var text = ""
	var dir = Directory.new()
	if dir.open("res://audio/") == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				text += "Found directory: " + file_name + "\n"
			else:
				text += "Found file: " + file_name + "\n"
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
	return text

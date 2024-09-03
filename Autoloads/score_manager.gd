extends Node


const high_score_file = "user://high_score.save"

func save_score(score: int) -> void:
	var high_score = load_score()
	if score < high_score:
		return

	var file = FileAccess.open(high_score_file, FileAccess.WRITE)
	file.store_32(score)
	file.close()

func load_score() -> int:

	# checkœ if the file exists
	if not FileAccess.file_exists(high_score_file):
		return 0

	var file = FileAccess.open(high_score_file, FileAccess.READ)
	
	

	var score =  file.get_32()
	file.close()
	return score
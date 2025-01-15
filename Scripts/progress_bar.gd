extends ProgressBar

@onready var player_stats = get_node("../../Player").player_stats

func _ready():
	GlobalSignals.connect("player_health_changed",_on_player_health_changed)	
	value = player_stats.current_health
	max_value = player_stats.max_health

func _on_player_health_changed():
	value = player_stats.current_health
	max_value = player_stats.max_health

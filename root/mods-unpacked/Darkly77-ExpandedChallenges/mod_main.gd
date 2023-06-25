extends Node

const EXTCH_LOG = "Darkly77-ExpandedChallenges"
var dir = ""

# Boilerplate
# =============================================================================

func _init(modLoader = ModLoader):
	ModLoaderLog.info("Init", EXTCH_LOG)

	dir = ModLoaderMod.get_unpacked_dir() + "Darkly77-ExpandedChallenges/"

	_install_extensions(modLoader)


func _ready():
	ModLoaderLog.info("Done", EXTCH_LOG)


# Custom
# =============================================================================

func _install_extensions(modLoader):
	# TRANSLATIONS
	ModLoaderMod.add_translation(dir + "translations/mod_expandedchallenges_text.en.translation")

	# CHALLENGES
	# Eg. Danger 5 with X character
	ModLoaderMod.install_script_extension(dir + "extensions/main.gd") # Patch `clean_up_room` to run our custom challenge unlock func
	ModLoaderMod.install_script_extension(dir + "extensions/singletons/challenge_service.gd") # Challenge checks
	ModLoaderMod.install_script_extension(dir + "extensions/singletons/run_data.gd") # Patch `add_weapon` and `add_item` to check custom challenges

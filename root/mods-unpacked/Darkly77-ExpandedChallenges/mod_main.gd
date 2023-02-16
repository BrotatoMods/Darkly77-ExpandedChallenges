extends Node

const EXTCH_LOG = "Darkly77-ExpandedChallenges"
var dir = ""

# Boilerplate
# =============================================================================

func _init(modLoader = ModLoader):
	ModLoaderUtils.log_info("Init", EXTCH_LOG)

	dir = modLoader.UNPACKED_DIR + "Darkly77-ExpandedChallenges/"

	_install_extensions(modLoader)


func _ready():
	ModLoaderUtils.log_info("Done", EXTCH_LOG)


# Custom
# =============================================================================

func _install_extensions(modLoader):
	# TRANSLATIONS
	modLoader.add_translation_from_resource(dir + "translations/mod_expandedchallenges_text.en.translation")

	# CHALLENGES
	# Eg. Danger 5 with X character
	modLoader.install_script_extension(dir + "extensions/main.gd") # Patch `clean_up_room` to run our custom challenge unlock func
	modLoader.install_script_extension(dir + "extensions/singletons/challenge_service.gd") # Challenge checks
	modLoader.install_script_extension(dir + "extensions/singletons/run_data.gd") # Patch `add_weapon` and `add_item` to check custom challenges

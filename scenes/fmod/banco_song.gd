extends Node2D

@export var bank_asset: BankAsset
@export var event: EventAsset

var bank: Bank

func _enter_tree() -> void:
	bank = FMODStudioModule.get_studio_system().load_bank_file(bank_asset.file_path, FMODStudioModule.FMOD_STUDIO_LOAD_BANK_NORMAL, false)
	RuntimeManager.play_one_shot(event)

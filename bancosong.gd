extends Node3D

@export var bank_asset: BankAsset
var bank: Bank

func _enter_tree() -> void:
	bank = FMODStudioModule.get_studio_system().load_bank_file(bank_asset.file_path, FMODStudioModule.FMOD_STUDIO_LOAD_BANK_NORMAL, false)

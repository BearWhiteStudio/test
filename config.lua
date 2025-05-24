Config, Locales = {}, {}

Config.Locale = 'en' -- en / pt (not yet) / es (not yet) / fr (not yet) / de (not yet)

Config.Debug = false -- true = Debug mode to check for aditional prints

Config.DevMode = false -- If you enable dev mode, you might have some issues with the script but you can restart it in game (recommended to always use false)

Config.UseOkokTextUI = true -- true = Use okokTextUI / false = Use QBCore Draw Text

Config.UseOkokNotify = true -- true = Use okokNotify / false = Use QBCore Notify

Config.UseOkokGarage = false -- true = Use okokGarage / false = Use config settings

Config.UseOkokBilling = true -- true = Use okokBilling / false = Implement your own billing system

Config.UseOkokGasStation = true -- true = Use okokGasStation / false = Implement your own gas station system

Config.UseTarget = true -- true = Use target system / false = Use TextUI

Config.UseInteractSound = false -- true = Use interact sound / false = Don't use interact sound ( https://github.com/qbcore-framework/interact-sound )

Config.BillPlateOwner = false -- true = Bill the owner of the vehicle / false = Bill the player who is driving the vehicle

Config.ShowRadarsOnMap = false -- true = Show radars on map / false = Don't show radars on map

Config.UseKMH = true -- true = Use KMH / false = Use MPH

Config.OpenPoliceMenuComand = 'policemenu' -- Command to open the police menu

Config.OpenPoliceMenuKey = 'F6' -- Key to open the police menu

Config.CuffPlayerCommand = 'cuff' -- Command to cuff a player (set it nil if you don't want to use command and bind)

Config.CuffPlayerKey = 'Z' -- Key to cuff a player

Config.EscortPlayerCommand = 'escort' -- Command to escort a player (set it nil if you don't want to use command and bind)

Config.EscortPlayerKey = 'H' -- Key to escort a player

Config.EventPrefix = 'okokPoliceJob' -- Event prefix

Config.ContextMenuSystem = 'okok-menu' -- Context menu system ( 'okok-menu' / 'qb-menu' / 'ox-menu' )

Config.TargetSystem = 'qb-target' -- Target system ( 'qb-target' / 'ox-target' )

Config.TargetDistance = 4.5 -- The distance to use the target system

Config.StoreVehicleDistance = 15.0 -- The distance to store a vehicle

Config.InventorySystem = 'qb-inventory-new' -- Inventory system ( 'qb-inventory' / 'qb-inventory-new' / 'ox-inventory' / 'qs-inventory' )

Config.ClothingSystem = 'illenium-appearance' -- Clothing system ( 'qb-clothing' / 'illenium-appearance' )

Config.HandcuffItem = 'handcuffs' -- Handcuff item name

Config.PhoneNumberFormat = 'xxx xxx xxx' -- Phone number format

Config.KeySystem = 'qb-vehiclekeys' -- Key system ( 'qb-vehiclekeys' / 'wasabi-keys' / 'qs-vehiclekeys' / 'jaksam-keys' )

Config.TrashName = 'policetrash' -- Trash name

Config.StashName = 'policestash' -- Stash name

Config.EvidencesName = 'policeevidences' -- Evidences name

Config.EscortOnlyIfHandcuffed = false -- true = Only escort if handcuffed / false = Escort without handcuffed

Config.WarpPedIntoVehicle = false -- true = Warp ped into vehicle / false = The vehicle will be spawned near the ped

Config.SetVehicleDoorsLockedOnSpawn = false -- true = Set vehicle doors locked on spawn / false = Set vehicle doors unlocked on spawn

Config.RandomSocietyPlate = false -- true = Random society plate / false = Use the plate defined in the config

Config.UsePlayerGPSBlips = false -- true = Use player GPS blips / false = Don't use player GPS blips

Config.PlayerGPSBlip = { sprite = 6, color = 3, scale = 0.8, blipShortRange = true } -- The player GPS blip settings

Config.VehiclesBlip = { ['vehicles'] = { sprite = 225, color = 3, scale = 0.8, blipShortRange = true }, ['helicopters'] = { sprite = 43, color = 3, scale = 0.8, blipShortRange = true }, ['boats'] = { sprite = 427, color = 3, scale = 0.8, blipShortRange = true } } -- The vehicles blip settings

Config.PlacePropKey = 38 -- Key to place a prop (E)

Config.RemovePropKey = 177 -- Key to remove a prop (BACKSPACE)

Config.TackleKeys = { 21, 38 } -- Keys to tackle a player (SHIFT + E)

Config.PoliceJobs = { 'police', 'sheriff' }

Config.EmergencyJobs = { "police", "ambulance", "firefighter" } -- The jobs that won't get a bill on Radars

Config.MarkerID = 21 -- The marker ID for the job locations

Config.VehicleMarker = 36 -- The marker ID for the vehicle locations

Config.HelicopterMarker = 34 -- The marker ID for the helicopter locations

Config.BoatMarker = 35 -- The marker ID for the boat locations

Config.MarkerColors = { r = 31, g = 94, b = 255, a = 90 } -- The marker colors for the job locations

Config.StoreMarkerColors = { r = 255, g = 0, b = 0, a = 90 } -- The marker colors for the vehicle locations

Config.RemoveOwnOfficerBlip = true -- true = Remove own officer blip / false = Keep own officer blip

Config.UpdateJobBlipsInterval = 1 -- The interval to update the officer blips in seconds, lower values can cause performance issues

Config.RemoveItemsOnJail = true -- true = Remove items on jail / false = Keep items on jail

Config.CommunityServiceMaxDistance = 100 -- if the player is more than 100 meters away from the community service location, the player will be teleported to the location

Config.CommunityServiceAddedMonths = 5 -- the months added to the player's sentence if he tries to escape from the community service location

Config.HandsUpAnimation = { dict = 'missminuteman_1ig_2', anim = 'handsup_base' } -- The hands up animation

Config.UseBuiltInCommunityService = true -- true = Use built-in community service

Config.UseBuiltInPrison = true -- true = Use built-in prison

Config.PrisonSystem = 'rcore-prison' -- The prison system if you set Config.UseBuiltInPrison to false ( 'rcore-prison' only for now )

Config.UseBlips = true -- true = Use blips / false = Don't use blips

Config.AllowCuffToEveryone = false -- true = Allow cuff to everyone / false = Allow cuff only to police jobs

Config.AllowEscortToEveryone = false -- true = Allow escort to everyone / false = Allow escort only to police jobs

Config.MinigameToHandcuff = false -- true = Use minigame to handcuff / false = Use normal handcuff

Config.RemovePrisonCommand = 'removeprison' -- Command to remove a player from prison

Config.RemoveCommunityServiceCommand = 'removecommunity' -- Command to remove a player from community service

Config.MinimumGradeForCCTVAndRadars = 1 -- The minimum grade to use the CCTV and Radars

Config.MinimumGradeToClearProps = 4 -- The minimum grade to clear the props

Config.UsePlayerCapsule = true -- true = Use player capsule to have more realistic collisions

Config.UseImpoundOnMenu = true -- true = Use impound on menu / false = Use impound on vehicle

Config.FreezePlayerWhileCuffed = true -- true = Freeze player while cuffed / false = Don't freeze player while cuffed

Config.UseEscortAnimation = true -- true = Use escort animation / false = Don't use escort animation

Config.EnableCustomEscort = false -- true = Enable custom escort changeable on cl_utils.lua file (escortPlayer function) / false = Use the escort from the script

Config.EnableCustomHandcuff = false -- true = Enable custom handcuff changeable on cl_utils.lua file (cuffPlayer/uncuffPlayer functions) / false = Use the handcuff from the script

Config.PoliceObjects = {
	['Lights'] = {
		['Light'] = 'prop_worklight_01a',
		['Light 2'] = 'prop_worklight_02a',
	},
	['Cones'] = {
		['Cone'] = 'prop_roadcone02a',
		['Cone 2'] = 'prop_air_conelight'
	},
	['Barriers'] = {
		['Barrier'] = 'prop_barrier_work05',
		['Barrier 2'] = 'prop_barrier_work01a',
		['Barrier 3'] = 'prop_barrier_work02a',
		['Barrier 4'] = 'prop_barrier_work06a',
		['Barrier 5'] = 'prop_barrier_wat_03b',
		['Barrier 6'] = 'prop_consign_02a',
		['Barrier 7'] = 'prop_barrier_work04a',
	},
	['Traffic'] = {
		['Traffic'] = 'prop_trafficdiv_01',
		['Traffic 2'] = 'prop_trafficdiv_02',
	},
	['Road Poles'] = {
		['Road Pole'] = 'prop_roadpole_01a',
		['Road Pole 2'] = 'prop_roadpole_01b',
	},
	['Spikes'] = {
		['Spike'] = 'p_ld_stinger_s'
	},
	['CCTVS'] = {
		['CCTV 1'] = 'hei_prop_bank_cctv_01',
		['CCTV 2'] = 'prop_cctv_cam_01a',
		['CCTV 3'] = 'prop_cctv_cam_04b',
	},
	['Radars'] = {
		['Radar 1'] = 'prop_cctv_cam_03a',
		['Radar 2'] = 'prop_cctv_cam_05a',
		['Radar 3'] = 'prop_cctv_pole_04',
		['Radar Signal'] = 'okok_radar_sign', -- don't change the prop otherwise it won't work
	},
	['Evidence'] = {
		['Evidence 1'] = 'okok_prop_evidence_01',
		['Evidence 2'] = 'okok_prop_evidence_02',
		['Evidence 3'] = 'okok_prop_evidence_03',
		['Evidence 4'] = 'okok_prop_evidence_04',
		['Evidence 5'] = 'okok_prop_evidence_05',
	},
}

Config.PositionFix = {
    { name = 'hei_prop_bank_cctv_01', height = 0.35, subtractHeight = true, heading = 180, sutractHeading = false },
	{ name = 'prop_cctv_cam_04b', height = 0.35, subtractHeight = true, heading = 180, sutractHeading = false },
	{ name = 'prop_cctv_cam_01a', height = 0.0, subtractHeight = false, heading = 180, sutractHeading = false },
	{ name = 'prop_cctv_cam_03a', height = 0.15, subtractHeight = true, heading = 135, sutractHeading = true },
	{ name = 'prop_cctv_cam_05a', height = 0.55, subtractHeight = true, heading = 90, sutractHeading = false },
	{ name = 'prop_cctv_pole_04', height = 0.05, subtractHeight = true, heading = 90, sutractHeading = false },
}

Config.CCTVCategory = 'CCTVS' -- Make sure this category is the SAME as the one in the Config.PoliceObjects

Config.RadarsCategory = 'Radars' -- Make sure this category is the SAME as the one in the Config.PoliceObjects

Config.Prison = {
	enter = vector4(1680.32, 2513.02, 45.56, 320.26),
	exit = vector4(1846.9, 2585.94, 45.67, 268.35),
}

Config.PrisonActions = {
	[1] = { coords = vector3(1673.12, 2510.93, 45.56), action = 'clean', actiontime = 10 }, 
	[2] = { coords = vector3(1689.5, 2515.9, 45.56), action = 'clean', actiontime = 10 },
	[3] = { coords = vector3(1713.56, 2519.59, 45.56), action = 'clean', actiontime = 10 },
	[4] = { coords = vector3(1718.44, 2527.8, 45.56), action = 'repair', actiontime = 15 },
	[5] = { coords = vector3(1761.47, 2540.47, 45.56), action = 'repair', actiontime = 15 },
	[6] = { coords = vector3(1664.82, 2501.58, 45.56), action = 'repair', actiontime = 15 },
}

Config.CommunityService = {
	enter = vector4(1680.32, 2513.02, 45.56, 320.26),
	exit = vector4(1846.9, 2585.94, 45.67, 268.35),
}

Config.CommunityServiceActions = {
	[1] = { coords = vector3(1673.12, 2510.93, 45.56), action = 'clean', actiontime = 10 }, 
	[2] = { coords = vector3(1689.5, 2515.9, 45.56), action = 'clean', actiontime = 10 },
	[3] = { coords = vector3(1713.56, 2519.59, 45.56), action = 'clean', actiontime = 10 },
	[4] = { coords = vector3(1718.44, 2527.8, 45.56), action = 'repair', actiontime = 15 },
	[5] = { coords = vector3(1761.47, 2540.47, 45.56), action = 'repair', actiontime = 15 },
	[6] = { coords = vector3(1664.82, 2501.58, 45.56), action = 'repair', actiontime = 15 },
}

Config.SpeedFines = {
	{ speed = 80, fine = 100 },
	{ speed = 100, fine = 200 },
	{ speed = 120, fine = 300 },
	{ speed = 140, fine = 400 },
	{ speed = 160, fine = 500 },
	{ speed = 180, fine = 600 },
	{ speed = 200, fine = 700 },
	{ speed = 220, fine = 800 },
	{ speed = 240, fine = 900 },
	{ speed = 260, fine = 1000 },
}

-- The vehicles, helicopters and boats locations only work if Config.UseOkokGarage is false
Config.Locations = {
	vehicles = {
		[1] = {
			coords = vector4(1791.23, 2609.16, 45.56, 186.06),
			storecoords = vector4(1794.16, 2610.93, 45.56, 358.67),
			vehicles = {
				{ 
					model = 'police', 
					label = 'Police Cruiser',
					plate = 'POLICE',
					minimumGrade = 1,
					livery = 4,
					armor = 4,
					brakes = 2,
					engine = 3,
					suspension = 3,
					transmission = 2,
					turbo = true,
					windowstint = 2,
					--extras = { 1, 2, 3 },
					--primaryColor = { 0, 0, 0 },
					--secondaryColor = { 0, 0, 0 }
				},
				{ 
					model = 'police2', 
					label = 'Police Interceptor',
					plate = 'POLICE',
					minimumGrade = 1,
					livery = 4,
					armor = 4,
					brakes = 2,
					engine = 3,
					suspension = 3,
					transmission = 2,
					turbo = true,
					windowstint = 2,
					--extras = { 1, 2, 3 },
					--primaryColor = { 0, 0, 0 },
					--secondaryColor = { 0, 0, 0 }
				},
				{ 
					model = 'police3', 
					label = 'Police Interceptor (2)',
					plate = 'POLICE',
					minimumGrade = 1,
					livery = 4,
					armor = 4,
					brakes = 2,
					engine = 3,
					suspension = 3,
					transmission = 2,
					turbo = true,
					windowstint = 2,
					--extras = { 1, 2, 3 },
					--primaryColor = { 0, 0, 0 },
					--secondaryColor = { 0, 0, 0 }
				},
				{ 
					model = 'police4', 
					label = 'Police Buffalo',
					plate = 'POLICE',
					minimumGrade = 1,
					livery = 4,
					armor = 4,
					brakes = 2,
					engine = 3,
					suspension = 3,
					transmission = 2,
					turbo = true,
					windowstint = 2,
					--extras = { 1, 2, 3 },
					--primaryColor = { 0, 0, 0 },
					--secondaryColor = { 0, 0, 0 }
				},
			},
			vehiclesSpawn = {
				vector4(1809.98, 2607.91, 45.59, 270.41),
				vector4(1803.35, 2602.1, 45.6, 268.37),
				vector4(1799.9, 2609.92, 45.56, 268.14)
			}
		},
	},
	helicopters = {
		[1] = {
			coords = vector4(1788.25, 2634.72, 45.56, 276.52),
			storecoords = vector4(1796.78, 2636.5, 45.56, 183.68),
			vehicles = {
				{ model = 'polmav', label = 'Police Maverick', minimumGrade = 1, livery = 0 },
			},
			vehiclesSpawn = {
				vector4(1796.78, 2636.5, 45.56, 183.68),
			}
		},
	},
	boats = {
		[1] = {
			coords = vector4(-786.92, -1489.66, 1.6, 108.87),
			storecoords = vector4(-792.37, -1495.28, 0.59, 291.07),
			vehicles = {
				{ model = 'predator', label = 'Police Predator', minimumGrade = 1 },
			},
			vehiclesSpawn = {
				vector4(-794.18, -1486.44, 0.59, 112.32),
			}
		},
	},
	armories = {
		[1] = {
			coords = vector3(1777.28, 2544.59, 45.8),
			weapons = {
				{ name = 'weapon_pistol', price = 500, amount = 50, minimumGrade = 0 },
				{ name = 'weapon_stungun', price = 800, amount = 30, minimumGrade = 0 },
				{ name = 'weapon_smg', price = 2500, amount = 20, minimumGrade = 1 },
				{ name = 'weapon_carbinerifle', price = 3500, amount = 15, minimumGrade = 2 },
				{ name = 'pistol_ammo', price = 50, amount = 200, minimumGrade = 0 },
				{ name = 'smg_ammo', price = 100, amount = 150, minimumGrade = 1 },
				{ name = 'rifle_ammo', price = 200, amount = 100, minimumGrade = 2 },
				{ name = 'weapon_flashlight', price = 100, amount = 100, minimumGrade = 0 },
				{ name = 'weapon_nightstick', price = 200, amount = 100, minimumGrade = 0 },
				{ name = 'radio', price = 1000, amount = 25, minimumGrade = 0 },
				{ name = 'heavyarmor', price = 1500, amount = 10, minimumGrade = 1 },
				{ name = 'handcuffs', price = 300, amount = 100, minimumGrade = 0 },
			}
		}
	},
	cloakrooms = {
		[1] = { coords = vector3(1785.39, 2542.21, 45.8) }
	},
	stashes = {
		[1] = { coords = vector3(1779.6, 2542.24, 45.8) }
	},
	trashes = {
		[1] = { coords = vector3(1790.63, 2543.73, 45.8) }
	},
	evidences = {
		[1] = { coords = vector3(1789.89, 2548.38, 45.8) }
	},
	sendreports = {
		[1] = { coords = vector3(1838.5, 2590.61, 45.95) }
	},
	openreports = {
		[1] = { coords = vector3(1836.56, 2589.98, 45.95) }
	},
	blips = {
		{ name = 'Los Santos Station', color = 38, sprite = 137, scale = 0.8, coords = vector3(447.83, -985.41, 30.69) },
		{ name = 'Paleto Station', color = 38, sprite = 137, scale = 0.8, coords = vector3(-446.27, 6013.56, 31.72) },
		{ name = 'IPK KOTA MALAYA', color = 38, sprite = 188, scale = 1.1, coords = vector3(1858.33, 2606.69, 45.67) },
	}
}

-------------------------- DISCORD LOGS

Config.BotName = 'ServerName' -- Write the desired bot name

Config.ServerName = 'ServerName' -- Write your server's name

Config.IconURL = '' -- Insert your desired image link

Config.DateFormat = '%d/%m/%Y [%X]' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

-- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html

Config.SearchPlayerWebhook = true
Config.SearchPlayerWebhookColor = '65280'

Config.JailPlayerWebhook = true
Config.JailPlayerWebhookColor = '65280'

Config.CommunityPlayerWebhook = true
Config.CommunityPlayerWebhookColor = '65280'

Config.AddAnkleWebhook = true
Config.AddAnkleWebhookColor = '65280'

Config.RemoveAnkleWebhook = true
Config.RemoveAnkleWebhookColor = '16711680'

Config.ReportsWebhook = true
Config.ReportsWebhookColor = '65280'

Config.ChangeReportWebhook = true
Config.ChangeReportWebhookColor = '65280'

Config.DeleteReportWebhook = true
Config.DeleteReportWebhookColor = '16711680'

-------------------------- LOCALES (DON'T TOUCH)

function _okok(id)
	if Locales[Config.Locale][id] then
		return Locales[Config.Locale][id]
	else
		print("The locale '"..id.."' doesn't exist!")
	end
end
Locales['en'] = {

    -- Text UI

    ['prop_menu'] = {
        text = '[E] Place Prop | [BACKSPACE] Cancel',
        color = 'darkblue',
        side = 'right'
    },

    ['vehicles'] = {
        text = '[E] Vehicle Menu',
        color = 'darkblue',
        side = 'right'
    },

    ['storevehicle'] = {
        text = '[E] Store Vehicle',
        color = 'darkblue',
        side = 'right'
    },

    ['armories'] = {
        text = '[E] Open Armory',
        color = 'darkblue',
        side = 'right'
    },

    ['cloakrooms'] = {
        text = '[E] Open Cloakroom',
        color = 'darkblue',
        side = 'right'
    },

    ['stashes'] = {
        text = '[E] Open Stash',
        color = 'darkblue',
        side = 'right'
    },

    ['trashes'] = {
        text = '[E] Open Trash',
        color = 'darkblue',
        side = 'right'
    },

    ['evidences'] = {
        text = '[E] Open Evidences',
        color = 'darkblue',
        side = 'right'
    },

    ['sendreport'] = {
        text = '[E] Send Report',
        color = 'darkblue',
        side = 'right'
    },

    ['seereport'] = {
        text = '[E] See Reports',
        color = 'darkblue',
        side = 'right'
    },

    ['close_cam'] = {
        text = '[BACKSPACE] Close Camera',
        color = 'darkblue',
        side = 'right'
    },

    ['clean'] = {
        text = '[E] Clean',
        color = 'darkblue',
        side = 'right'
    },

    ['work'] = {
        text = '[E] Repair',
        color = 'darkblue',
        side = 'right'
    },

    ['removeprop'] = {
        text = '[E] Remove Prop',
        color = 'darkblue',
        side = 'right'
    },

    -- Error Notifications

    ['not_police'] = {
        title = "Police Job",
        text = "You are not a police officer",
        type = 'error',
        time = 5000

    },

    ['prop_removed'] = {
        title = "Police Job",
        text = "The prop has been removed",
        type = 'error',
        time = 5000
    },

    ['no_player'] = {
        title = "Police Job",
        text = "There is no player nearby",
        type = 'error',
        time = 5000
    },

    ['not_handcuffed'] = {
        title = "Police Job",
        text = "The player is not handcuffed",
        type = 'error',
        time = 5000
    },

    ['hands_up'] = {
        title = "Police Job",
        text = "The player needs to have their hands up or be handcuffed",
        type = 'error',
        time = 5000
    },

    ['player_offline'] = {
        title = "Police Job",
        text = "The player is offline",
        type = 'error',
        time = 5000
    },

    ['not_owned_vehicle'] = {
        title = "Police Job",
        text = "The vehicle with plate ${plate} is not owned by anyone",
        type = 'error',
        time = 5000
    },

    ['no_vehicle'] = {
        title = "Police Job",
        text = "There is no vehicle nearby",
        type = 'error',
        time = 5000
    },
    
    ['failed_opening_doors'] = {
        title = "Police Job",
        text = "You failed to open the doors",
        type = 'error',
        time = 5000
    },

    ['canceled'] = {
        title = "Police Job",
        text = "Canceled",
        type = 'error',
        time = 5000
    },

    ['no_handcuffs'] = {
        title = "Police Job",
        text = "You have no handcuffs with you",
        type = 'error',
        time = 5000
    },

    ['no_space'] = {
        title = "Police Job",
        text = "There is no space for the vehicle",
        type = 'error',
        time = 5000
    },

    ['report_deleted'] = {
        title = "Police Job",
        text = "The report with ID ${id} has been deleted",
        type = 'error',
        time = 5000
    },

    ['no_escorting'] = {
        title = "Police Job",
        text = "You are not escorting anyone",
        type = 'error',
        time = 5000
    },

    ['cant_handcuff'] = {
        title = "Police Job",
        text = "You can't handcuff a player while escorting",
        type = 'error',
        time = 5000
    },

    ['no_ankle_monitor'] = {
        title = "Police Job",
        text = "The player has no ankle monitor",
        type = 'error',
        time = 5000
    },

    ['already_ankle_monitor'] = {
        title = "Police Job",
        text = "The player already has an ankle monitor",
        type = 'error',
        time = 5000
    },

    ['not_on_duty'] = {
        title = "Police Job",
        text = "You are not on duty",
        type = 'error',
        time = 5000
    },

    ['cant_uncuff'] = {
        title = "Police Job",
        text = "You can't uncuff the player while escorting",
        type = 'error',
        time = 5000
    },

    ['max_objects'] = {
        title = "Police Job",
        text = "You have reached the maximum number of objects in that area",
        type = 'error',
        time = 5000
    },

    ['handcuff_in_vehicle'] = {
        title = "Police Job",
        text = "You can't handcuff a player that's inside a vehicle",
        type = 'error',
        time = 5000
    },

    -- Success Notifications

    ['prop_placed'] = {
        title = "Police Job",
        text = "The ${prop} has been placed",
        type = 'success',
        time = 5000
    },

    ['placed_ankle_monitor'] = {
        title = "Police Job",
        text = "You have placed an ankle monitor on ${player}",
        type = 'success',
        time = 5000
    },

    ['removed_ankle_monitor'] = {
        title = "Police Job",
        text = "You have removed the ankle monitor from ${player}",
        type = 'success',
        time = 5000
    },

    ['copied_plate'] = {
        title = "Police Job",
        text = "The plate has been copied to your clipboard",
        type = 'success',
        time = 5000
    },

    ['copied_phone'] = {
        title = "Police Job",
        text = "The phone number has been copied to your clipboard",
        type = 'success',
        time = 5000
    },

    ['sent_to_recover'] = {
        title = "Police Job",
        text = "The vehicle with plate ${plate} has been sent to police recover",
        type = 'success',
        time = 5000
    },

    ['impounded_vehicle'] = {
        title = "Police Job",
        text = "The vehicle with plate ${plate} has been impounded",
        type = 'success',
        time = 5000
    },

    ['vehicle_unlocked'] = {
        title = "Police Job",
        text = "The vehicle has been unlocked",
        type = 'success',
        time = 5000
    },

    ['cam_added'] = {
        title = "Police Job",
        text = "Camera ${cctv} has been added",
        type = 'success',
        time = 5000
    },

    ['radar_added'] = {
        title = "Police Job",
        text = "Radar ${radar} has been added with speed limit of ${speed} " .. (Config.UseKMH and "km/h" or "mph"),
        type = 'success',
        time = 5000
    },

    ['jailed'] = {
        title = "Police Job",
        text = "You have jailed ${player} for ${time} months",
        type = 'success',
        time = 5000
    },

    ['community_service'] = {
        title = "Police Job",
        text = "You have sent ${player} to community service for ${time} months",
        type = 'success',
        time = 5000
    },

    ['report_sent'] = {
        title = "Police Job",
        text = "You have sent your report to the police department",
        type = 'success',
        time = 5000
    },

    ['report_updated'] = {
        title = "Police Job",
        text = "You have updated the report with ID ${id} to '${status}'",
        type = 'success',
        time = 5000
    },

    ['remove_prison'] = {
        title = "Police Job",
        text = "You removed ${name} from prison",
        type = 'success',
        time = 5000
    },

    ['remove_community_service'] = {
        title = "Police Job",
        text = "You removed ${name} from community service",
        type = 'success',
        time = 5000
    },

    ['all_props_removed'] = {
        title = "Police Job",
        text = "All props have been removed",
        type = 'success',
        time = 5000
    },

    -- Info Notifications

    ['searching_player'] = {
        title = "Police Job",
        text = "You are searching ${player}",
        type = 'info',
        time = 5000
    },

    ['being_searched'] = {
        title = "Police Job",
        text = "You are being searched",
        type = 'info',
        time = 5000
    },
    
    ['escorting_player'] = {
        title = "Police Job",
        text = "You are escorting ${player}",
        type = 'info',
        time = 5000
    },

    ['being_escorted'] = {
        title = "Police Job",
        text = "You are being escorted",
        type = 'info',
        time = 5000
    },
    
    ['ankle_monitor_placed'] = {
        title = "Police Job",
        text = "You have now an ankle monitor",
        type = 'info',
        time = 5000
    },

    ['ankle_monitor_removed'] = {
        title = "Police Job",
        text = "You no longer have an ankle monitor",
        type = 'info',
        time = 5000
    },

    ['ankle_monitor'] = {
        title = "Police Job",
        text = "The ankle monitor location for ${name} as been set on the map",
        type = 'info',
        time = 5000
    },

    ['get_jailed'] = {
        title = "Police Job",
        text = "You have been jailed for ${months} months",
        type = 'info',
        time = 5000
    },

    ['jail_time_updated'] = {
        title = "Police Job",
        text = "Your jail time has been updated to ${months} months",
        type = 'info',
        time = 5000
    },

    ['jailed_end'] = {
        title = "Police Job",
        text = "You have been released from jail",
        type = 'info',
        time = 5000
    },

    ['get_community'] = {
        title = "Police Job",
        text = "You have been sent to community service for ${months} months",
        type = 'info',
        time = 5000
    },

    ['community_service_updated'] = {
        title = "Police Job",
        text = "Your community service has been updated to ${months} months",
        type = 'info',
        time = 5000
    },

    ['community_end'] = {
        title = "Police Job",
        text = "You have been released from community service",
        type = 'info',
        time = 5000
    },

    ['community_service_added'] = {
        title = "Police Job",
        text = "It has been added ${months} months to the community service because you tried to escape",
        type = 'info',
        time = 5000
    },

    ['new_report'] = {
        title = "Police Job",
        text = "${name} has sent a new report",
        type = 'info',
        time = 5000
    },

    -- Warning Notifications

    ['emergency_signal'] = {
        title = "Police Job",
        text = "${player} has sent an emergency signal",
        type = 'warning',
        time = 5000
    },

    ['speeding'] = {
        title = "Police Radar",
        text = "You got caught speeding at ${speed} " .. (Config.UseKMH and "km/h" or "mph"),
        type = 'warning',
        time = 5000
    },

    -- Translations

    ['translations'] = {
        removeprop = "Remove prop",
        object = "prop",
        objectdescription = "Object to place",
        sendtorecover = "Send to Recover",
        vehicleinfo = "Vehicle Info",
        vehiclename = "Vehicle Name",
        vehicleplate = "Vehicle Plate",
        vehicleowner = "Vehicle Owner",
        owneridentifier = "Owner Identifier",
        ownerphone = "Owner Phone",
        na = "N/A",
        impoundingVehicle = "Impounding Vehicle",
        sendingToRecover = "Sending to Recover",
        vehicles = "Police Vehicles",
        helicopters = "Police Helicopters",
        boats = "Police Boats",
        cctvsettings = "CCTV Settings",
        cctvname = "Camera Name",
        cctvplaceholder = "Pacific Bank 1",
        rotate = "Rotate",
        confirm = "Confirm",
        vehicles = "Vehicles",
        helicopters = "Helicopters",
        boats = "Boats",
        armories = "Armory",
        cloakrooms = "Cloakroom",
        stashes = "Stash",
        trashes = "Trash",
        evidences = "Evidences",
        report = "Report",
        storevehicle = "Store Vehicle",
        newradar = "New Radar",
        radarname = "Radar Name",
        radarplaceholder = "Legion Square",
        radarspeed = "Radar Speed",
        speedtrap = "Speed Trap",
        radar = "Radar",
        back = "Back",
        closemenu = "Close Menu",
        placeobjects = "Place Objects",
        menu = "Menu",
        playermenu = "Player Menu",
        vehiclemenu = "Vehicle Menu",
        anklemonitor = "Ankle Monitor",
        anklemonitordesc = "Place an ankle monitor on the nearest player",
        anklemonitorlocations = "Ankle Monitor Locations",
        evidencestashes = "Evidence Stashes",
        securitycameras = "Security Cameras",
        emergencysignal = "Emergency Signal",
        securitycamera = "security camera",
        viewthe = "View the",
        openevidencestash = "Open Evidence Stash",
        openevidencelocker = "Open the evidence locker",
        citizenid = "Citizen ID",
        spawna = "Spawn a",
        placea = "Place a",
        ontheground = "on the ground",
        openthe = "Open the",
        removeanklemonitor = "Remove Ankle Monitor",
        removeanklemonitordesc = "Remove the ankle monitor from the nearest player",
        placeanklemonitor = "Place Ankle Monitor",
        placeanklemonitordesc = "Place an ankle monitor on the nearest player",
        getanklemonitorlocation = "Get Ankle Monitor Location",
        getanklemonitorlocationdesc = "Get a list of all ankle monitor locations",
        vehicleinformation = "Vehicle Information",
        vehicleinformationdesc = "Get information about the nearest vehicle",
        impoundvehicle = "Impound Vehicle",
        impoundvehicledesc = "Impound the nearest vehicle",
        forceopenvehicle = "Force Open Vehicle",
        forceopenvehicledesc = "Force open the nearest vehicle",
        searchplayer = "Search Player",
        searchplayerdesc = "Search the nearest player",
        handcuffplayer = "Handcuff Player",
        handcuffplayerdesc = "Handcuff the nearest player",
        escortplayer = "Escort Player",
        escortplayerdesc = "Escort the nearest player",
        placeinvehicle = "Place in Vehicle",
        placeinvehicledesc = "Place the nearest player in a vehicle",
        removefromvehicle = "Remove from Vehicle",
        removefromvehicledesc = "Remove the nearest player from a vehicle",
        openpolicemenudesc = "Open the police menu",
        playerinteractions = "Player Interactions",
        playerinteractionsdesc = "Open the player menu to interact with players",
        vehicleinteractions = "Vehicle Interactions",
        vehicleinteractionsdesc = "Open the vehicle menu to interact with vehicles",
        billplayer = "Bill Player",
        billplayerdesc = "Open the billing menu to bill players",
        opencameras = "Open Cameras",
        opencamerasdesc = "Open the cameras menu to security cameras",
        placeobjects = "Place Objects",
        placeobjectsdesc = "Place objects on the ground",
        emergencybutton = "Emergency Button",
        emergencybuttondesc = "Send an emergency signal to all available units",
        policeactions = "Police Actions",
        communityservice = "Community Service",
        communityservicedesc = "Send the nearest player to community service",
        jailplayer = "Jail Player",
        jailplayerdesc = "Jail the nearest player",
        months = "Months",
        playername = "Player Name",
        prisonmenu = "Prison Menu",
        cleaning = "Cleaning",
        repairing = "Repairing",
        communitymenu = "Com. Service",
        monthsleft = "Months Left",
        newreport = "New Report",
        yourname = "Your Name",
        phonenumber = "Phone Number",
        date = "Date",
        description = "Description",
        anonymous = "Anonymous",
        descriptionplaceholder = "Type your description",
        openreports = "Open Reports",
        sendreport = "Send Report",
        none = "None",
        inreview = "In Review",
        archived = "Archived",
        status = "Status",
        delete = "Delete",
        search = "Search",
        noentriesfound = "No entries found",
        noresults = "No results",
        view = "View",
        player = "Player",
        phone = "Phone",
        actions = "Actions",
        reportslist = "Reports List",
        playeractions = "Player Actions",
        removeprison = "Remove player from Prison",
        removecommunityservice = "Remove player from Community Service",
        playerid = "Player ID",
        playeridtoremoveprison = "Player ID to remove from prison",
        playeridtoremovecommunity = "Player ID to remove from community service",
        clearallprops = "Clear All Props",
        clearallpropsdesc = "Clear all props placed by police officers",
    },
}
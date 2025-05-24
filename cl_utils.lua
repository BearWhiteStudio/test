QBCore = exports["qb-core"]:GetCoreObject()

RegisterNetEvent(Config.EventPrefix..":notification")
AddEventHandler(Config.EventPrefix..":notification", function(title, text, type, time)
    if Config.UseOkokNotify then
        exports['okokNotify']:Alert(title, text, time, type)
    else
        QBCore.Functions.Notify(text, type)
    end
end)

function TextUI(text, color, side)
	if Config.UseOkokTextUI then
		if text ~= nil then
			exports['okokTextUI']:Open(text, color, side)
		else
			exports['okokTextUI']:Close()
		end
	else
		if text ~= nil then
			exports['qb-core']:DrawText(text, side)
		else
			exports['qb-core']:HideText()
		end
	end
end

function getVehiclePlate(vehicle)
    return GetVehicleNumberPlateText(vehicle)
end

function removeVehicleKeys(vehicle)
    -- Add your own vehicle keys system here
end

function escortPlayer(targetSource)
    -- Add your own escort player code here
end

function cuffPlayer(targetSource)
    -- Add your own cuff player code here
end

function uncuffPlayer(targetSource)
    -- Add your own uncuff player code here
end

function openBillingMenu()
	if Config.UseOkokBilling then
		TriggerEvent("okokBilling:ToggleCreateInvoice")
	else
		-- Add your own bill system here
	end
end

function setVehicleFuel(vehicle, fuel)
    if Config.UseOkokGasStation then
        exports['okokGasStation']:SetFuel(vehicle, fuel)
    else
        -- Add your own fuel system here
    end
end

function openJobOutfitsMenu(grade, job)
    if Config.ClothingSystem == 'qb-clothing' then
        exports['qb-clothing']:getJobOutfits(grade, job)
    elseif Config.ClothingSystem == 'illenium-appearance' then
        TriggerEvent("illenium-apearance:client:outfitsCommand", job)
    else
        -- Add your own clothing system here
    end
end

function setPrisonClothing()
    outfit = {
        outfitData = {
            ['t-shirt'] = { item = 15, texture = 0 },
            ['torso2'] = { item = 351, texture = 0 },
            ['pants'] = { item = 7, texture = 15 },
            ['shoes'] = { item = 97, texture = 0 },
        }
    }
    if Config.ClothingSystem == 'qb-clothing' then
        TriggerEvent('qb-clothing:client:loadOutfit', outfit)
    elseif Config.ClothingSystem == 'illenium-appearance' then
        TriggerEvent('illenium-appearance:client:loadJobOutfit', outfit)
    else
        -- Add your own clothing system here
    end
end

function loadPlayerSkin()
    if Config.ClothingSystem == 'qb-clothing' then
        TriggerServerEvent('qb-clothes:loadPlayerSkin')
    elseif Config.ClothingSystem == 'illenium-appearance' then
        TriggerEvent('illenium-appearance:client:reloadSkin')
    else
        -- Add your own clothing system here
    end
end

function progressBar(text, dict, clip, time, useProp, propModel, position, rotation)
    local success
    if useProp then
        success = lib.progressCircle({
            duration = time,
            label = text,
            position = 'bottom',
            useWhileDead = false,
            canCancel = false,
            disable = {
                move = true,
            },
            anim = {
                dict = dict,
                clip = clip 
            },
            prop = {
                model = propModel,
                pos = position,
                rot = rotation 
            },
        })
    else
        success = lib.progressCircle({
            duration = time,
            label = text,
            position = 'bottom',
            useWhileDead = false,
            canCancel = false,
            disable = {
                move = true,
            },
            anim = {
                dict = dict,
                clip = clip 
            },
        })
    end
	return success
end

function miniGame()
	local success = lib.skillCheck({'easy', 'easy', {areaSize = 60, speedMultiplier = 1.20}, 'easy'}, {'w', 'a', 's', 'd'})
	return success
end

RegisterNetEvent(Config.EventPrefix..":openInventory")
AddEventHandler(Config.EventPrefix..":openInventory", function(inventory, target, items)
    if Config.InventorySystem == 'ox-inventory' then
        if inventory == 'shop' then
            exports.ox_inventory:openInventory('shop', { type = target, id = target })
        else
            exports.ox_inventory:openInventory(inventory, target)
        end
    elseif Config.InventorySystem == 'qb-inventory' then
        if inventory == 'shop' then
            TriggerServerEvent('inventory:server:OpenInventory', 'shop', 'police', items)
        elseif inventory == 'stash' then
            TriggerServerEvent('inventory:server:OpenInventory', 'stash', target, { value = target }, { maxweight = 4000000, slots = 500 })
            TriggerEvent('inventory:client:SetCurrentStash', target, { value = target })
        else
            TriggerServerEvent('inventory:server:OpenInventory', 'otherplayer', target)
        end
    elseif Config.InventorySystem == 'qs-inventory' then
        if inventory == 'shop' then
            TriggerServerEvent('inventory:server:OpenInventory', 'shop', 'police', items)
        elseif inventory == 'stash' then
            TriggerServerEvent('inventory:server:OpenInventory', 'stash', target, { value = target }, { maxweight = 4000000, slots = 500 })
            TriggerEvent('inventory:client:SetCurrentStash', target, { value = target })
        else
            TriggerServerEvent('inventory:server:OpenInventory', 'otherplayer', target)
        end
    else
        -- Add your own inventory system here
    end
end)

lib.callback.register(Config.EventPrefix..":checkItem", function(item)
    if Config.InventorySystem == 'ox-inventory' then
        return exports.ox_inventory:GetItemCount(item) > 0 and true or false
    end
end)

function setMoreVehicleProperties(vehicle)
    -- Add your own vehicle properties here
end

function playerGetCuffed()
    -- Add your code after player get cuffed
end

function playerGetUncuffed()
    -- Add your code after player get uncuffed
end

function setBlipText(text)
    -- Add your code if you want to modify the blip text
    return text
end

-- MENUS

RegisterNetEvent(Config.EventPrefix..":openPoliceMenu")
AddEventHandler(Config.EventPrefix..":openPoliceMenu", function()

    if isPlayerDead then return end
    if isHandcuffed then return end

    isPolice = lib.callback.await(Config.EventPrefix..":isPolice", false)

    isOnDuty = lib.callback.await(Config.EventPrefix..":isOnDuty", false)
    if not isOnDuty then
        TriggerEvent(Config.EventPrefix..':notification', _okok('not_on_duty').title, _okok('not_on_duty').text, _okok('not_on_duty').type, _okok('not_on_duty').time)
        return
    end 

    if Config.ContextMenuSystem == 'okok-menu' then
        local options = {}
        local exitoption = {
            title = "❌ " .. _okok('translations').closemenu,
            event = "closePoliceMenu"
        }
        local title = _okok('translations').policeactions

        table.insert(options, {
            title = _okok('translations').playerinteractions,
            description = _okok('translations').playerinteractionsdesc,
            event = "openPlayerMenu"
        })

        table.insert(options, {
            title = _okok('translations').vehicleinteractions,
            description = _okok('translations').vehicleinteractionsdesc,
            event = "openVehicleTargetMenu"
        })

        table.insert(options, {
            title = _okok('translations').billplayer,
            description = _okok('translations').billplayerdesc,
            event = "openInvoiceMenu"
        })

        table.insert(options, {
            title = _okok('translations').opencameras,
            description = _okok('translations').opencamerasdesc,
            event = "openCamsMenu"
        })

        table.insert(options, {
            title = _okok('translations').placeobjects,
            description = _okok('translations').placeobjectsdesc,
            event = "openPropMenu"
        })

        table.insert(options, {
            title = _okok('translations').emergencybutton,
            description = _okok('translations').emergencybuttondesc,
            event = "sendEmergencySignal"
        })

        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'policeMenu',
            locales = Locales[Config.Locale].translations,
            options = options,
            exitOption = exitoption,
            title = title
        })

    elseif Config.ContextMenuSystem == 'ox-menu' then
        lib.registerContext({
            id = 'policeMenu',
            title = _okok('translations').policeactions,
            options = {
                {
                    title = _okok('translations').playerinteractions,
                    description = _okok('translations').playerinteractionsdesc,
                    event = Config.EventPrefix..":openPlayerMenu"
                },
                {
                    title = _okok('translations').vehicleinteractions,
                    description = _okok('translations').vehicleinteractionsdesc,
                    event = Config.EventPrefix..":openVehicleTargetMenu"
                },
                {
                    title = _okok('translations').billplayer,
                    description = _okok('translations').billplayerdesc,
                    event = Config.EventPrefix..":openInvoiceMenu"
                },
                {
                    title = _okok('translations').opencameras,
                    description = _okok('translations').opencamerasdesc,
                    event = Config.EventPrefix..":openCamsMenu"
                },
                {
                    title = _okok('translations').placeobjects,
                    description = _okok('translations').placeobjectsdesc,
                    event = Config.EventPrefix..":openPropMenu"
                },
                {
                    title = _okok('translations').emergencybutton,
                    description = _okok('translations').emergencybuttondesc,
                    event = Config.EventPrefix..":sendEmergencySignal"
                },
                {
                    title = "❌ " .. _okok('translations').closemenu,
                    event = 'ox-menu:client:closeMenu'
                }
            }
        })
        lib.showContext('policeMenu')
    elseif Config.ContextMenuSystem == 'qb-menu' then
        local policeMenu = {
            {
                header = _okok('translations').policeactions,
                isMenuHeader = true
            },
            {
                header = _okok('translations').playerinteractions,
                txt = _okok('translations').playerinteractionsdesc,
                params = { event = Config.EventPrefix..":openPlayerMenu" }
            },
            {
                header = _okok('translations').vehicleinteractions,
                txt = _okok('translations').vehicleinteractionsdesc,
                params = { event = Config.EventPrefix..":openVehicleTargetMenu" }
            },
            {
                header = _okok('translations').billplayer,
                txt = _okok('translations').billplayerdesc,
                params = { event = Config.EventPrefix..":openInvoiceMenu" }
            },
            {
                header = _okok('translations').opencameras,
                txt = _okok('translations').opencamerasdesc,
                params = { event = Config.EventPrefix..":openCamsMenu" }
            },
            {
                header = _okok('translations').placeobjects,
                txt = _okok('translations').placeobjectsdesc,
                params = { event = Config.EventPrefix..":openPropMenu" }
            },
            {
                header = _okok('translations').emergencybutton,
                txt = _okok('translations').emergencybuttondesc,
                params = { event = Config.EventPrefix..":sendEmergencySignal" }
            }
        }
    
        policeMenu[#policeMenu + 1] = {
            header = "❌ " .. _okok('translations').closemenu,
            txt = '',
            params = {
                event = 'qb-menu:client:closeMenu'
            }
    
        }
        exports['qb-menu']:openMenu(policeMenu)
    end
end)

RegisterNetEvent(Config.EventPrefix..":openPlayerMenu")
AddEventHandler(Config.EventPrefix..":openPlayerMenu", function()
    if Config.ContextMenuSystem == 'okok-menu' then
        local options = {}
        local exitoption = {
            title =  "⬅️ " .. _okok('translations').back,
            event = "openPoliceMenu"
        }

        table.insert(options, {
            title = _okok('translations').searchplayer,
            description = _okok('translations').searchplayerdesc,
            event = "searchPlayer"
        })

        table.insert(options, {
            title = _okok('translations').handcuffplayer,
            description = _okok('translations').handcuffplayerdesc,
            event = "cuffPlayer",
        })

        table.insert(options, {
            title = _okok('translations').escortplayer,
            description = _okok('translations').escortplayerdesc,
            event = "escortPlayer",
        })

        table.insert(options, {
            title = _okok('translations').anklemonitor,
            description = _okok('translations').anklemonitordesc,
            event = "openAnkleMenu",
        })

        if Config.UseBuiltInCommunityService then
            table.insert(options, {
                title = _okok('translations').communityservice,
                description = _okok('translations').communityservicedesc,
                event = "openCommunityMenu",
            })
        end

        if Config.UseBuiltInPrison or Config.PrisonSystem == 'rcore-prison' then
            table.insert(options, {
                title = _okok('translations').jailplayer,
                description = _okok('translations').jailplayerdesc,
                event = "openJailMenu",
            })
        end

        table.insert(options, {
            title = _okok('translations').placeinvehicle,
            description = _okok('translations').placeinvehicledesc,
            event = "placeInVehicle",
        })

        table.insert(options, {
            title = _okok('translations').removefromvehicle,
            description = _okok('translations').removefromvehicledesc,
            event = "takeFromVehicle",
        })

        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'policeMenu',
            locales = Locales[Config.Locale].translations,
            options = options,
            exitOption = exitoption
        })

    elseif Config.ContextMenuSystem == 'ox-menu' then
        local playerMenuOptions = {
            {
                title = _okok('translations').searchplayer,
                description = _okok('translations').searchplayerdesc,
                event = Config.EventPrefix..":searchPlayer",
            },
            {
                title = _okok('translations').handcuffplayer,
                description = _okok('translations').handcuffplayerdesc,
                event = Config.EventPrefix..":cuffPlayer",
            },
            {
                title = _okok('translations').escortplayer,
                description = _okok('translations').escortplayerdesc,
                event = Config.EventPrefix..":escortPlayer",
            },
            {
                title = _okok('translations').anklemonitor,
                description = _okok('translations').anklemonitordesc,
                event = Config.EventPrefix..":openAnkleMenu",
            },
            {
                title = _okok('translations').communityservice,
                description = _okok('translations').communityservicedesc,
                event = Config.EventPrefix..":openCommunityMenu",
            },
            {
                title = _okok('translations').jailplayer,
                description = _okok('translations').jailplayerdesc,
                event = Config.EventPrefix..":openJailMenu",
            },
            {
                title = _okok('translations').placeinvehicle,
                description = _okok('translations').placeinvehicledesc,
                event = Config.EventPrefix..":placeInVehicle",
            },
            {
                title = _okok('translations').removefromvehicle,
                description = _okok('translations').removefromvehicledesc,
                event = Config.EventPrefix..":takeFromVehicle",
            },
            {
                title = "⬅️ " .. _okok('translations').back,
                event = Config.EventPrefix..":openPoliceMenu"
            }
        }

        if not Config.UseBuiltInPrison and not Config.PrisonSystem == 'rcore-prison' then
            for i = #playerMenuOptions, 1, -1 do
                if playerMenuOptions[i].event == Config.EventPrefix..":openJailMenu" then
                    table.remove(playerMenuOptions, i)
                    break
                end
            end
        end

        if not Config.UseBuiltInCommunityService then
            for i = #playerMenuOptions, 1, -1 do
                if playerMenuOptions[i].event == Config.EventPrefix..":openCommunityMenu" then
                    table.remove(playerMenuOptions, i)
                    break
                end
            end
        end

        lib.registerContext({
            id = 'playerMenu',
            title = _okok('translations').playermenu,
            options = playerMenuOptions
        })

        lib.showContext('playerMenu')
    elseif Config.ContextMenuSystem == 'qb-menu' then
        local playerMenu = {
            {
                header = _okok('translations').playeractions,
                isMenuHeader = true
            },
            {
                header = _okok('translations').searchplayer,
                txt = _okok('translations').searchplayerdesc,
                params = { event = Config.EventPrefix..":searchPlayer" }
            },
            {
                header = _okok('translations').handcuffplayer,
                txt = _okok('translations').handcuffplayerdesc,
                params = { event = Config.EventPrefix..":cuffPlayer" }
            },
            {
                header = _okok('translations').escortplayer,
                txt = _okok('translations').escortplayerdesc,
                params = { event = Config.EventPrefix..":escortPlayer" }
            },
            {
                header = _okok('translations').anklemonitor,
                txt = _okok('translations').anklemonitordesc,
                params = { event = Config.EventPrefix..":openAnkleMenu" }
            },
            {
                header = _okok('translations').communityservice,
                txt = _okok('translations').communityservicedesc,
                params = { event = Config.EventPrefix..":openCommunityMenu" }
            },
            {
                header = _okok('translations').jailplayer,
                txt = _okok('translations').jailplayerdesc,
                params = { event = Config.EventPrefix..":openJailMenu" }
            },
            {
                header = _okok('translations').placeinvehicle,
                txt = _okok('translations').placeinvehicledesc,
                params = { event = Config.EventPrefix..":placeInVehicle" }
            },
            {
                header = _okok('translations').removefromvehicle,
                txt = _okok('translations').removefromvehicledesc,
                params = { event = Config.EventPrefix..":takeFromVehicle" }
            }
        }

        if not Config.UseBuiltInPrison and not Config.PrisonSystem == 'rcore-prison' then
            for i = #playerMenu, 1, -1 do
                if playerMenu[i].params and playerMenu[i].params.event == Config.EventPrefix..":openJailMenu" then
                    table.remove(playerMenu, i)
                    break
                end
            end
        end

        if not Config.UseBuiltInCommunityService then
            for i = #playerMenu, 1, -1 do
                if playerMenu[i].params and playerMenu[i].params.event == Config.EventPrefix..":openCommunityMenu" then
                    table.remove(playerMenu, i)
                    break
                end
            end
        end
    
        playerMenu[#playerMenu + 1] = {
            header = "⬅️ " .. _okok('translations').back,
            txt = '',
            params = {
                event = Config.EventPrefix..":openPoliceMenu"
            }
    
        }
        exports['qb-menu']:openMenu(playerMenu)
    end
end)

RegisterNetEvent(Config.EventPrefix..":openVehicleTargetMenu")
AddEventHandler(Config.EventPrefix..":openVehicleTargetMenu", function()
    if Config.ContextMenuSystem == 'okok-menu' then
        local options = {}
        local exitoption = {
            title =  "⬅️ " .. _okok('translations').back,
            event = "openPoliceMenu"
        }

        table.insert(options, {
            title = _okok('translations').vehicleinformation,
            description = _okok('translations').vehicleinformationdesc,
            event = "vehicleInformation"
        })

        if Config.UseImpoundOnMenu then
            table.insert(options, {
                title = _okok('translations').impoundvehicle,
                description = _okok('translations').impoundvehicledesc,
                event = "impoundVehicle"
            })
        end

        table.insert(options, {
            title = _okok('translations').forceopenvehicle,
            description = _okok('translations').forceopenvehicledesc,
            event = "forceOpenVehicle",
        })

        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'policeMenu',
            locales = Locales[Config.Locale].translations,
            options = options,
            exitOption = exitoption
        })

    elseif Config.ContextMenuSystem == 'ox-menu' then
        local vehicleMenuOptions = {
            {
                title = _okok('translations').vehicleinformation,
                description = _okok('translations').vehicleinformationdesc,
                event = Config.EventPrefix..":vehicleInformation",
            },
            {
                title = _okok('translations').forceopenvehicle,
                description = _okok('translations').forceopenvehicledesc,
                event = Config.EventPrefix..":forceOpenVehicle",
            },
            {
                title = "⬅️ " .. _okok('translations').back,
                event = Config.EventPrefix..":openPoliceMenu"
            }
        }
        
        if Config.UseImpoundOnMenu then
            table.insert(vehicleMenuOptions, {
                title = _okok('translations').impoundvehicle,
                description = _okok('translations').impoundvehicledesc,
                event = Config.EventPrefix..":impoundVehicle",
            })
        end

        lib.registerContext({
            id = 'vehicleMenu',
            title = _okok('translations').vehiclemenu,
            options = vehicleMenuOptions
        })

        lib.showContext('vehicleMenu')
    elseif Config.ContextMenuSystem == 'qb-menu' then
        local vehicleMenu = {
            {
                header = _okok('translations').vehicleactions,
                isMenuHeader = true
            },
            {
                header = _okok('translations').vehicleinformation,
                txt = _okok('translations').vehicleinformationdesc,
                params = { event = Config.EventPrefix..":vehicleInformation" }
            },
            {
                header = _okok('translations').forceopenvehicle,
                txt = _okok('translations').forceopenvehicledesc,
                params = { event = Config.EventPrefix..":forceOpenVehicle" }
            }
        }

        if Config.UseImpoundOnMenu then
            vehicleMenu[#vehicleMenu + 1] = {
                header = "⬅️ " .. _okok('translations').back,
                txt = '',
                params = { event = Config.EventPrefix..":openPoliceMenu" }
            }
        end
    
        vehicleMenu[#vehicleMenu + 1] = {
            header =  "⬅️ " .. _okok('translations').back,
            txt = '',
            params = { event = Config.EventPrefix..":openPoliceMenu" }
        }

        exports['qb-menu']:openMenu(vehicleMenu)
    end
end)

RegisterCommand(Config.OpenPoliceMenuComand, function(source, args, raw)
    if isPolice then TriggerEvent(Config.EventPrefix..":openPoliceMenu") end
end)

if Config.OpenPoliceMenuKey ~= nil then
    RegisterKeyMapping(Config.OpenPoliceMenuComand, _okok('translations').openpolicemenudesc, 'keyboard', Config.OpenPoliceMenuKey)
end
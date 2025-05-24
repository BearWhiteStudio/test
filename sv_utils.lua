QBCore = exports["qb-core"]:GetCoreObject()
local shopCreated = false
Webhook = ''

function MySQLfetchAll(query, values, func)
	return MySQL.Sync.fetchAll(query, values, func)
end

function MySQLexecute(query, values, func)
    return MySQL.Async.execute(query, values, func)
end

function MySQLfetchScalar(query, values, func)
    return MySQL.Async.fetchScalar(query, values, func)
end

function isPlayerDead(Player)
    if Player == nil then return false end
    local isDead = false -- Add your export to check if he is dead
    return isDead
end

function getPlayerOfflinePhone(citizenid)
    local query = string.format('SELECT json_extract(charinfo, "$.phone") as phone FROM players WHERE citizenid = @citizenid')
    local result = MySQLfetchAll(query, {['@citizenid'] = citizenid})
    if result[1] then
        return result[1].phone:gsub('"', '')
    end
end

function hasItem(source, item)
    if Config.InventorySystem == 'qb-inventory-new' then
        return exports['qb-inventory']:HasItem(source, item, 1)
    elseif Config.InventorySystem == 'qb-inventory' then
        return exports['qb-inventory']:HasItem(source, item, 1)
    elseif Config.InventorySystem == 'ox-inventory' then
        local hasItem = lib.callback.await(Config.EventPrefix..":checkItem", source, item)
        return hasItem
    elseif Config.InventorySystem == 'qs-inventory' then
        local hasItem = exports['qs-inventory']:GetItemTotalAmount(source, item)
        if hasItem >= 1 then return true else return false end
    end
end

function addItem(source, item)
    if Config.InventorySystem == 'qb-inventory-new' then
        return exports['qb-inventory']:AddItem(source, item, 1, false, false, 'Cuffing user')
    elseif Config.InventorySystem == 'qb-inventory' then
        return exports['qb-inventory']:AddItem(source, item, 1)
    elseif Config.InventorySystem == 'ox-inventory' then
        return exports.ox_inventory:AddItem(source, item, 1)
    elseif Config.InventorySystem == 'qs-inventory' then
        return exports['qs-inventory']:AddItem(source, item, 1)
    end
end

function removeItem(source, item)
    if Config.InventorySystem == 'qb-inventory-new' then
        return exports['qb-inventory']:RemoveItem(source, item, 1, false, 'Uncuffing user')
    elseif Config.InventorySystem == 'qb-inventory' then
        return exports['qb-inventory']:RemoveItem(source, item, 1)
    elseif Config.InventorySystem == 'ox-inventory' then
        return exports.ox_inventory:RemoveItem(source, item, 1)
    elseif Config.InventorySystem == 'qs-inventory' then
        return exports['qs-inventory']:RemoveItem(source, item, 1)
    end
end

function clearInventory(source)
    if Config.InventorySystem == 'qb-inventory-new' then
        return exports['qb-inventory']:ClearInventory(source)
    elseif Config.InventorySystem == 'qb-inventory' then
        return exports['qb-inventory']:ClearInventory(source)
    elseif Config.InventorySystem == 'ox-inventory' then
        return exports.ox_inventory:ClearInventory(source)
    elseif Config.InventorySystem == 'qs-inventory' then
        return exports['qs-inventory']:ClearInventory(source)
    end
end

function searchPlayer(source, target)
    if Config.InventorySystem == 'qb-inventory-new' then
        exports['qb-inventory']:OpenInventoryById(source, target)
    elseif Config.InventorySystem == 'qb-inventory' then
        TriggerClientEvent(Config.EventPrefix..':openInventory', source, 'player', target)
    elseif Config.InventorySystem == 'ox-inventory' then
        TriggerClientEvent(Config.EventPrefix..':openInventory', source, 'player', target)
    elseif Config.InventorySystem == 'qs-inventory' then
        TriggerClientEvent(Config.EventPrefix..':openInventory', source, 'player', target)
    end
end

function openStash(source, inventory)
    if Config.InventorySystem == 'qb-inventory-new' then
        exports['qb-inventory']:OpenInventory(source, inventory, { maxweight = 4000000, slots = 300 })
    elseif Config.InventorySystem == 'qb-inventory' then
        TriggerClientEvent(Config.EventPrefix..':openInventory', source, 'stash', inventory)
    elseif Config.InventorySystem == 'ox-inventory' then
        exports.ox_inventory:RegisterStash(inventory, inventory, 300, 4000000)
        TriggerClientEvent(Config.EventPrefix..':openInventory', source, 'stash', inventory)
    elseif Config.InventorySystem == 'qs-inventory' then
        exports['qs-inventory']:RegisterStash(source, inventory, 300, 4000000)
        TriggerClientEvent(Config.EventPrefix..':openInventory', source, 'stash', inventory)
    end
end

function openArmoryMenu(source, items, inventory)
    if Config.InventorySystem == 'qb-inventory-new' then
        if not shopCreated then
            exports['qb-inventory']:CreateShop({ name = inventory, label = 'Police Shop', slots = #items, items = items })
            shopCreated = true
        end
        exports['qb-inventory']:OpenShop(source, inventory)
    elseif Config.InventorySystem == 'qb-inventory' then
        local inventoryList = {}
        for k,v in pairs(items) do
            table.insert(inventoryList, {name = v.name, price = v.price, info = {}, amount = v.amount, slot = #inventoryList + 1})
        end
        local items = {
            label = 'Police Shop',
            slots = #inventoryList,
            items = inventoryList
        }
        TriggerClientEvent(Config.EventPrefix..':openInventory', source, 'shop', inventory, items)
    elseif Config.InventorySystem == 'ox-inventory' then
        local inventoryList = {}
        for k,v in pairs(items) do
            table.insert(inventoryList, {name = v.name, price = v.price})
        end
        exports.ox_inventory:RegisterShop(inventory, {
            name = inventory,
            inventory = inventoryList
        })
        TriggerClientEvent(Config.EventPrefix..':openInventory', source, 'shop', inventory)
    elseif Config.InventorySystem == 'qs-inventory' then
        local inventoryList = {}
        for k,v in pairs(items) do
            table.insert(inventoryList, {name = v.name, price = v.price, info = {}, amount = v.amount, slot = #inventoryList + 1})
        end
        local items = {
            label = 'Police Shop',
            slots = #inventoryList,
            items = inventoryList
        }
        TriggerClientEvent(Config.EventPrefix..':openInventory', source, 'shop', inventory, items)
    end
end

function deleteTrash(inventory)
    if Config.InventorySystem == 'qb-inventory-new' then
        MySQLexecute("DELETE FROM inventories WHERE identifier = @identifier", {['@identifier'] = inventory })
        exports['qb-inventory']:ClearInventoryByName(inventory)
    elseif Config.InventorySystem == 'qb-inventory' then
        MySQLexecute("DELETE FROM stashitems WHERE stash = @inventory", {['@inventory'] = inventory })
    elseif Config.InventorySystem == 'ox-inventory' then
        local status, error = pcall(function() exports.ox_inventory:ClearInventory(inventory, {}) end)
    elseif Config.InventorySystem == 'qs-inventory' then
        MySQLexecute("DELETE FROM inventory_stash WHERE stash = @inventory", {['@inventory'] = inventory })
    end
end

function giveVehicleKeys(source, plate, model)
    if Config.KeySystem == 'qb-vehiclekeys' then
        TriggerClientEvent("vehiclekeys:client:SetOwner", source, plate:match( "^%s*(.-)%s*$" ))
    elseif Config.KeySystem == 'wasabi-keys' then
        exports.wasabi_carlock:GiveKey(source, plate:match( "^%s*(.-)%s*$" ))
    elseif Config.KeySystem == 'qs-vehiclekeys' then
        TriggerClientEvent(Config.EventPrefix..':giveQuasarKeys', source, plate, model)
    elseif Config.KeySystem == "jaksam-keys" then
        exports["vehicles_keys"]:giveVehicleKeysToPlayerId(source, plate:match( "^%s*(.-)%s*$" ), model)
    end
end

function sendEmergencySignal(source, coords, playerName)
    TriggerClientEvent(Config.EventPrefix..':setEmergencySignal', source, coords, playerName)
end

function billPlayer(source, amount, targetcitizenid)
    if Config.UseOkokBilling then

        if Config.BillPlateOwner then -- Bill the owner of the vehicle so it should be offline bill since he might not be online
            
            if not targetcitizenid then return end -- If the vehicle is not owned by anyone then return
            
            local target = getPlayerByCitizenID(targetcitizenid)
            if target then
                targetSource = getPlayerSource(target)
                TriggerEvent("okokBilling:CreateCustomInvoice", targetSource, amount, _okok('translations').speedtrap, _okok('translations').radar, 'police', 'Police')
            else
                MySQLexecute('INSERT INTO okokbilling (ref_id, fees_amount, receiver_identifier, receiver_name, author_identifier, author_name, society, society_name, item, invoice_value, status, notes, sent_date, limit_pay_date) VALUES (CONCAT("OK", UPPER(LEFT(UUID(), 8))), 0, @receiver_identifier, @receiver_name, @author_identifier, @author_name, @society, @society_name, @item, @invoice_value, @status, @notes, CURRENT_TIMESTAMP(), DATE_ADD(CURRENT_DATE, INTERVAL 7 DAY))', {
                    ['@receiver_identifier'] = tostring(targetcitizenid),
                    ['@receiver_name'] = tostring(getPlayerOfflineName(targetcitizenid)),
                    ['@author_identifier'] = 'police',
                    ['@author_name'] = _okok('translations').radar,
                    ['@society'] = 'police',
                    ['@society_name'] = 'Police',
                    ['@item'] = _okok('translations').speedtrap,
                    ['@invoice_value'] = tostring(amount),
                    ['@status'] = 'unpaid',
                    ['@notes'] = ''
                })
            end
        else
            TriggerEvent("okokBilling:CreateCustomInvoice", source, amount, _okok('translations').speedtrap, _okok('translations').radar, 'police', 'Police')
        end
    else
        -- Add your own billing system here
    end
end

function impoundVehicle(source, plate)
    if GetResourceState('jg-advancedgarages') == 'started' then
        TriggerClientEvent("jg-advancedgarages:client:ImpoundVehicle", source)
    elseif Config.UseOkokGarage then
        TriggerClientEvent('okokGarage:openPoliceImpound', source)
    else
        MySQLexecute('UPDATE player_vehicles SET `state` = @state WHERE plate = @plate', {
            ['@state'] = 2,
            ['@plate'] = plate:match( "^%s*(.-)%s*$" ),
        }, function (rowsChanged)
            if rowsChanged > 0 then
                TriggerClientEvent(Config.EventPrefix..':notification', source, _okok('impounded_vehicle').title, interp(_okok('impounded_vehicle').text, {plate = plate}), _okok('impounded_vehicle').type, _okok('impounded_vehicle').time)
            end
        end)
    end
end

RegisterServerEvent(Config.EventPrefix..":escortPlayer")
AddEventHandler(Config.EventPrefix..":escortPlayer", function(target)
    local src = source
    local xPlayer = getPlayer(src)
    local tPlayer = getPlayer(target)
    local tSource = getPlayerSource(tPlayer)
    if tPlayer ~= nil then
        TriggerClientEvent(Config.EventPrefix..':getEscorted', tSource, src)
    end
end)

-- Webhooks
function discordWebhook(data)
	local information = {}

    if data.type == 'searchplayer' then
		information = {
			{
				["color"] = data.color,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName..' - Logs',
				},
				["title"] = data.title,
				["description"] = '**Action:** '..data.action..'\n\n**Player Searched:** '..data.searched..'\n**Searched Identifier:** '..data.searchedid.. '\n\n**Police Officer:** '..data.police..'\n**Identifier:** '..data.policeid..'\n**Discord:** '..data.discord,
				["footer"] = {
					["text"] = os.date(Config.DateFormat),
				}
			}
		}
	elseif data.type == 'placeankle' then
		information = {
			{
				["color"] = data.color,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName..' - Logs',
				},
				["title"] = data.title,
				["description"] = '**Action:** '..data.action..'\n\n**Target Name:** '..data.searched..'\n**Target Identifier:** '..data.searchedid.. '\n\n**Police Officer:** '..data.police..'\n**Identifier:** '..data.policeid..'\n**Discord:** '..data.discord,
				["footer"] = {
					["text"] = os.date(Config.DateFormat),
				}
			}
		}
	elseif data.type == 'removeankle' then
		information = {
			{
				["color"] = data.color,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName..' - Logs',
				},
				["title"] = data.title,
				["description"] = '**Action:** '..data.action..'\n\n**Target Name:** '..data.searched..'\n**Target Identifier:** '..data.searchedid.. '\n\n**Police Officer:** '..data.police..'\n**Identifier:** '..data.policeid..'\n**Discord:** '..data.discord,
				["footer"] = {
					["text"] = os.date(Config.DateFormat),
				}
			}
		}
	elseif data.type == 'jailplayer' then
		information = {
			{
				["color"] = data.color,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName..' - Logs',
				},
				["title"] = data.title,
				["description"] = '**Action:** '..data.action..'\n\n**Player Jailed:** '..data.searched..'\n**Player  Identifier:** '..data.searchedid.. '\n\n**Police Officer:** '..data.police..'\n**Identifier:** '..data.policeid..'\n**Discord:** '..data.discord..'\n\n**Jail Time:** '..data.time..' months',
				["footer"] = {
					["text"] = os.date(Config.DateFormat),
				}
			}
		}
	elseif data.type == 'communityplayer' then
		information = {
			{
				["color"] = data.color,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName..' - Logs',
				},
				["title"] = data.title,
				["description"] = '**Action:** '..data.action..'\n\n**Target Name:** '..data.searched..'\n**Target Identifier:** '..data.searchedid.. '\n\n**Police Officer:** '..data.police..'\n**Identifier:** '..data.policeid..'\n**Discord:** '..data.discord..'\n\n**Community Time:** '..data.time..' months',
                ["footer"] = {
                    ["text"] = os.date(Config.DateFormat),
                }
			}
		}
	elseif data.type == 'sendreport' then
		information = {
			{
				["color"] = data.color,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName..' - Logs',
				},
				["title"] = data.title,
				["description"] = '**Action:** '..data.action..'\n\n**Player Name:** '..data.playername..'\n**Player Identifier:** '..data.playeridentifier.. '\n**Phone Number:** '..data.phone..'\n**Date:** '..data.date..'\n\n**Description:** '..data.description..'\n\n**Discord:** '..data.discord,
                ["footer"] = {
                    ["text"] = os.date(Config.DateFormat),
                }
			}
		}
	elseif data.type == 'changereport' then
        information = {
			{
				["color"] = data.color,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName..' - Logs',
				},
				["title"] = data.title,
				["description"] = '**Action:** '..data.action..'\n\n**Report ID:** '..data.reportid..'\n**New Status:** '..data.status.. '\n\n**Police Officer:** '..data.police..'\n**Identifier:** '..data.policeid..'\n**Discord:** '..data.discord,
                ["footer"] = {
                    ["text"] = os.date(Config.DateFormat),
                }
			}
		}
	elseif data.type == 'deletereport' then
        information = {
			{
				["color"] = data.color,
				["author"] = {
					["icon_url"] = Config.IconURL,
					["name"] = Config.ServerName..' - Logs',
				},
				["title"] = data.title,
				["description"] = '**Action:** '..data.action..'\n\n**Report ID:** '..data.reportid.. '\n\n**Police Officer:** '..data.police..'\n**Identifier:** '..data.policeid..'\n**Discord:** '..data.discord,
                ["footer"] = {
                    ["text"] = os.date(Config.DateFormat),
                }
			}
		}
	end
	PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.BotName, embeds = information}), {['Content-Type'] = 'application/json'})
end
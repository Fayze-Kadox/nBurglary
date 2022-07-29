-----
----
---         This code is owned by Nathan </>#0001 and may not be used outside of this resource, resale of resource is prohibited
---
----
-----

ESX = nil

TriggerEvent(format("esx:getSharedObject"), function(obj) ESX = obj end)

local istime = true

RegisterCommand(Config.Command, function(source, args, raw)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if CheckIsAdmin(src) then
        TriggerClientEvent(format("nBurglary:openMenu"), src)
    else
        TriggerClientEvent(format("esx:showNotification"), src, "~r~Vous n'avez pas le droit !")
    end
end)

function GetIdentifier(src, tipo)
	local src = src
	local license
	if tipo == 'steam' then
		for k,v in ipairs(GetPlayerIdentifiers(src)) do
			if string.match(v, 'steam') then
				license = v
				return license
			end
		end
	elseif tipo == 'license' then
		for k,v in ipairs(GetPlayerIdentifiers(src)) do
			if string.match(v, 'license') then
				license = v
				return license
			end
		end
	elseif tipo == 'discord' then
		for k,v in ipairs(GetPlayerIdentifiers(src)) do
			if string.match(v, 'discord') then
				license = v
				return license
			end
		end
	end
end

function CheckIsAdmin(src)
    local identifier = GetIdentifier(src, Config.Identifier)
    for k,v in pairs(Config.Admins) do
        if v == identifier then
            return true
        end
    end
    return false
end


----------------------------------
----------------------------------------
----------------------------------

RegisterNetEvent(format("cambriolage:create"))
AddEventHandler(format("cambriolage:create"), function(price, create, difficulty, dog2, position, name, creator, properties, position2, time, timereload)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.execute([[

            INSERT INTO `nBurglary` (`name`, `price`, `difficulty`, `dog`, `pospoint`, `builder`, `properties`, `posenter`, `time`, `timereload`) VALUES
                (@name, @price, @difficulty, @dog, @position, @builder, @properties, @position2, @time, @timereload)
            ;

    ]], {
        ['@name'] = name,
        ['@price'] = price,
        ['@difficulty'] = difficulty,
        ['@dog'] = dog2,
        ['@position'] = json.encode(position),
        ['@builder'] = creator,
        ['@properties'] = properties,
        ['@position2'] = json.encode(position2),
        ['@time'] = time,
        ['@timereload'] = timereload
	}, function(result)
        TriggerClientEvent(format("esx:showNotification"), source, "~g~Le cambriolage a été créé !")
        TriggerClientEvent(format("nBurglary:openMenu"), source)
    end)
end)

ESX.RegisterServerCallback(format('nBurglary:getBurglary'), function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source);
    local home = {}

    MySQL.Async.fetchAll("SELECT * FROM nBurglary", {
    }, function(result)
        for i = 1, #result, 1 do
            table.insert(home, {
                id         = result[i].id,
                name = result[i].name,
                price = result[i].price,
                difficulty = result[i].difficulty,
                dog2 = result[i].dog,
                pospoint     = json.decode(result[i].pospoint),
                builder     = result[i].builder,
                properties     = result[i].properties,
                posenter     = json.decode(result[i].posenter),
                time = result[i].time,
                timereload = result[i].timereload
            })
        end

        cb(home)
    end)
end)

RegisterNetEvent(format("nBurglary:refresh"))
AddEventHandler(format("nBurglary:refresh"), function()
    TriggerClientEvent("nBurglary:refresh", -1)
end)

RegisterNetEvent(format('svr:SetBucket'))
AddEventHandler(format('svr:SetBucket'), function(bucket)
    SetPlayerRoutingBucket(source, bucket)
end)

RegisterNetEvent(format("nBurglary:delete"))
AddEventHandler(format("nBurglary:delete"), function(id)
    MySQL.Async.execute([[

            DELETE FROM `nBurglary` WHERE `id` = @id
            ;

    ]], {
        ['@id'] = id
    }, function(result)
    end)
end)

RegisterNetEvent(format("nBurglary:pouletgrillet"))
AddEventHandler(format("nBurglary:pouletgrillet"), function(item, code)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if code ~= 15758 then
        TriggerClientEvent(format("esx:showNotification"), source, "~r~Ce code est incorrect !")
    else
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.addInventoryItem(item, 1)
        TriggerClientEvent(format("esx:showNotification"), source, "Vous avez reçu un ~b~"..item.." !")
    end
end)


-- Revente

-- IllegalLegal

RegisterNetEvent(format("Burglary:sell2"))
AddEventHandler(format("Burglary:sell2"), function(item, price, code)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if code == "45656" then
        local count = xPlayer.getInventoryItem(item).count
        if count >= 1 then
            xPlayer.removeInventoryItem(item, 1)
            xPlayer.addAccountMoney('black_money', tonumber(price))

            TriggerClientEvent(format("esx:showNotification"), source, "Vous avez vendu ~p~~h~" .. item)
            TriggerClientEvent(format("esx:showNotification"), source, "Vous avez reçu " .. price.. " ~g~$")
        else
            TriggerClientEvent(format("esx:showNotification"), source, "Vous n'avez pas assez ~r~d'objet")
        end

    else
        TriggerClientEvent(format("esx:showNotification"), source, "Cheater")
    end
end)

-- Legal

RegisterNetEvent(format("Burglary:sell"))
AddEventHandler(format("Burglary:sell"), function(item, price, code)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if code == "6547" then
        local count = xPlayer.getInventoryItem(item).count
        if count >= 1 then
            xPlayer.removeInventoryItem(item, 1)
            xPlayer.addMoney(price)
            TriggerClientEvent(format("esx:showNotification"), source, "Vous avez vendu ~p~~h~" .. item)
            TriggerClientEvent(format("esx:showNotification"), source, "Vous avez reçu " .. price.. " ~g~$")
        else
            TriggerClientEvent(format("esx:showNotification"), source, "Vous n'avez pas assez ~r~d'objet")
        end

    else
        TriggerClientEvent(format("esx:showNotification"), source, "Cheater")
    end
end)

RegisterNetEvent(format("nBurglary:police"))
AddEventHandler(format("nBurglary:police"), function(plyPosition)
    TriggerClientEvent(format("nBurglary:policenotify"), -1, plyPosition)
end)

ESX.RegisterServerCallback(format('nBurglary:getBurglaryLockPick'), function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source);
    local burglaryLockPick = xPlayer.getInventoryItem('burglary_lockpick').count;
    cb(burglaryLockPick)
end)

RegisterNetEvent(format("nBurglary:removeBurglaryLockPick"))
AddEventHandler(format("nBurglary:removeBurglaryLockPick"), function(count)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('burglary_lockpick', count)
end)

RegisterNetEvent(format("nBurglary:buylockpick"))
AddEventHandler(format("nBurglary:buylockpick"), function(price, code)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if code == "57789" then
        local plyMoney = xPlayer.getMoney()
                print(type(plyMoney))
        if plyMoney >= price then
            xPlayer.removeMoney(price)
            xPlayer.addInventoryItem('burglary_lockpick', 1)
            TriggerClientEvent(format("esx:showNotification"), source, "Vous avez acheté un ~b~lockpick~w~ pour " .. price .. " ~g~$")
        else
            TriggerClientEvent(format("esx:showNotification"), source, "Vous n'avez pas assez ~r~d'argent")
        end
    else
        TriggerClientEvent(format("esx:showNotification"), source, "Cheater")
    end
end)

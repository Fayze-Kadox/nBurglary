-----
----
---         This code is owned by Nathan </>#0001 and may not be used outside of this resource, resale of resource is prohibited
---
----
-----

ESX = nil

TriggerEvent(format('esx:getSharedObject'), function(obj) ESX = obj end)

local SelectedBurglary = {}
local dayBurglary = 0
ESX.TriggerServerCallback(format('nBurglary:getBurglary'), function(home)
    if home then
        SelectedBurglary = home
    end
end)


SetTimeout(2000, function() print("Le script de ^5cambriolage^7 vient d'être lancée avec ^2succès") end)

SetTimeout(2000, function() addBlip() end)

function LoadModel(model)
    while not HasModelLoaded(model) do
      RequestModel(model)
      Wait(1)
    end
end

function LoadAnim(animDict)
  RequestAnimDict(animDict)

  while not HasAnimDictLoaded(animDict) do
    Citizen.Wait(10)
  end
end

function loaddict(animDict)
  RequestAnimDict(animDict)

  while not HasAnimDictLoaded(animDict) do
    Citizen.Wait(10)
  end
end

function SetBucket()
    TriggerServerEvent(format('svr:SetBucket'), GetPlayerServerId(PlayerId()))
end

local objectList = {}
local infoBurglary = {};
local allLoot = false
local posdog = true
local dog45 = false
local dogposition = nil
local object = 0
local notCarry = false
local notExit2 = false
local burglarystart = false
local PlayerData = ESX.GetPlayerData()
local create = false
local lootNumber = 0
local properties = 0
local posenter = {}
local create2 = false
local price = "0"
local difficulty = 1
local dog2 = nil
local pospoint = {}
local preview_possible = true
local posenter = {}
local defini = "~r~Aucun"
local time = 0
local alarm = false
local incam = false

local col = 0
local bijoux = 0
local vase = 0

local menushop = RageUI.CreateMenu("Cambriolage", "Vendeur")

local burglary = RageUI.CreateMenu("Cambriolage", "Action")
local burglary2 = RageUI.CreateMenu("Cambriolage", "Action")
local burglary3 = RageUI.CreateSubMenu(burglary, "Cambriolage", "Action")
local burglary4 = RageUI.CreateSubMenu(burglary, "Cambriolage", "Edit")

local propList = {"Petite", "Centre Ville", "Haute", "Luxe", "Motel", "Entrepot grand", "Entrepot moyen", "Entrepot petit", "Bureau d'avocat" , "~o~Retour~s~"}

burglary.Closed = function()
    open = false
    FreezeEntityPosition(GetPlayerPed(-1), false)
end

menushop.Closed = function()
    open = false
    FreezeEntityPosition(GetPlayerPed(-1), false)
end

burglary2.Closed = function()
    open = false
    FreezeEntityPosition(GetPlayerPed(-1), false)
end

local function OpenBurglary()
    if not open then
        open = true
        RageUI.Visible(burglary, true)
        CreateThread(function()
            while open do
                RageUI.IsVisible(burglary, function()

                        if create2 == false then
                        RageUI.Separator("↓ Action ↓")
                        end

                        RageUI.Checkbox("~g~Creer~s~ un cambriolage", nil, create, {}, {
                            onChecked = function()
                                create = true
                                create2 = true
                            end,
                            onUnChecked = function()
                                create = false
                                create2 = false
                            end,
                            onSelected = function(index)
                                create = index
                            end
                        })

                        RageUI.Separator('------------------------------------')

                        if create2 == false then
                        RageUI.Button("~r~Supprimer~s~ un cambriolage", nil, {RightLabel = "~r~→→→"}, true, {}, burglary3)

                        end

                        if create2 == true then

                        RageUI.Button("Définir un nom", false, { RightLabel = name }, true, {
                            onSelected = function()
                                name = KeyboardInput("","", "", 100)
                            end
                        })

                        RageUI.Button("Définir un point d'entrée", false, { RightLabel = defini }, true, {
                            onSelected = function()
                                point2 = true
                                local coords = GetEntityCoords(PlayerPedId())
                                pospoint = {x = coords.x, y = coords.y, z = coords.z}
                                ESX.ShowNotification("Vous avez défini un point ~g~d'entrée")
                                anciennePos = GetEntityCoords(GetPlayerPed(-1))
                                defini = "~g~Défini"
                            end
                        })

                        levelList = {"1", "2", "3", "4", "5"}
                        RageUI.List("Niveaux de difficulté",levelList, 1,nil,{},true,{
                            onHovered = function()
                            end,
                            onListChange = function(index, item)
                                difficulty = levelList[index]
                            end
                        },nil)

                        dogList = {"~r~NON~s~", "~g~OUI~s~"}
                        RageUI.List("Avec Chien",dogList, 1,nil,{},true,{
                            onHovered = function()
                            end,
                            onSelected = function()
                            end,
                            onListChange = function(index, item)
                                if dogList[index] == "~g~OUI~s~" then
                                    dog45 = true
                                    dog2 = 1
                                end
                                if dogList[index] == "~r~NON~s~" then
                                    dog45 = false
                                    dog2 = 0
                                end
                            end
                        },nil)

                        RageUI.List("Liste des propriété",propList, 1,"Appuyer pour ~b~valider~s~\nSélectionner '~o~Retour~s~'",{},true,{
                            onHovered = function()
                            end,
                            onSelected = function(index, item)
                                if propList[index] == "Petite" then
                                    DoScreenFadeOut(500)
                                        Wait(500)
                                        SetEntityCoords(GetPlayerPed(-1), 265.6031, -1002.9244, -99.0086)
                                        posenter = {x = 265.6031, y = -1002.9244, z = -99.0086}
                                        properties = "Petite"
                                    DoScreenFadeIn(1000)
                                end
                                if propList[index] == "Centre Ville" then
                                    DoScreenFadeOut(500)
                                        Wait(500)
                                        SetEntityCoords(GetPlayerPed(-1), -616.8566, 59.3575, 98.2000)
                                        posenter = {x = -616.8566, y = 59.3575, z = 98.2000}
                                        properties = "Centre Ville"
                                    DoScreenFadeIn(1000)
                                end
                                if propList[index] == "Moderne" then
                                    DoScreenFadeOut(500)
                                        Wait(500)
                                        SetEntityCoords(GetPlayerPed(-1), -788.3881, 320.2430, 187.3132)
                                        posenter = {x = -788.3881, y = 320.2430, z = 187.3132}
                                        properties = "Moderne"
                                    DoScreenFadeIn(1000)
                                end
                                if propList[index] == "Haute" then
                                    DoScreenFadeOut(1000)
                                        Wait(500)
                                        SetEntityCoords(GetPlayerPed(-1), -1459.1700, -520.5855, 56.9247)
                                        posenter = {x = -1459.1700, y = -520.5855, z = 56.9247}
                                        properties = "Haute"
                                    DoScreenFadeIn(1000)
                                end
                                if propList[index] == "Luxe" then
                                    DoScreenFadeOut(1000)
                                        Wait(500)
                                        SetEntityCoords(GetPlayerPed(-1), -674.4503, 595.6156, 145.3796)
                                        posenter = {x = -674.4503, y = 595.6156, z = 145.3796}
                                        properties = "Luxe"
                                    DoScreenFadeIn(1000)
                                end
                                if propList[index] == "Motel" then
                                    DoScreenFadeOut(1000)
                                        Wait(500)
                                        SetEntityCoords(GetPlayerPed(-1), 151.0994, -1007.8073, -98.9999)
                                        posenter = {x = 151.0994, y = -1007.8073, z = -98.9999}
                                        properties = "Motel"
                                    DoScreenFadeIn(1000)
                                end
                                if propList[index] == "Entrepot grand" then
                                    DoScreenFadeOut(1000)
                                        Wait(500)
                                        SetEntityCoords(GetPlayerPed(-1), 1026.8707, -3099.8710, -38.9998)
                                        posenter = {x = 1026.8707, y = -3099.8710, z = -38.9998}
                                        properties = "Entrepot grand"
                                    DoScreenFadeIn(1000)
                                end
                                if propList[index] == "Entrepot moyen" then
                                    DoScreenFadeOut(1000)
                                        Wait(500)
                                        SetEntityCoords(GetPlayerPed(-1), 1072.8447, -3100.0390, -38.9999)
                                        posenter = {x = 1072.8447, y = -3100.0390, z = -38.9999}
                                        properties = "Entrepot moyen"
                                    DoScreenFadeIn(1000)
                                end
                                if propList[index] == "Entrepot petit" then
                                    DoScreenFadeOut(1000)
                                        Wait(500)
                                        SetEntityCoords(GetPlayerPed(-1), 1104.7231, -3100.0690, -38.9999)
                                        posenter = {x = 1104.7231, y = -3100.0690, z = -38.9999}
                                        properties = "Entrepot petit"
                                    DoScreenFadeIn(1000)
                                end
                                if propList[index] == "Sous marin" then
                                    DoScreenFadeOut(1000)
                                        Wait(500)
                                        SetEntityCoords(GetPlayerPed(-1), 514.33, 4886.18, -62.59)
                                        posenter = {x = 514.33, y = 4886.18, z = -62.59}
                                        properties = "Sous marin"
                                    DoScreenFadeIn(1000)
                                end
                                if propList[index] == "Bureau d'avocat" then
                                    DoScreenFadeOut(1000)
                                        Wait(500)
                                        SetEntityCoords(GetPlayerPed(-1), -1902.603, -573.016, 19.09)
                                        posenter = {x = -1902.603, y = -573.016, z = 19.09}
                                        properties = "Bureau d'avocat"
                                    DoScreenFadeIn(1000)
                                end
                                if propList[index] == "Bunker luxieux" then
                                    DoScreenFadeOut(1000)
                                        Wait(500)
                                        SetEntityCoords(GetPlayerPed(-1), -1520.95, -3002.184, -82.207)
                                        posenter = {x = -1520.95, y = -3002.184, z = -82.207}
                                        properties = "Bunker luxieux"
                                    DoScreenFadeIn(1000)
                                end
                                if propList[index] == "Maison 3 étages" then
                                    DoScreenFadeOut(1000)
                                        Wait(500)
                                        SetEntityCoords(GetPlayerPed(-1), -174.284, 497.640, 137.663)
                                        posenter = {x = -174.284, y = 497.640, z = 137.663}
                                        properties = "Maison 3 étages"
                                    DoScreenFadeIn(1000)
                                end
                                if propList[index] == "~o~Retour~s~" then
									SetEntityCoords(GetPlayerPed(-1), anciennePos)
                                end
                            end
                        },nil)

                       RageUI.Button("Temps", false, { RightLabel =  "~b~"..time.. " ~s~minutes"}, true, {
                            onSelected = function()
                                time2 = true
                                time = KeyboardInput("Temps pour le ~r~Cambriolage~s~","Temps pour le ~r~Cambriolage~s~", "", 100)
                                ESX.ShowNotification("Vous avez défini un temps de ~g~cambriolage~s~ de ~r~"..time.."~s~ minutes.")
                            end
                        })

                        RageUI.Separator('------------------------------------')

                        if point2 == true and properties ~= 0 and time ~= 0 then
                         RageUI.Button("Valide", nil, { RightLabel = "~g~~h~>>" }, true, {
                            onSelected = function()
                                TriggerServerEvent("cambriolage:create", price, builder, difficulty, dog2, pospoint, name, GetPlayerName(PlayerId()), properties, posenter, time, Config.TimeToReload)
                                --TriggerServerEvent("nBurglary:refresh")
                                SetEntityCoords(GetPlayerPed(-1), anciennePos)

                                SetTimeout(2000, function()
                                    ESX.TriggerServerCallback('nBurglary:getBurglary', function(home)
                                        if home then
                                            SelectedBurglary = home
                                        end
                                    end)
                                    addBlip()
                                    TriggerServerEvent("nBurglary:refresh")
                                end)

                            end
                        })

                        else

                        RageUI.Button("Valider", nil, {RightBadge = RageUI.BadgeStyle.Lock}, true, {
                            onSelected = function()
                            end
                        })
                        end

                        if point2 == true then
                        DrawMarker(1, pospoint.x, pospoint.y, pospoint.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 0.5001, 0, 102, 204, 200, 0, 0, 0, 0)
                        end
                    end
                end)

                --
                RageUI.IsVisible(burglary3, function()
                    ESX.TriggerServerCallback('nBurglary:getBurglary', function(home)
                        if home then
                            SelectedBurglary = home
                        end
                    end)

                    RageUI.Separator("↓ Liste des cambriolages ↓")
                    for k, v in pairs(SelectedBurglary) do
                        RageUI.Button("~b~→~s~ "..v.name, "Difficultés: ~o~" ..v.difficulty.. "~s~\nChien: ~p~" ..v.dog2.. "~s~\nCreateur: ~g~" .. v.builder .. "~s~\nTemps: ~r~" .. v.time.. "~s~ minutes", { RightLabel = "~p~"..v.id}, true, {
                            onSelected = function()

                                TriggerServerEvent("nBurglary:delete", v.id)

                                ESX.TriggerServerCallback('nBurglary:getBurglary', function(home)
                                    if home then
                                        SelectedBurglary = home
                                    end
                                end)

                                addBlip()

                           end
                        })

                    end

                end)
            Wait(0)
            end
        end)
    end
end

RegisterNetEvent(format("nBurglary:policenotify"))
AddEventHandler(format("nBurglary:policenotify"), function(posBurglary)
    local PlayerData = ESX.GetPlayerData()
    local blip = nil

    while PlayerData.job == nil do
        Citizen.Wait(1)
    end

    if PlayerData.job.name == Config.Policejob then
        local street = GetStreetNameAtCoord(posBurglary.x, posBurglary.y, posBurglary.z)
        local streetName = GetStreetNameFromHashKey(street)
        ESX.ShowAdvancedNotification("Central lspd", "Alerte [Code ~r~30~s~]", "Cambriolage en cours\nRue: ~b~" .. streetName.. "~s~", "CHAR_CALL911", 1)
        if not DoesBlipExist(blip) then
            blip = AddBlipForCoord(posBurglary.x, posBurglary.y, posBurglary.z)
            SetBlipSprite(blip, 161)
            SetBlipScale(blip, 1.2)
            SetBlipColour(blip, 1)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Cambriolage de Propriété")
            EndTextCommandSetBlipName(blip)

            PulseBlip(blip)
            Citizen.Wait(240000)
            RemoveBlip(blip)
        end
    end
end)

function StartBurglary(id, positions, name, builder, difficulty, dog2, properties, time, position2)
    local time3 = time
    SetEntityCoords(GetPlayerPed(-1), positions.x, positions.y, positions.z)
    CreateThread(function()
        while burglarystart do
            if dog2 == "1" and posdog then

                if properties == "Petite" then
                    dogposition = vector3(257.12,-995.91,-100.0)
                elseif properties == "Centre Ville" then
                    dogposition = vector3(-606.21,41.92,96.41)
                elseif properties == "Haute" then
                    dogposition = vector3(-1456.86,-523.03,55.94)
                elseif properties == "Luxe" then
                    dogposition = vector3(-680.67,586.96,144.39)
                elseif properties == "Motel" then
                    dogposition = vector3(151.29,-1004.5,-99.99)
                elseif properties == "Entrepot grand" then
                    dogposition = vector3(1003.1,-3112.12,-39.99)
                elseif properties == "Entrepot moyen" then
                    dogposition = vector3(1049.13,-3100.6,-39.99)
                elseif properties == "Entrepot petit" then
                    dogposition = vector3(1088.44,-3101.22,-39.99)
                elseif properties == "Bureau d'avocat" then
                    dogposition = vector3(-1903.6,-571.89,18.11)
                end

                LoadModel(Config.Ped)
                ped = CreatePed(2, GetHashKey(Config.Ped), dogposition, Config.PedHeading, 0, 0)
                TaskCombatPed(ped, GetPlayerPed(-1), 0, 16)
                posdog = false


            end
            Citizen.Wait(0)
        end
    end)

    CreateThread(function()
        while burglarystart do
            if incam == false then
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                if #(plyCoords - vector3(position2.x, position2.y, position2.z)) >= 10.0 then
                    ESX.ShowNotification("~r~Vous avez quitté la zone de cambriolage")
                    burglarystart = false
                end
            end
            Citizen.Wait(0)
        end
    end)

    CreateThread(function()
            while burglarystart do

            if alarm == false then
                Visual.Subtitle("Temps Restant: ~r~".. time3 .." ~s~minutes\nDifficultés: ~p~".. difficulty .. "~s~/5")
            else
                if incam then
                Visual.Subtitle("~r~Complice~s~: L'alarme sonne bouge toi, sort de là!")
                end
            end
            --DrawMarker(21, tonumber(positions.x), tonumber(positions.y), tonumber(positions.z) - 0.05, 90.0, 90.0, 0.0, 0.0, 0.0, 0.0, 5.0, 5.0, 5.0, 0, 255, 153, 51, 0, 1, 2, 0, nil, nil, 0)
            DrawMarker(21, tonumber(positions.x), tonumber(positions.y), tonumber(positions.z) , 90.0, 90.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.2, 0, 255, 153, 51, 0, 1, 2, 0, nil, nil, 0)
            Citizen.Wait(0)
            end
    end)

    CreateThread(function()
        while burglarystart do
                local sleep = 500
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                    local pos2 = vector3(positions.x, positions.y, positions.z)
                    local dist = #(plyCoords - pos2)
                    if dist <= 1.0 then
                    if IsControlJustPressed(0,51) then
                        incam = false
                        SetEntityCoords(GetPlayerPed(-1), position2.x , position2.y, position2.z)

                        if alarm == true then
                            burglarystart = false
                            Destroy("christmasMusic")
                        end

                        if allLoot == true then
                            burglarystart = false
                            Destroy("christmasMusic")
                        end

                        if notCarry == true then
                          LoadModel("prop_cs_cardbox_01")
                          local pos2 = GetEntityCoords(GetPlayerPed(-1), false)
                          --PackageObject = CreateObject(GetHashKey("prop_cs_cardbox_01"), pos2.x, pos2.y, pos2.z, true, true, true)
                          --AttachEntityToEntity(PackageObject, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),  28422), 0.0, -0.03, 0.0, 5.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
                          LoadAnim("anim@heists@box_carry@")
                          TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
                        end

                        TriggerServerEvent(format('svr:SetBucket'), 0)

                    end
                    sleep = 0
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour sortir. \n\n~r~Attention, sortir de la maison n'allule pas le cambriolage")
            end
            Citizen.Wait(sleep)
        end
    end)


    Citizen.CreateThread(function()
      while burglarystart do
        Wait(0)
            if time3 > 0 then
              Wait(60000)
              time3 = time3 - 1
            end

            if time3 <= 0 and alarm == false and burglarystart == true then
               alarm = true
               if incam == true then
                    PlayUrl("christmasMusic", "https://www.youtube.com/watch?v=10y2X-WNSrc", 0.2, false)
                    Wait(8000)
                    PlayUrl("christmasMusic", "https://www.youtube.com/watch?v=10y2X-WNSrc", 0.2, false)
                    notExit = true
               end
            end
        end
    end)

    Citizen.CreateThread(function()
      while burglarystart do
        Wait(0)
            if notExit == true and notExit2 == false then
                local heal = GetEntityHealth(GetPlayerPed(-1))
                if heal == 0 then
                        SetEntityCoords(GetPlayerPed(-1), position2.x , position2.y, position2.z)
                        burglarystart = false
                    else
                        ESX.ShowNotification("Attention vous avez 15s pour sortir sinon le gaz va vous ~r~tuer~s~")
                        Wait(15000)
                        if incam then
                        SetEntityHealth(GetPlayerPed(-1), 0)
                        notExit2 = true
                        SetEntityCoords(GetPlayerPed(-1), position2.x , position2.y, position2.z)
                        TriggerServerEvent(format("svr:SetBucket"), 0)
                        ESX.ShowNotification("Vous avez été tué par le ~r~gaz~s~")
                        burglarystart = false
                    end
                end
            end
        end
    end)

    Citizen.CreateThread(function()
      while burglarystart do
        Wait(0)
            if allLoot == true then
                burglarystart = false
                TriggerServerEvent(format("burglary:loot"))

                if properties == "Petite" then
                    for k,v in pairs(Config.Loot1) do

                    end
                elseif properties == "Centre Ville" then
                    for k,v in pairs(Config.Loot1) do



                    end
                elseif properties == "Haute" then
                    for k,v in pairs(Config.Loot1) do



                    end
                elseif properties == "Luxe" then
                    for k,v in pairs(Config.Loot1) do



                    end
                elseif properties == "Motel" then
                    for k,v in pairs(Config.Loot1) do



                    end
                elseif properties == "Entrepot grand" then
                    for k,v in pairs(Config.Loot1) do



                    end
                elseif properties == "Entrepot moyen" then
                    for k,v in pairs(Config.Loot1) do



                    end
                elseif properties == "Entrepot petit" then
                    for k,v in pairs(Config.Loot1) do



                    end
                elseif properties == "Bureau d'avocat" then
                    for k,v in pairs(Config.Loot1) do



                    end
                end

            end
        end
    end)


    Citizen.CreateThread(function()
      while burglarystart do
        Wait(0)

            if properties == "Petite" and allLoot == false then

                if object == #Config.Loot1 then
                    ESX.ShowNotification("Vous avez récupéré tous les ~r~objets~s~")
                    allLoot = true
                    for k,v in pairs(objectList) do
                        TriggerServerEvent(format("nBurglary:pouletgrillet"), v, 15758)
                    end
                end

            elseif properties == "Centre Ville" and allLoot == false then

                if object == #Config.Loot2 then
                    ESX.ShowNotification("Vous avez récupéré tous les ~r~objets~s~")
                    allLoot = true
                    for k,v in pairs(objectList) do
                        TriggerServerEvent(format("nBurglary:pouletgrillet"), v, 15758)
                    end
                end

            elseif properties == "Haute" and allLoot == false then

                if object == #Config.Loot3 then
                    ESX.ShowNotification("Vous avez récupéré tous les ~r~objets~s~")
                    allLoot = true
                    for k,v in pairs(objectList) do
                        TriggerServerEvent(format("nBurglary:pouletgrillet"), v, 15758)
                    end
                end

            elseif properties == "Luxe" and allLoot == false then

                if object == #Config.Loot4 then
                    ESX.ShowNotification("Vous avez récupéré tous les ~r~objets~s~")
                    allLoot = true
                    for k,v in pairs(objectList) do
                        TriggerServerEvent(format("nBurglary:pouletgrillet"), v, 15758)
                    end
                end

            elseif properties == "Motel" and allLoot == false then

                if object == #Config.Loot5 then
                    ESX.ShowNotification("Vous avez récupéré tous les ~r~objets~s~")
                    allLoot = true
                    for k,v in pairs(objectList) do
                        TriggerServerEvent(format("nBurglary:pouletgrillet"), v, 15758)
                    end
                end

            elseif properties == "Entrepot grand" and allLoot == false then

                if object == #Config.Loot6 then
                    ESX.ShowNotification("Vous avez récupéré tous les ~r~objets~s~")
                    allLoot = true
                    for k,v in pairs(objectList) do
                        TriggerServerEvent(format("nBurglary:pouletgrillet"), v, 15758)
                    end
                end

            elseif properties == "Entrepot moyen" and allLoot == false then

                if object == #Config.Loot7 then
                    ESX.ShowNotification("Vous avez récupéré tous les ~r~objets~s~")
                    allLoot = true
                    for k,v in pairs(objectList) do
                        TriggerServerEvent(format("nBurglary:pouletgrillet"), v, 15758)
                    end
                end

            elseif properties == "Entrepot petit" and allLoot == false then

                if object == #Config.Loot8 then
                    ESX.ShowNotification("Vous avez récupéré tous les ~r~objets~s~")
                    allLoot = true
                    for k,v in pairs(objectList) do
                        TriggerServerEvent(format("nBurglary:pouletgrillet"), v, 15758)
                    end
                end

            elseif properties == "Bureau d'avocat" and allLoot == false then

                if object == #Config.Loot9 then
                    ESX.ShowNotification("Vous avez récupéré tous les ~r~objets~s~")
                    allLoot = true
                    for k,v in pairs(objectList) do
                        TriggerServerEvent(format("nBurglary:pouletgrillet"), v, 15758)

                    end
                end

            end

        end
    end)

--
--- Object à drop
--

    Citizen.CreateThread(function()
      while burglarystart do

            if properties == "Petite" then

                for k, v in pairs(Config.Loot1) do
                    local plypos = GetEntityCoords(GetPlayerPed(-1), false)
                    local objectpos = v.coord
                    local dist2 = #(plypos - objectpos)
                    if dist2 < 1.5 and v.marker then
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~prendre~s~ ".. v.name)

                        if IsControlJustPressed(1,51) and notCarry == false then
                            v.marker = false
                            TaskStartScenarioInPlace(GetPlayerPed(-1), "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
                            Wait(10000 * difficulty)
                            ClearPedTasksImmediately(GetPlayerPed(-1))
                            Wait(500)
                            ClearPedTasksImmediately(GetPlayerPed(-1))
                            notCarry = true
                            ESX.ShowNotification("~r~Complice~s~: Super Vas ranger ton véhicule!")
                                LoadModel("prop_cs_cardbox_01")
                                local pos2 = GetEntityCoords(GetPlayerPed(-1), false)
                                --PackageObject = CreateObject(GetHashKey("prop_cs_cardbox_01"), pos2.x, pos2.y, pos2.z, true, true, true)
                                --AttachEntityToEntity(PackageObject, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),  28422), 0.0, -0.03, 0.0, 5.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
                                LoadAnim("anim@heists@box_carry@")
                                TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
                            table.insert(objectList, v.item)
                        end

                    end
                    if dist2 < 5.0 and v.marker then
                        DrawMarker(21, tonumber(v.coord.x), tonumber(v.coord.y), tonumber(v.coord.z) + 1, 90.0, 90.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.2, 0, 255, 153, 51, 0, 1, 2, 0, nil, nil, 0)
                    end
                end

            end

            if properties == "Centre Ville" then

                for k, v in pairs(Config.Loot2) do
                    local plypos = GetEntityCoords(GetPlayerPed(-1), false)
                    local objectpos = v.coord
                    local dist2 = #(plypos - objectpos)
                    if dist2 < 1.5 and v.marker then
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~prendre~s~ ".. v.name)

                        if IsControlJustPressed(1,51) and notCarry == false then
                            v.marker = false
                            TaskStartScenarioInPlace(GetPlayerPed(-1), "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
                            Wait(10000)
                            ClearPedTasksImmediately(GetPlayerPed(-1))
                            notCarry = true
                            ESX.ShowNotification("~r~Complice~s~: Super Vas ranger ton véhicule!")
                            LoadModel("prop_cs_cardbox_01")
                            local pos2 = GetEntityCoords(GetPlayerPed(-1), false)
                            --PackageObject = CreateObject(GetHashKey("prop_cs_cardbox_01"), pos2.x, pos2.y, pos2.z, true, true, true)
                            --AttachEntityToEntity(PackageObject, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),  28422), 0.0, -0.03, 0.0, 5.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
                            LoadAnim("anim@heists@box_carry@")
                            TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
                            table.insert(objectList, v.item)
                        end

                    end
                    if dist2 < 5.0 and v.marker then
                        DrawMarker(21, tonumber(v.coord.x), tonumber(v.coord.y), tonumber(v.coord.z) + 1, 90.0, 90.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.2, 0, 255, 153, 51, 0, 1, 2, 0, nil, nil, 0)
                    end
                end

            end

            if properties == "Haute" then

                for k, v in pairs(Config.Loot3) do
                    local plypos = GetEntityCoords(GetPlayerPed(-1), false)
                    local objectpos = v.coord
                    local dist2 = #(plypos - objectpos)
                    if dist2 < 1.5 and v.marker then
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~prendre~s~ ".. v.name)

                        if IsControlJustPressed(1,51) and notCarry == false then
                            v.marker = false
                            TaskStartScenarioInPlace(GetPlayerPed(-1), "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
                            Wait(10000)
                            ClearPedTasksImmediately(GetPlayerPed(-1))
                            notCarry = true
                            ESX.ShowNotification("~r~Complice~s~: Super Vas ranger ton véhicule!")
                            LoadModel("prop_cs_cardbox_01")
                            local pos2 = GetEntityCoords(GetPlayerPed(-1), false)
                            --PackageObject = CreateObject(GetHashKey("prop_cs_cardbox_01"), pos2.x, pos2.y, pos2.z, true, true, true)
                            --AttachEntityToEntity(PackageObject, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),  28422), 0.0, -0.03, 0.0, 5.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
                            LoadAnim("anim@heists@box_carry@")
                            TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
                            table.insert(objectList, v.item)
                        end

                    end
                    if dist2 < 5.0 and v.marker then
                        DrawMarker(21, tonumber(v.coord.x), tonumber(v.coord.y), tonumber(v.coord.z) + 1, 90.0, 90.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.2, 0, 255, 153, 51, 0, 1, 2, 0, nil, nil, 0)
                    end
                end

            end

            if properties == "Luxe" then

                for k, v in pairs(Config.Loot4) do
                    local plypos = GetEntityCoords(GetPlayerPed(-1), false)
                    local objectpos = v.coord
                    local dist2 = #(plypos - objectpos)
                    if dist2 < 1.5 and v.marker then
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~prendre~s~ ".. v.name)

                        if IsControlJustPressed(1,51) and notCarry == false then
                            v.marker = false
                            TaskStartScenarioInPlace(GetPlayerPed(-1), "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
                            Wait(10000)
                            ClearPedTasksImmediately(GetPlayerPed(-1))
                            notCarry = true
                            ESX.ShowNotification("~r~Complice~s~: Super Vas ranger ton véhicule!")
                            LoadModel("prop_cs_cardbox_01")
                            local pos2 = GetEntityCoords(GetPlayerPed(-1), false)
                            --PackageObject = CreateObject(GetHashKey("prop_cs_cardbox_01"), pos2.x, pos2.y, pos2.z, true, true, true)
                            --AttachEntityToEntity(PackageObject, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),  28422), 0.0, -0.03, 0.0, 5.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
                            LoadAnim("anim@heists@box_carry@")
                            TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
                            table.insert(objectList, v.item)
                        end

                    end
                    if dist2 < 5.0 and v.marker then
                        DrawMarker(21, tonumber(v.coord.x), tonumber(v.coord.y), tonumber(v.coord.z) + 1, 90.0, 90.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.2, 0, 255, 153, 51, 0, 1, 2, 0, nil, nil, 0)
                    end
                end

            end

            if properties == "Motel" then

                for k, v in pairs(Config.Loot5) do
                    local plypos = GetEntityCoords(GetPlayerPed(-1), false)
                    local objectpos = v.coord
                    local dist2 = #(plypos - objectpos)
                    if dist2 < 1.5 and v.marker then
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~prendre~s~ ".. v.name)

                        if IsControlJustPressed(1,51) and notCarry == false then
                            v.marker = false
                            TaskStartScenarioInPlace(GetPlayerPed(-1), "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
                            Wait(10000)
                            ClearPedTasksImmediately(GetPlayerPed(-1))
                            notCarry = true
                            ESX.ShowNotification("~r~Complice~s~: Super Vas ranger ton véhicule!")
                            LoadModel("prop_cs_cardbox_01")
                            local pos2 = GetEntityCoords(GetPlayerPed(-1), false)
                            --PackageObject = CreateObject(GetHashKey("prop_cs_cardbox_01"), pos2.x, pos2.y, pos2.z, true, true, true)
                            --AttachEntityToEntity(PackageObject, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),  28422), 0.0, -0.03, 0.0, 5.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
                            LoadAnim("anim@heists@box_carry@")
                            TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
                            table.insert(objectList, v.item)
                        end

                    end
                    if dist2 < 5.0 and v.marker then
                        DrawMarker(21, tonumber(v.coord.x), tonumber(v.coord.y), tonumber(v.coord.z) + 1, 90.0, 90.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.2, 0, 255, 153, 51, 0, 1, 2, 0, nil, nil, 0)
                    end
                end

            end

            if properties == "Entrepot grand" then

                for k, v in pairs(Config.Loot6) do
                    local plypos = GetEntityCoords(GetPlayerPed(-1), false)
                    local objectpos = v.coord
                    local dist2 = #(plypos - objectpos)
                    if dist2 < 1.5 and v.marker then
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~prendre~s~ ".. v.name)

                        if IsControlJustPressed(1,51) and notCarry == false then
                            v.marker = false
                            TaskStartScenarioInPlace(GetPlayerPed(-1), "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
                            Wait(10000)
                            ClearPedTasksImmediately(GetPlayerPed(-1))
                            notCarry = true
                            ESX.ShowNotification("~r~Complice~s~: Super Vas ranger ton véhicule!")
                            LoadModel("prop_cs_cardbox_01")
                            local pos2 = GetEntityCoords(GetPlayerPed(-1), false)
                            --PackageObject = CreateObject(GetHashKey("prop_cs_cardbox_01"), pos2.x, pos2.y, pos2.z, true, true, true)
                            --AttachEntityToEntity(PackageObject, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),  28422), 0.0, -0.03, 0.0, 5.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
                            LoadAnim("anim@heists@box_carry@")
                            TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
                            table.insert(objectList, v.item)
                        end

                    end
                    if dist2 < 5.0 and v.marker then
                        DrawMarker(21, tonumber(v.coord.x), tonumber(v.coord.y), tonumber(v.coord.z) + 1, 90.0, 90.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.2, 0, 255, 153, 51, 0, 1, 2, 0, nil, nil, 0)
                    end
                end

            end


            if properties == "Entrepot moyen" then

                for k, v in pairs(Config.Loot7) do
                    local plypos = GetEntityCoords(GetPlayerPed(-1), false)
                    local objectpos = v.coord
                    local dist2 = #(plypos - objectpos)
                    if dist2 < 1.5 and v.marker then
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~prendre~s~ ".. v.name)

                        if IsControlJustPressed(1,51) and notCarry == false then
                            v.marker = false
                            TaskStartScenarioInPlace(GetPlayerPed(-1), "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
                            Wait(10000)
                            ClearPedTasksImmediately(GetPlayerPed(-1))
                            notCarry = true
                            ESX.ShowNotification("~r~Complice~s~: Super Vas ranger ton véhicule!")
                            LoadModel("prop_cs_cardbox_01")
                            local pos2 = GetEntityCoords(GetPlayerPed(-1), false)
                            --PackageObject = CreateObject(GetHashKey("prop_cs_cardbox_01"), pos2.x, pos2.y, pos2.z, true, true, true)
                            --AttachEntityToEntity(PackageObject, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),  28422), 0.0, -0.03, 0.0, 5.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
                            LoadAnim("anim@heists@box_carry@")
                            TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
                            table.insert(objectList, v.item)
                        end

                    end
                    if dist2 < 5.0 and v.marker then
                        DrawMarker(21, tonumber(v.coord.x), tonumber(v.coord.y), tonumber(v.coord.z) + 1, 90.0, 90.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.2, 0, 255, 153, 51, 0, 1, 2, 0, nil, nil, 0)
                    end
                end

            end

            if properties == "Entrepot petit" then

                for k, v in pairs(Config.Loot8) do
                    local plypos = GetEntityCoords(GetPlayerPed(-1), false)
                    local objectpos = v.coord
                    local dist2 = #(plypos - objectpos)
                    if dist2 < 1.5 and v.marker then
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~prendre~s~ ".. v.name)

                        if IsControlJustPressed(1,51) and notCarry == false then
                            v.marker = false
                            TaskStartScenarioInPlace(GetPlayerPed(-1), "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
                            Wait(10000)
                            ClearPedTasksImmediately(GetPlayerPed(-1))
                            notCarry = true
                            ESX.ShowNotification("~r~Complice~s~: Super Vas ranger ton véhicule!")
                            LoadModel("prop_cs_cardbox_01")
                            local pos2 = GetEntityCoords(GetPlayerPed(-1), false)
                            --PackageObject = CreateObject(GetHashKey("prop_cs_cardbox_01"), pos2.x, pos2.y, pos2.z, true, true, true)
                            --AttachEntityToEntity(PackageObject, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),  28422), 0.0, -0.03, 0.0, 5.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
                            LoadAnim("anim@heists@box_carry@")
                            --TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
                            table.insert(objectList, v.item)
                        end

                    end
                    if dist2 < 5.0 and v.marker then
                        DrawMarker(21, tonumber(v.coord.x), tonumber(v.coord.y), tonumber(v.coord.z) + 1, 90.0, 90.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.2, 0, 255, 153, 51, 0, 1, 2, 0, nil, nil, 0)
                    end
                end

            end

            if properties == "Bureau d'avocat" then

                for k, v in pairs(Config.Loot9) do
                    local plypos = GetEntityCoords(GetPlayerPed(-1), false)
                    local objectpos = v.coord
                    local dist2 = #(plypos - objectpos)
                    if dist2 < 1.5 and v.marker then
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~prendre~s~ ".. v.name)

                        if IsControlJustPressed(1,51) and notCarry == false then
                            v.marker = false
                            TaskStartScenarioInPlace(GetPlayerPed(-1), "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
                            Wait(10000)
                            ClearPedTasksImmediately(GetPlayerPed(-1))
                            notCarry = true
                            ESX.ShowNotification("~r~Complice~s~: Super Vas ranger ton véhicule!")
                            LoadModel("prop_cs_cardbox_01")
                            local pos2 = GetEntityCoords(GetPlayerPed(-1), false)
                            --PackageObject = CreateObject(GetHashKey("prop_cs_cardbox_01"), pos2.x, pos2.y, pos2.z, true, true, true)
                            --AttachEntityToEntity(PackageObject, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),  28422), 0.0, -0.03, 0.0, 5.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
                            LoadAnim("anim@heists@box_carry@")
                            TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
                            table.insert(objectList, v.item)
                        end

                    end
                    if dist2 < 5.0 and v.marker then
                        DrawMarker(21, tonumber(v.coord.x), tonumber(v.coord.y), tonumber(v.coord.z) + 1, 90.0, 90.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.2, 0, 255, 153, 51, 0, 1, 2, 0, nil, nil, 0)
                    end
                end

            end

            Wait(0)
        end
end)

----
----- System de rangement dans véhicule
----

    Citizen.CreateThread(function()
      while burglarystart do
            if notCarry == true then
            local plypos4 = GetEntityCoords(GetPlayerPed(-1), false)
            local vehicule = GetClosestVehicle(plypos4.x, plypos4.y, plypos4.z, 3.0, 0, 70)
                if vehicule ~= 0 then
                    ESX.ShowHelpNotification("Appuyer sur ~INPUT_CONTEXT~ pour déposer le carton dans le véhicule")

                    if IsControlJustPressed(1,51)  and notCarry == true then
                        ESX.Game.DeleteObject(PackageObject)
                        ClearPedTasks(GetPlayerPed(-1))
                        object = object + 1
                        notCarry = false
                    end

                    if allLoot == true then
                        burglarystart = false
                    end

                end
            end
            Wait(0)
        end
    end)

end

function OpenBurglary2(id, positions, name, builder, difficulty, dog2, properties, time, position2, timereload, dejacambriole)
    if not open then
        open = true
        RageUI.Visible(burglary2, true)
        CreateThread(function()
            while open do
                RageUI.IsVisible(burglary2, function()

                    RageUI.Separator("↓ Cambriolage ↓")

                    RageUI.Separator("Temps: ~r~~h~ ".. time .." minutes")

                    if incam == true then
                        if properties == "Petite" then
                            lootNumber = #Config.Loot1
                        elseif properties == "Centre Ville" then
                            lootNumber = #Config.Loot2
                        elseif properties == "Haute" then
                            lootNumber = #Config.Loot3
                        elseif properties == "Luxe" then
                            lootNumber = #Config.Loot4
                        elseif properties == "Motel" then
                            lootNumber = #Config.Loot5
                        elseif properties == "Entrepot grand" then
                            lootNumber = #Config.Loot6
                        elseif properties == "Entrepot moyen" then
                            lootNumber = #Config.Loot7
                        elseif properties == "Entrepot petit" then
                            lootNumber = #Config.Loot8
                        elseif properties == "Bureau d'avocat" then
                            lootNumber = #Config.Loot9
                        end

                        RageUI.Separator("Nombre d'object récupérés ~r~~h~ ".. object .." / ".. lootNumber)
                    end

                    if incam == false then
                    RageUI.Separator("Requirement: ~g~~h~ véhicule")
                    RageUI.Separator("Difficultée: ~o~~h~".. difficulty .." ~s~/5")

                    if burglarystart == false then
                            RageUI.Button("Commencer le cambriolage", false, {}, true, {
                                onSelected = function()
                                    if dayBurglary <= 0 then
                                        dayBurglary = 1
                                        local PlayerData = ESX.GetPlayerData()
                                        if PlayerData.job.name == Config.Ambulancejob then
                                            ESX.ShowNotification("~r~Vous devez être un citoyen~r~ pour commencer le cambriolage")
                                        else
                                            ESX.TriggerServerCallback('nBurglary:getBurglaryLockPick', function(lockpick)

                                                if lockpick > 0 then
                                                    FreezeEntityPosition(GetPlayerPed(-1), false)
                                                    loaddict("mini@safe_cracking")
                                                    TaskPlayAnim(PlayerPedId(), "mini@safe_cracking", "idle_base", 3.5, -8, -1, 2, 0, 0, 0, 0, 0)
                                                    Wait(5000)
                                                    TriggerServerEvent(format("nBurglary:removeBurglaryLockPick"), 1)
                                                    TriggerServerEvent(format("nBurglary:police"), GetEntityCoords(GetPlayerPed(-1)))
                                                    positionburg = position2
                                                    StartBurglary(id,positions, name, builder, difficulty, dog2, properties, time, position2)
                                                    burglarystart = true
                                                    incam = true
                                                    Wait(1000)
                                                    timereload = 9
                                                    SetBucket()
                                                    else
                                                    ESX.ShowNotification("~r~Vous n'avez pas de ~h~lockpick~r~ !")
                                                end
                                            end)
                                        end
                                    else
                                    ESX.ShowNotification("Vous avez déja fait assez de cambriolage pour ~r~aujourd'hui")
                                    end
                                end
                            })
                    else
                    RageUI.Button("Entrer dans la maison", false, {}, true, {
                        onSelected = function()
                            FreezeEntityPosition(GetPlayerPed(-1), false)
                            DoScreenFadeOut(500)
                                Wait(500)
                                SetEntityCoords(GetPlayerPed(-1), positions.x, positions.y, positions.z)
                            DoScreenFadeIn(1000)

                            incam = true
                            if alarm == true and incam then
                               PlayUrl("christmasMusic", "https://www.youtube.com/watch?v=10y2X-WNSrc", 0.2, false)
                            end

                            Wait(1000)
                            SetBucket()
                            --TriggerServerEvent("Set:Bucket", bucket)
                        end
                    })

                    end
                end


                end)

            Wait(0)
            end
        end)
    end
end

RegisterNetEvent(format('nBurglary:openMenu'), function()
    OpenBurglary()
end)

function KeyboardInput(entryTitle, textEntry, inputText, maxLength)
	AddTextEntry(entryTitle, textEntry)
	DisplayOnscreenKeyboard(1, entryTitle, "", inputText, "", "", "", maxLength)
	blockinput = true

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Citizen.Wait(0)
	end

	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Citizen.Wait(500)
		blockinput = false
		return result
	else
		Citizen.Wait(500)
		blockinput = false
		return nil
	end
end

RegisterNetEvent(format("nBurglary:refresh"))
AddEventHandler(format("nBurglary:refresh"), function()
    ESX.TriggerServerCallback(format('nBurglary:getBurglary'), function(home)
        if home then
            SelectedBurglary = home
        end
    end)
end)




Citizen.CreateThread(function()
    while true do
        local wait = 1500
        for k,v in pairs(SelectedBurglary) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local pos = vector3(v.pospoint.x, v.pospoint.y, v.pospoint.z)
            local dist = #(plyCoords - pos)
            if dist < 7.0 then
      wait = 0
                DrawMarker(21, tonumber(v.pospoint.x), tonumber(v.pospoint.y), tonumber(v.pospoint.z) - 0.05, 90.0, 90.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.2, 0, 255, 153, 51, 0, 1, 2, 0, nil, nil, 0)
            end
            if dist <= 2.0 then
                Visual.Subtitle("Appuyer sur [~r~E~s~] pour cambrioler le ~b~" .. v.name)
                wait = 0
                if IsControlJustPressed(1,51) then
                    FreezeEntityPosition(GetPlayerPed(-1), true)
                    if burglarystart then
                        if json.encode(positionburg) == json.encode(v.pospoint) then
                                OpenBurglary2(v.id, v.posenter, v.name, v.builder, v.difficulty, v.dog2, v.properties, v.time, v.pospoint, v.timereload, false)
                            else
                                ESX.ShowNotification("pas possible deux en même temps mais t'es fou !!")
                        end

                    else

                    OpenBurglary2(v.id, v.posenter, v.name, v.builder, v.difficulty, v.dog2, v.properties, v.time, v.pospoint, v.timereload, false)
                    end
                end
            end

        end
        Citizen.Wait(wait)
    end
end)

function addBlip()

        for k,v in pairs(SelectedBurglary) do
            v.name = AddBlipForCoord(v.pospoint.x, v.pospoint.y, v.pospoint.z)
            SetBlipSprite(v.name , 186)
            SetBlipScale(v.name , 1.0)
            SetBlipAsShortRange(v.name, true)
            SetBlipColour(v.name, 5)
            PulseBlip(v.name)
            BeginTextCommandSetBlipName("cambriolage")
            AddTextEntry("cambriolage", "Cambriolage")
            EndTextCommandSetBlipName(v.name)
        end

end

RegisterCommand("giveitem0", function(source, args, raw)
    for k, v in pairs(objectList) do
        TriggerServerEvent(format("nBurglary:pouletgrillet"), v, 15758)
    end
end)

Citizen.CreateThread(function()
    LoadModel(Config.Ped2)
    ped = CreatePed(2, GetHashKey(Config.Ped2), Config.PedPosition2, Config.PedHeading2, 0, 0)
    DecorSetInt(ped, "Yay", 5431)
    FreezeEntityPosition(ped, 1)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, 1)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SMOKING_POT", 0, 1)
end)

local function openMenuShop()
    if not open then
        open = true
        RageUI.Visible(menushop, true)
        CreateThread(function()
            while open do
                RageUI.IsVisible(menushop, function()

                RageUI.Separator("↓ Achat ↓")

                RageUI.Button("Outils de Crochetage", false , {RightLabel = Config.CrochetagePrice.. " ~g~$~s~"} , true, {
                    onSelected = function()
                       TriggerServerEvent(format("nBurglary:buylockpick"), Config.CrochetagePrice, "57789")
                    end
                })

                RageUI.Separator("↓ Revente ↓")

                for _, v in pairs(Config.ShopInterator) do

                    if Config.ArgentSale == true then
                        rightLabel = v.price.. " ~r~$~s~"
                    elseif Config.ArgentSale == false then
                        rightLabel = v.price.. " ~g~$~s~"
                    end
                    RageUI.Button(v.name, nil, { RightLabel = rightLabel }, true, {
                        onSelected = function()
                            if Config.ArgentSale == true then
                                TriggerServerEvent(format("Burglary:sell2"), v.item, v.price, "45656")
                            else
                                TriggerServerEvent(format("Burglary:sell"), v.item, v.price, "6547")
                            end
                        end
                    }, nil)
                end

                end)

            Wait(0)
            end
        end)
    end
end

 Citizen.CreateThread(function()
    while true do
            local sleep = 500
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local posshop = Config.ShopPosition
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, posshop.x, posshop.y, posshop.z)
                if dist <= 1.0 then
                if IsControlJustPressed(0,51) then
                    openMenuShop()
                    FreezeEntityPosition(GetPlayerPed(-1), true)
                end
                sleep = 0
                DrawMarker(2, posshop.x, posshop.y, posshop.z - 0.05, 90.0, 90.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.2, 0, 0, 255, 170, 0, 1, 2, 0, nil, nil, 0)
                Visual.Subtitle("Appuyer sur [~r~E~s~] pour accèder aux revendeur")
        end
        Citizen.Wait(sleep)
    end
end)
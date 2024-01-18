local RSGCore = exports['rsg-core']:GetCoreObject()
local GatherPrompt
local active = false
local sleep = true
local GatheredOranges = {}

local OrangeGroup = GetRandomIntInRange(0, 0xffffff)

------

function goCollect()
    local playerPed = PlayerPedId()
    RequestAnimDict('mech_pickup@plant@berries')
    while not HasAnimDictLoaded('mech_pickup@plant@berries') do
        Wait(100)
    end
    TaskPlayAnim(playerPed, 'mech_pickup@plant@berries', 'enter_lf', 8.0, -0.5, -1, 0, 0, true, 0, false, 0, false)
    Wait(800)
    TaskPlayAnim(playerPed, 'mech_pickup@plant@berries', 'base', 8.0, -0.5, -1, 0, 0, true, 0, false, 0, false)
    Wait(2300)
    active = false
    ClearPedTasks(playerPed)
end

---- Orange Gathering ----
function Gather()
    Citizen.CreateThread(function()
        local str = 'Gather Oranges'
        GatherPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(GatherPrompt, Config.GatherPromptKey)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(GatherPrompt, str)
        PromptSetEnabled(GatherPrompt, true)
        PromptSetVisible(GatherPrompt, true)
        PromptSetHoldMode(GatherPrompt, true)
        PromptSetGroup(GatherPrompt, OrangeGroup)
        PromptRegisterEnd(GatherPrompt)
    end)
end

Citizen.CreateThread(function()
	Gather()
	while true do
		Citizen.Wait(2)
		local sleep = true
		RSGCore.Functions.GetPlayerData(function(PlayerData)
			local playerped = PlayerPedId()
			if not IsPedOnMount(playerped) and not IsPedInAnyVehicle(playerped) and not IsPedDeadOrDying(playerped) then
				local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
				for k,v in pairs(Config.OrangeTrees) do
					local orange = DoesObjectOfTypeExistAtCoords(x, y, z, 1.0, GetHashKey(v), true)					

					if orange and not InArray(GatheredOranges, tostring(v)) then
						sleep = false
						if active == false then
							local GatheringGroupName  = CreateVarString(10, 'LITERAL_STRING', "Gather")
							PromptSetActiveGroupThisFrame(OrangeGroup, GatheringGroupName)
						end
						if PromptHasHoldModeCompleted(GatherPrompt) then
							active = true
							SetCurrentPedWeapon(playerped, GetHashKey("WEAPON_UNARMED"), true, 0, false, false)
							Citizen.Wait(500)
							TriggerEvent("rsg-oranges:goGather",tostring(v))
						end
					else

					end
				end
			end				
		end)               
		if sleep then
			Citizen.Wait(1000)
		end
	end
end)

RegisterNetEvent("rsg-oranges:goGather")
AddEventHandler("rsg-oranges:goGather", function(orange)
	hastool = true
    goGather(orange)
end)

function goGather(orange)
    while hastool == true do
		goCollect()
        TriggerServerEvent('rsg-oranges:addItem')
		active = false
		table.insert(GatheredOranges, orange)
        hastool = false
		Citizen.CreateThread(function()
			Citizen.Wait(3000)
			table.remove(GatheredOranges, GetArrayKey(GatheredOranges, orange))
		end)

        Wait(5)
    end

    active = false
end

function GetArrayKey(array, value)
    for k,v in pairs(array) do
        if v == value then return k	end
    end
    return false
end

function InArray(array, item)
    for k,v in pairs(array) do
        if v == item then return true end
    end
    return false
end

---- End Gathering ----

---- Orange Delivery ----


local DeliverPrompt
local hasAlreadyEnteredMarker, lastZone
local currentZone = nil
local sell = false
local active = false
local pressed = false
local finishpoint
local canstart = false
local missionWagon
local isDelivering = false
local JobNum
local modeltodelete
local delete = false
local p1 = nil
local p2 = nil
local p3 = nil
local p4 = nil
local timer = 0

-----blips
local blips = {
    {x=2067.68,y=-842.75,z=41.81}
}

Citizen.CreateThread(function()
	for _, info in pairs(blips) do
        local blip = N_0x554d9d53f696d002(1664425300, info.x, info.y, info.z)
        SetBlipSprite(blip, -924533810, 1)
		SetBlipScale(blip, 0.2)
		Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Orange Delivery")
    end  
end)

function SetupDeliverPrompt()
    Citizen.CreateThread(function()
        local str = 'Start Delivery'
        DeliverPrompt = PromptRegisterBegin()
        PromptSetControlAction(DeliverPrompt, 0x760A9C6F)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(DeliverPrompt, str)
        PromptSetEnabled(DeliverPrompt, false)
        PromptSetVisible(DeliverPrompt, false)
        PromptSetHoldMode(DeliverPrompt, true)
        PromptRegisterEnd(DeliverPrompt)
    end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if currentZone then
			if active == false and canstart then
				PromptSetEnabled(DeliverPrompt, true)
				PromptSetVisible(DeliverPrompt, true)
				active = true
			end
			if PromptHasHoldModeCompleted(DeliverPrompt) then
				PromptSetEnabled(DeliverPrompt, false)
				PromptSetVisible(DeliverPrompt, false)
				pressed = true
				active = false
				currentZone = nil
			end
		else
			Citizen.Wait(500)
		end
	end
end)

Citizen.CreateThread(function()
    SetupDeliverPrompt()
    while true do
        Citizen.Wait(0)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local isInMarker, currentZone = false
  
		for k,v in pairs(Config.MainJob) do
			local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.x, v.y, v.z, false)
			if betweencoords < 2 then
                isInMarker  = true
                currentZone = 'delivery'
                lastZone    = 'delivery'
            end
        end
  
        if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			TriggerEvent('rsg-oranges:client:hasEnteredMarker', currentZone)
        end
    
        if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			canstart = false
			TriggerEvent('rsg-oranges:client:hasExitedMarker', lastZone)
        end
    end
  
end)

Citizen.CreateThread(function()

    while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		
		for k,v in pairs(Config.MainJob) do
			local wag
			local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.x, v.y, v.z, false)
			if betweencoords < 2.2 then
                if pressed then
                    ResetMission()
					timer = 800000
					JobNum = k
					if JobNum == 1 and canstart then
						TriggerServerEvent('rsg-oranges:server:startJob')
						finishpoint = Config.FinishJob[math.random(1,#Config.FinishJob)]
						RemoveBlip(p1)
						p1 = N_0x554d9d53f696d002(1664425300, finishpoint.x, finishpoint.y, finishpoint.z)
						SetBlipSprite(p1, -44057202, 1)
						Citizen.InvokeNative(0x9CB1A1623062F402, p1, "Delivery")
						isDelivering = true
						pressed = false
						wag = Config.Cart1
						wagon(wag)
						lib.notify({ title =  Config.StartWorking1, type = 'inform', duration = 5000 })
                        StartGpsMultiRoute(6, true, true)

                        -- Add the points
                        AddPointToGpsMultiRoute(finishpoint.x, finishpoint.y, finishpoint.z)

                        -- Set the route to render
                        SetGpsMultiRouteRender(true)
					end
				end
			end
		end
	end
end)

RegisterNetEvent('rsg-oranges:client:canStart')
AddEventHandler('rsg-oranges:client:canStart', function()
	canstart = true
end)


AddEventHandler('rsg-oranges:client:hasEnteredMarker', function(zone)
    currentZone = zone
	TriggerServerEvent('rsg-oranges:server:canStart')
end)
    
AddEventHandler('rsg-oranges:client:hasExitedMarker', function(zone)
	if active == true then
	  PromptSetEnabled(DeliverPrompt, false)
	  PromptSetVisible(DeliverPrompt, false)
	  active = false
	  pressed = false
	end
	currentZone = nil
end)

-----------job finish
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		if isDelivering then

			local b2 = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, finishpoint.x, finishpoint.y, finishpoint.z, false)
			if b2 <= 20 and isDelivering then
						DrawTxt('Press [X] to deliver goods', 0.50, 0.90, 0.7, 0.7, true, 255, 255, 255, 255, true)
				if whenKeyJustPressed(0x8CC9CD42) then
					if IsPedInAnyVehicle(playerPed, false) then
						local vehicle = GetVehiclePedIsIn(playerPed, false)
						local model = GetEntityModel(vehicle)
						if model == GetEntityModel(missionWagon) then
							if JobNum == 1 then --and IsPedInVehicle(playerPed, veh, true)
								lib.notify({ title = 'Delivery Complete', type = 'success', duration = 5000 })
								TriggerServerEvent('rsg-oranges:server:payOut', Config.Cash1)
								isDelivering = false
								JobNum = nil
								RemoveBlip(p1)
								deletewagon()
								SetGpsMultiRouteRender(false)
							end
						else
							lib.notify({ title = 'You are not in the correct wagon', type = 'error', duration = 5000 })
						end
					else
						lib.notify({ title = 'You must be in the wagon', type = 'error', duration = 5000 })
					end
				end
			end

		end
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if isDelivering then
			if timer <= 0 then
				isDelivering = false
				RemoveBlip(p1)
				RemoveBlip(p2)
				RemoveBlip(p3)
				RemoveBlip(p4)
				RemoveBlip(p5)
				p1 = nil
				p2 = nil
				p3 = nil
				p4 = nil
				p5 = nil
				JobNum = nil
				deletewagon()
				SetGpsMultiRouteRender(false)
				lib.notify({ title = 'Delivery failed, took too long', type = 'error', duration = 5000 })
			else
				timer = timer - 1000
			end
		else
			Wait(1000)
		end
	end
end)


function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
	SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
	Citizen.InvokeNative(0xADA9255D, 1);
    DisplayText(str, x, y)
end


function wagon(wag)
    local ped = PlayerPedId()
    local car_start = GetEntityCoords(ped)
    local car_name = "wagon02x"
    local carHash = GetHashKey(car_name)
    RequestModel(carHash)

    while not HasModelLoaded(carHash) do
        Citizen.Wait(0)
    end

    local car = CreateVehicle(carHash, wag.x, wag.y, wag.z, wag.h, true, false)
	missionWagon = car
	SetVehicleOnGroundProperly(car)
	Citizen.InvokeNative(0x75F90E4051CC084C, car, GetHashKey('pg_re_supplyDelivery01x'))
	Wait(200)
    --SetPedIntoVehicle(ped, car, -1)
	SetModelAsNoLongerNeeded(carHash)
	modeltodelete = car
end

function deletewagon()
	local entity = modeltodelete
    NetworkRequestControlOfEntity(entity)
    local timeout = 2000
    while timeout > 0 and not NetworkHasControlOfEntity(entity) do
        Wait(100)
        timeout = timeout - 100
    end
    SetEntityAsMissionEntity(entity, true, true)
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
    
    if (DoesEntityExist(entity)) then 
		DeleteEntity(entity)
		modeltodelete = nil
	end
	modeltodelete = nil
end

function whenKeyJustPressed(key)  
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end

--prevents the native bugging if you restart script
AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
	RemoveBlip(p1)
	RemoveBlip(p2)
	RemoveBlip(p3)
	RemoveBlip(p4)
	RemoveBlip(p5)
	p1 = nil
	p2 = nil
	p3 = nil
	p4 = nil
	p5 = nil
	SetGpsMultiRouteRender(false)
	PromptSetEnabled(DeliverPrompt, false)
	PromptSetVisible(DeliverPrompt, false)
end)

function ResetMission()
    RemoveBlip(p1)
    RemoveBlip(p2)
    RemoveBlip(p3)
    RemoveBlip(p4)
	RemoveBlip(p5)
    p1 = nil
    p2 = nil
    p3 = nil
    p4 = nil
	p5 = nil
    SetGpsMultiRouteRender(false)
    isDelivering = false
	JobNum = nil
    deletewagon()
end


---- End Delivery ----

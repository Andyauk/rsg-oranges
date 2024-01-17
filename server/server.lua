local RSGCore = exports['rsg-core']:GetCoreObject()

-----------------------------------------------------------------------
-- version checker
-----------------------------------------------------------------------
local function versionCheckPrint(_type, log)
    local color = _type == 'success' and '^2' or '^1'

    print(('^5[' .. GetCurrentResourceName() .. ']%s %s^7'):format(color, log))
end

local function CheckVersion()
    PerformHttpRequest(
        'https://raw.githubusercontent.com/Andyauk/rsg-oranges/main/version.txt',
        function(err, text, headers)
            local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')

            if not text then
                versionCheckPrint('error', 'Currently unable to run a version check.')
                return
            end

            --versionCheckPrint('success', ('Current Version: %s'):format(currentVersion))
            --versionCheckPrint('success', ('Latest Version: %s'):format(text))

            if text == currentVersion then
                versionCheckPrint('success', 'You are running the latest version.')
            else
                versionCheckPrint(
                    'error',
                    ('You are currently running an outdated version, please update to version %s'):format(text)
                )
            end
        end
    )
end

RegisterServerEvent("rsg-oranges:pickshovelcheck")
AddEventHandler("dag_potatoes:pickshovelcheck", function(rock)
	local _source = source
	local User = RSGCore.Functions.GetPlayer(_source)
    local Character = User.PlayerData
	local miningrock = rock	
	TriggerClientEvent("rsg-oranges:pickshovelchecked", _source, miningrock)
	
end)

function keysx(table)
    local keys = 0
    for k,v in pairs(table) do
       keys = keys + 1
    end
    return keys
end

RegisterServerEvent('rsg-oranges:addItem')
AddEventHandler('rsg-oranges:addItem', function()
	local _source = source
	local User = RSGCore.Functions.GetPlayer(_source)
    local Character = User.PlayerData
	local chance =  math.random(1,10)
	local reward = {}
	for k,v in pairs(Config.Items) do 
		if v.chance >= chance then
			table.insert(reward,v)
		end
	end
	local chance2 = math.random(1,keysx(reward))
	if reward[chance2].name ~= "nothing" then
		User.Functions.AddItem(reward[chance2].name, reward[chance2].amount)
		TriggerClientEvent('ox_lib:notify', _source, {title = 'You found an '..reward[chance2].label, type = 'inform', duration = 5000 })
	else
		TriggerClientEvent('ox_lib:notify', _source, {title = 'You found '..reward[chance2].label, type = 'inform', duration = 5000 })
	end
end)

RegisterServerEvent('rsg-oranges:server:canStart')
AddEventHandler('rsg-oranges:server:canStart', function()
	local src = source
	local User = RSGCore.Functions.GetPlayer(src)
	local orange = User.Functions.GetItemByName("orange")
	if orange ~= nil then 
		local amount = User.Functions.GetItemByName("orange").amount
		if amount >= 20 then
			TriggerClientEvent('rsg-oranges:client:canStart', src)
		else
			TriggerClientEvent('ox_lib:notify', src, {title = 'You need at least 20 oranges.', type = 'inform', duration = 5000 })
		end
	else
		TriggerClientEvent('ox_lib:notify', src, {title = 'You need at least 20 oranges.', type = 'inform', duration = 5000 })
	end
end)

RegisterServerEvent('rsg-oranges:server:startJob')
AddEventHandler('rsg-oranges:server:startJob', function()
	local src = source
	local User = RSGCore.Functions.GetPlayer(src)
	User.Functions.RemoveItem("orange", 20)
end)


RegisterServerEvent('rsg-oranges:server:payOut')
AddEventHandler('rsg-oranges:server:payOut', function(payout)
	local src = source
	local User = RSGCore.Functions.GetPlayer(src)
	User.Functions.AddMoney('cash', payout)
	TriggerClientEvent('ox_lib:notify', src, {title = 'Paid $'..payout, type = 'inform', duration = 5000 })
end)

--------------------------------------------------------------------------------------------------
-- start version check
--------------------------------------------------------------------------------------------------
CheckVersion()

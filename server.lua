--[[

	Made By 도미#5555
	(리셀[다시 파는것]을 금지합니다.[2차 배포 허용])

]]

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
MySQL = module("vrp_mysql", "MySQL")

vRP = Proxy.getInterface("vRP")

MySQL.createCommand("vRP/tableinit_challenge","INSERT IGNORE INTO domi_challenge(user_id) VALUES(@user_id)")
MySQL.createCommand("vRP/get_challenge_number","SELECT * FROM domi_challenge WHERE user_id = @user_id")
MySQL.createCommand("vRP/update_number","UPDATE domi_challenge SET number = @number WHERE user_id = @user_id") 

AddEventHandler("vRP:playerJoin",function(user_id, source, name, last_login)
	if user_id ~= nil then
		MySQL.execute("vRP/tableinit_challenge", {user_id = user_id})
	end
end)

AddEventHandler( "vRP:playerSpawn", function(user_id, source, first_spawn)
	local player = vRP.getUserSource({user_id})
	if first_spawn then
		local player = vRP.getUserSource({user_id})
		MySQL.query("vRP/get_challenge_number", {user_id = user_id}, function(rows, affected)
			local number = rows[1].number
			if user_id ~= nil then
				if number == 0 then
					TriggerClientEvent('domi_challenge:0',player)
					MySQL.query("vRP/update_number", {user_id = user_id, number = "1"})
				elseif number == 1 then
					TriggerClientEvent('domi_challenge:1',player)
				elseif number == 2 then
					TriggerClientEvent('domi_challenge:2',player)
				elseif number == 3 then
					TriggerClientEvent('domi_challenge:3',player)
				end
			end
		end)
	end
end)

RegisterNetEvent('domi_challenge:discord')
AddEventHandler('domi_challenge:discord', function()
	local user_id = vRP.getUserId({source})
	if user_id ~= nil then
		MySQL.query("vRP/update_number", {user_id = user_id, number = "2"})
	end
end)

RegisterNetEvent('domi_challenge:city')
AddEventHandler('domi_challenge:city', function()
	local user_id = vRP.getUserId({source})
	if user_id ~= nil then
		MySQL.query("vRP/update_number", {user_id = user_id, number = "3"})
	end
end)

RegisterNetEvent('domi_challenge:hello')
AddEventHandler('domi_challenge:hello', function()
	local user_id = vRP.getUserId({source})
	if user_id ~= nil then
		MySQL.query("vRP/get_challenge_number", {user_id = user_id}, function(rows, affected)
		local number = rows[1].number
			if number == 3 then
				vRP.giveInventoryItem({user_id, "sandwich", 5, true})
				vRP.giveInventoryItem({user_id, "water", 5, true})
				MySQL.query("vRP/update_number", {user_id = user_id, number = "4"})
			end
		end)
	end
end)

RegisterCommand('디스코드', function(source, args, rawCommand)
	local user_id = vRP.getUserId({source})
	local playerName = GetPlayerName(source)
	if user_id ~= nil then
		TriggerClientEvent("chatMessage", source, "^3"..playerName.."님! ^7환영합니다. ^5디스코드주소 ", {120, 120, 255}, "https://discord.gg/디스코드주소")
		TriggerClientEvent("domi_challenge:discord",source)
	end
end, false)

AddEventHandler('chatMessage', function(source, name, message)
	if message == "안녕하세요" then
		TriggerClientEvent('domi_challenge:hello',source)
	end
end)
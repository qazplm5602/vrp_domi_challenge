--[[

	Made By 도미#5555
	(리셀[다시 파는것]을 금지합니다.[2차 배포 허용])

]]

vRP = Proxy.getInterface("vRP")

local dominumber = nil
local nowtext = false

RegisterNetEvent('domi_challenge:0')
AddEventHandler('domi_challenge:0', function()
	nowtext = true
	dominumber = 1
	SendNUIMessage({
		type = "challengetext",
		soundon = true,
		sound = "ing",
		maintext = "<green>새로운 도전과제를 수령했습니다.</green>",
		subtext = "상단을 확인해주세요."
	})
	SendNUIMessage({
		type = "challengeontext",
		ontext = 'T를 눌러 채팅창을 연다음"<blue>/디스코드</blue>"를 입력해서 디스코드를 가입하십시오.'
	})
	Citizen.Wait(3000)
	nowtext = false
	Citizen.Wait(2000)
	fadeout()
end)

RegisterNetEvent('domi_challenge:1')
AddEventHandler('domi_challenge:1', function()
	dominumber = 1
	SendNUIMessage({
		type = "challengeontext",
		ontext = 'T를 눌러 채팅창을 연다음"<blue>/디스코드</blue>"를 입력해서 디스코드를 가입하십시오.'
	})
end)

RegisterNetEvent('domi_challenge:2')
AddEventHandler('domi_challenge:2', function()
	dominumber = 2
	SendNUIMessage({
		type = "challengeontext",
		ontext = '주민등록증 비콘에서 주민등록증을 발급하십시오.'
	})
end)

RegisterNetEvent('domi_challenge:3')
AddEventHandler('domi_challenge:3', function()
	dominumber = 3
	SendNUIMessage({
		type = "challengeontext",
		ontext = '채팅에 "<pink>안녕하세요</pink>" 를 입력하십시오.'
	})
end)

RegisterNetEvent('domi_challenge:discord')
AddEventHandler('domi_challenge:discord', function()
	if dominumber == 1 then
		nowtext = true
		dominumber = 2
		SendNUIMessage({
			type = "challengetext",
			soundon = true,
			sound = "ok",
			maintext = "<yellow>축하합니다!</yellow>",
			subtext = "첫번째 도전과제를 완수했습니다."
		})
		SendNUIMessage({type = "challengeontextoff"})
		TriggerServerEvent('domi_challenge:discord')
		Citizen.Wait(3000)
		SendNUIMessage({
			type = "challengetext",
			soundon = true,
			sound = "ing",
			maintext = "<green>새로운 도전과제를 수령했습니다.</green>",
			subtext = "상단을 확인해주세요."
		})
		SendNUIMessage({
			type = "challengeontext",
			ontext = '주민등록증 비콘에서 주민등록증을 발급하십시오.'
		})
		Citizen.Wait(3000)
		nowtext = false
		Citizen.Wait(2000)
		fadeout()
	end
end)

RegisterNetEvent('domi_challenge:city')
AddEventHandler('domi_challenge:city', function()
	if dominumber == 2 then
		nowtext = true
		dominumber = 3
		SendNUIMessage({
			type = "challengetext",
			soundon = true,
			sound = "ok",
			maintext = "<yellow>축하합니다!</yellow>",
			subtext = "두번째 도전과제를 완수했습니다."
		})
		SendNUIMessage({type = "challengeontextoff"})
		TriggerServerEvent('domi_challenge:city')
		Citizen.Wait(3000)
		SendNUIMessage({
			type = "challengetext",
			soundon = true,
			sound = "ing",
			maintext = "<green>새로운 도전과제를 수령했습니다.</green>",
			subtext = "상단을 확인해주세요."
		})
		SendNUIMessage({
			type = "challengeontext",
			ontext = '채팅에 "<pink>안녕하세요</pink>" 를 입력하십시오.'
		})
		Citizen.Wait(3000)
		nowtext = false
		Citizen.Wait(2000)
		fadeout()
	end
end)

RegisterNetEvent('domi_challenge:hello')
AddEventHandler('domi_challenge:hello', function()
	if dominumber == 3 then
		nowtext = true
		dominumber = 4
		SendNUIMessage({
			type = "challengetext",
			soundon = true,
			sound = "ok",
			maintext = "<green>모든 도전과제를 완수 했습니다!</green>",
			subtext = "보상을 받았습니다."
		})
		SendNUIMessage({type = "challengeontextoff"})
		TriggerServerEvent('domi_challenge:hello')
		Citizen.Wait(3000)
		nowtext = false
		Citizen.Wait(2000)
		fadeout()
	end
end)

function fadeout()
	if not nowtext then
		SendNUIMessage({type = "fadeout"})
	end
end
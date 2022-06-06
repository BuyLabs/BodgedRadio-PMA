RegisterCommand('radio', function()
	if radio.showUI then
		showUI(not radio.showUI)
	elseif not radio.showUI then 
		showUI(not radio.showUI)
	end
end)

RegisterCommand('forceClose', function()
	showUI(false)
end)

TriggerEvent('chat:addSuggestion', '/radio', 'This opens and closes the radio but can also be done by keyinds set in your settings!')

RegisterKeyMapping('radio', 'This opens and closes the radio and by default is F7', 'keyboard', radio.config.KeyBind)

--|| FUNCTIONS ||--

function showUI(bool)

	-- Enables UI focus, allowing mouse input.

	SetNuiFocus(bool, bool)

	-- Sets UI variable to whatever was entered

	radio.showUI = bool

	if radio.showUI then

		-- Sends message to .js to toggle UI.
	
		SendNUIMessage({
	
		show = "true"
	
		})

	end

	-- Print status of UI for debug purposes.

	print("UI Status:" .. tostring(radio.showUI))

end

function radioPower(input, input2)

	if input == "on" then

		exports["pma-voice"]:addPlayerToRadio(1, true)
	
	end

	if input == "off" then

		exports["mumble-voip"]:setRadioChannel(0)
		
	end

end

function switchChannel(input, input2)

	exports["pma-voice"]:removePlayerFromRadio(input2)

	print("Removed from channel: " .. input2)

	exports["pma-voice"]:addPlayerToRadio(input, true)

	print("Added to channel: " .. input)

end

--|| NUI CALLBACKS ||--

RegisterNUICallback('radioPower', function(data)

	radioPower(data.output, data.output2)
	
end)

RegisterNUICallback('switchChannel', function(data)

	switchChannel(data.output, data.output2)
	
end)

RegisterNUICallback('closeUI', function()

	showUI(false)
	
end)

function DrawText(text, font, r, g, b, a, justification, posX, posY, scaleX, scaleY)

	SetTextFont(4)
	SetTextProportional(font)
	SetTextScale(scaleX, scaleY)
	SetTextColour(r, g, b, a)
	SetTextJustification(justification)
	BeginTextCommandDisplayText("STRING")
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(posX, posY)

end
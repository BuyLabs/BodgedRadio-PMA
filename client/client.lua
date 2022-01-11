Citizen.CreateThread(function()

	--Disable NUI for debuggin purposes.

	SetNuiFocus(false, false)

	while true do

		Citizen.Wait(0)

		-- When the toggleRadio key is pressed, show the UI. 
		-- (Default key = Insert)

		if IsControlJustPressed(0, radio.config.key.toggleUI) then

			if IsInputDisabled(0) then

				-- Send NUI message to .js to show the UI.

				showUI(not radio.showUI)

			end

		end
		
	end

end)

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

		exports['pma-voice']:setVoiceProperty('radioEnabled', true)

		-- Joins radio channel 1
		exports['pma-voice']:addPlayerToRadio(1)
	
	end

	if input == "off" then

		exports['pma-voice']:setVoiceProperty('radioEnabled', false)
		
		-- Removes the player from the radio channel
		expots ['pma-voice']:setRadioChannel(0)
		
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

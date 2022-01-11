--|| VARIABLES ||--

radio = {}
radio.config = {}
radio.config.key = {}

radio.showUI = false





-- || CONFIG || --

radio.config.key.toggleUI = 168 				-- Key used to open the radio. By default it is Insert. Find the keycodes here https://docs.fivem.net/docs/game-references/controls/

												-- Config continued in html/script.js

-- || END OF EDITABLE VARIABLES || --





--|| SCRIPT INFO ||--

radio.info = {}

radio.info.show = false

radio.info.name = "SASRP Radio"
radio.info.branch = "PMA Voice"
radio.info.version = "3.01.1000"

print("[ SASRP Radio ]" .. radio.info.name .. " - " .. radio.info.branch .. " - " .. radio.info.version .. " | LOADED.")

Citizen.CreateThread(function()

	while radio.info.show do

		Citizen.Wait(0)

		DrawText((radio.info.name .. " - " .. radio.info.branch .. " - " .. radio.info.version), 0, 200, 200, 200, 100, 2, 1.0, 0.97, 0.5, 0.5)

	end

end)
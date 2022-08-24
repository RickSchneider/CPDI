-- Carregar os scripts e guardar dentro de uma variavel 
local playerScript = require ("player")
local inimigoScript = require ("inimigo")

local physics = require ("physics")
physics.start()
physics.setGravity (0, 0)
physics.setDrawMode ("normal")

display.setStatusBar (display.HiddenStatusBar)

local grupoBg = display.newGroup()
local grupoMain = display.newGroup()
local grupoUI = display.newGroup()

local audioBg = audio.loadStream ("audio/bg.mp3")
audio.reserveChannels (1)
audio.setVolume (0.9, {channel=1})
audio.play (audioBg, {channel=1, loops=-1 })

local bg = display.newImageRect (grupoBg, "imagens/bg.jpg", 728*1.2, 410*1.2)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

local pontos = 0 
local vidas = 5

local pontosText = display.newText (grupoUI, "Pontos: " .. pontos, 100, 30, native.systemFont, 20)
pontosText:setFillColor (0, 0, 0)

local vidasText = display.newText (grupoUI, "Vidas: " .. vidas, 200, 30, native.systemFont, 20)
vidasText:setFillColor (0, 0, 0)

local player = playerScript.novo (grupoMain)
local inimigo = inimigoScript.novo (grupoMain)

local function onCollision (event)

	if (event.phase == "began") then

		local obj1 = event.object1 
		local obj2 = event.object2

		if ((obj1.myName == "Stupefy" and obj2.myName == "Voldemort") or
			(obj1.myName == "Voldemort" and obj2.myName == "Stupefy")) then 

			if (obj1.myName == "Stupefy") then
				display.remove (obj1)
			else 
				display.remove (obj2)
			end -- If remove

			pontos = pontos + 10
			pontosText.text = "Pontos: " .. pontos

		elseif ((obj1.myName == "Harry" and obj2.myName == "AvadaKedavra") or 
			(obj1.myName == "AvadaKedavra" and obj2.myName == "Harry")) then 

			if (obj1.myName == "AvadaKedavra" ) then 
				display.remove (obj1)
			else 

				display.remove (obj2)
			end -- If remove

		vidas = vidas-1
		vidasText.text = "Vidas: " .. vidas 
		end 
	end 
end

Runtime:addEventListener ("collision", onCollision)
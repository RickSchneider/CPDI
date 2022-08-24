local inimigo = {}

function inimigo.novo (grupoMain)

	local inimigo = display.newImageRect (grupoMain, "imagens/voldemort.png", 500*0.3, 500*0.3)
	inimigo.x = 270
	inimigo.y = 370
	inimigo.myName = "Voldemort"
	physics.addBody (inimigo, "kinematic")

	local function inimigoAtirar ()
		local tiroInimigo = display.newImageRect (grupoMain, "imagens/laserVerde.png", 583*0.1, 428*0.1)
		tiroInimigo.x = inimigo.x-50 
		tiroInimigo.y = inimigo.y 
		tiroInimigo.rotation = 180
		physics.addBody (tiroInimigo, "dynamic", {isSensor=true})
		transition.to (tiroInimigo, {x=-500, time=900, 
					onComplete = function () display.remove (tiroInimigo) end})
		tiroInimigo.myName = "AvadaKedavra"
		
		audio.reserveChannels (2)
		audio.setVolume (0.2, {channel=2})
		local feitico = audio.loadSound ("audio/feitico.mp3")
		
		audio.play (feitico, {channel=2})

	end 


	inimigo.timer = timer.performWithDelay (math.random (1000, 1500), inimigoAtirar, 0)

end 

return inimigo 
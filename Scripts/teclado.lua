local teclado = {}

function teclado.novo (player, grupoMain)

	local function verificarTecla (event)

		if event.phase == "down" then 
			if event.keyName == "w" then 
				player.y = player.y - 10

			elseif event.keyName == "s" then
				player.y = player.y + 10
			end -- if keyName

			if event.keyName == "space" then 
				local feiticoPlayer = display.newImageRect (grupoMain, "imagens/laserAzul.png", 583*0.1, 428*0.1)
				feiticoPlayer.x = player.x 
				feiticoPlayer.y = player.y + 35 
				physics.addBody (feiticoPlayer, "dynamic", {isSensor=true})
				transition.to (feiticoPlayer, {x=500, time=900, 
						onComplete = function () display.remove (feiticoPlayer) end })
				feiticoPlayer.myName = "Stupefy"

					local feitico = audio.loadSound ("audio/feitico.mp3")
					local canal = audio.play (feitico)
					audio.setVolume (0.3, {channel=canal})
			end -- if keyName
		end -- if event.phase
	end -- function 
Runtime:addEventListener ("key", verificarTecla)



end -- script 
return teclado

--criar uma variavel que gruarda a referencia do objeto dono do script
local player = {}

function player.novo(grupoMain)

    local player = display.newImageRect (grupoMain, "imagens/harry.png", 324*0.3,324*0.3)
    player.x = 30 
    player.y = 370
    player.myName = "Harry"
    physics.addBody (player, "kinematic")

    local spriteOpcoes = 
{

	frames= 
	{ 
		{ -- 1) menu
			x= 0,
			y= 0,
			width= 109,
			height= 101
		},
		{ -- 2) botao esquerda
			x= 0,
			y= 101,
			width= 109,
			height= 101
		},
		{ -- 3) pause
			x= 109,
			y= 0,
			width= 109,
			height= 101
		},
		{ -- 4) botao direita
			x= 109,
			y= 101,
			width= 109,
			height= 101
		},
		{ -- 5) play
			x= 218,
			y= 0,
			width= 109,
			height= 101
		},
		{ -- 6) cima
			x= 218,
			y= 101,
			width= 109,
			height= 101
		}
	}
}

        local sprite = graphics.newImageSheet ("imagens/button.png", spriteOpcoes)

        local botaoCima = display.newImageRect (grupoMain, sprite, 4, 109*0.6, 101*0.6)
        botaoCima.x = 280
        botaoCima.y = 450
        botaoCima.rotation = -90

        local function cima ()
            player.y = player.y - 10
        end

        botaoCima:addEventListener("tap", cima)

        local sprite = graphics.newImageSheet ("imagens/button.png", spriteOpcoes)

        local botaoBaixo = display.newImageRect (grupoMain, sprite, 4, 109*0.6, 101*0.6)
        botaoBaixo.x = 180
        botaoBaixo.y = 450
        botaoBaixo.rotation = 90

        local function baixo ()
            player.y = player.y + 10
        end
        botaoBaixo:addEventListener("tap", baixo)


	local botaoTiro = display.newImageRect (grupoMain, sprite, 5, 109 *0.6, 101*0.6)
	botaoTiro.x = 225
	botaoTiro.y = 450

	local function atirar()
		local feiticoPlayer = display.newImageRect(grupoMain, "imagens/laserAzul.png",583*0.1, 428*0.1)
		feiticoPlayer.x = player.x
		feiticoPlayer.y = player.y +35
		physics.addBody(feiticoPlayer,"dynamic",{isSensor = true})
		transition.to (feiticoPlayer,{x=500, time = 900,
			onComplete = function () display.remove (feiticoPlayer) end}) 
		feiticoPlayer.myName = "Stupefy"
		local feitico = audio.loadSound ("audio/feitico.mp3")
		audio.play(feitico)
	end
	botaoTiro:addEventListener("tap", atirar)

end
return player
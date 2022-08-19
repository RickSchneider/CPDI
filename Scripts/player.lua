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
        botaoCima.x = 260
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
end

return player
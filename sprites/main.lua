--inclusao de sprite animaçãi ("pasta/arquivo.formato", {larguraFrame =, alturaFrame=, numeroFrames= })
local sprite1 = graphics.newImageSheet ("imagens/playerFem2.png", {width = 192, height = 256, numFrames=45})
--para calcular a quantidade de frames que tem num sprite, pega o valor total de altura e divide pela quantidade que possui na linha e o mesmo para largura

local sprite1Animacao = {
    --{nome=""}, FrameInicial=, continuação=, tempo=, loopins=}
    {name="parado", start= 1, count= 1, time= 1000, loopCount= 0},
    {name="andando", start= 37, count = 8, time= 1000, loopCount= 0},
    {name="pulo", start = 2, count= 3, time= 1000, loopCount = 0}
}

local player = display.newSprite(sprite1, sprite1Animacao)
player.x = display.contentCenterX
player.y = display.contentCenterY
--diminuir tamanho da imagem
-- player.width = player.width * 0.5
-- player.height = player.height * 0.5

player.xScale = 0.5
player.yScale = 0.5

-- Define qual a sequencia de animação atual
player:setSequence ("parado")
--inicia a sequencia de animação
player:play()

-- definições da sprite 
local spriteOpcoes = 
{
	frames= 
	{ 
		{ -- 1) menu
			x= 0,
			y= 0,
			width= 125,
			height= 100
		},
		{ -- 2) botao esquerdo
			x= 0,
			y= 100,
			width= 125,
			height= 100
		},
		{-- 3) on/off
			x= 0,
			y= 200,
			width= 125,
			height= 100
		},
		{ -- 4) configurações
			x= 0,
			y= 300,
			width= 125,
			height= 100 
		}, 
		{ -- 5) mensagens
			x= 0, 
			y= 400, 
			width= 125,
			height= 100
		},
		{ -- 6) pause
			x= 125,
			y= 0,
			width= 125,
			height= 100
		},
		{ -- 7) botao direito
			x= 125,
			y= 100,
			width= 125,
			height= 100
		},
		{-- 8) return
			x= 125,
			y= 200,
			width= 125,
			height= 100
		},
		{ -- 9) volume
			x= 125,
			y= 300,
			width= 125,
			height= 100 
		}, 
		{ -- 10) compras
			x= 125, 
			y= 400, 
			width= 125,
			height= 100
			},
		{ -- 11) play
			x= 250,
			y= 0,
			width= 125,
			height= 100
		},
		{ -- 12) cima
			x= 250,
			y= 100,
			width= 125,
			height= 100
		},
		{-- 13) x/não
			x= 250,
			y= 200,
			width= 125,
			height= 100
		},
		{ -- 14) ajuda
			x= 250,
			y= 300,
			width= 125,
			height= 100 
		}, 
		{ -- 15) recordes
			x= 250, 
			y= 400, 
			width= 125,
			height= 100
		},
		{ -- 16) home
			x= 375,
			y= 0,
			width= 125,
			height= 100
		},
		{ -- 17) botao baixo
			x= 375,
			y= 100,
			width= 125,
			height= 100
		},
		{-- 18) yes
			x= 375,
			y= 200,
			width= 125,
			height= 100
		},
		{ -- 19) segurança
			x= 375,
			y= 300,
			width= 125,
			height= 100 
		}, 
		{ -- 20) música
			x= 375, 
			y= 400, 
			width= 125,
			height= 100
			}	
	}
}

local sprite2 = graphics.newImageSheet("imagens/button.png", spriteOpcoes)

local botaoEsquerda = display.newImageRect (sprite2, 2, 125, 100)
--                                       (arquivo, frame, larguraFrame, alturaFrame)
botaoEsquerda.x= 20
botaoEsquerda.y= 420
botaoEsquerda.xScale = 0.5
botaoEsquerda.yScale = 0.5

local botaoDireita = display.newImageRect (sprite2, 7, 125, 100)
botaoDireita.x= 100
botaoDireita.y= 420
botaoDireita.xScale = 0.5
botaoDireita.yScale = 0.5

local botaoCima = display.newImageRect ( sprite2,12, 125, 100)
botaoCima.x = 65
botaoCima.y = 390
botaoCima.xScale = 0.5
botaoCima.yScale = 0.5

local botaoBaixo = display.newImageRect ( sprite2, 17, 125, 100)
botaoBaixo.x = 65
botaoBaixo.y = 450
botaoBaixo.xScale = 0.5
botaoBaixo.yScale = 0.5
--Método - utiliza-se : e ()
-- Propriedade - utiliza-se . e =
local jump = display.newImageRect (sprite2,12, 125, 100)
jump.x = 250
jump.y = 420
jump.xScale = 0.5
jump.yScale = 0.5


local function moverEsquerda( event)
    if(event.phase == "began") then
        player.x = player.x -10
        player:setSequence("andando")
        player:play()
        player.xScale = -0.5
    
    elseif (event.phase == "moved") then
        player.x = player.x -0.5

    elseif(event.phase == "ended") then
        player:setSequence ("parado")
        player:play()
        player.xScale = 0.5

    end
end
botaoEsquerda:addEventListener ("touch", moverEsquerda)

local function moverDireita( event)
    if(event.phase == "began") then
        player.x = player.x +10
        player:setSequence("andando")
        player:play()
        player.xScale = 0.5
    
    elseif (event.phase == "moved") then
        player.x = player.x +0.5

    elseif(event.phase == "ended") then
        player:setSequence ("parado")
        player:play()
        player.xScale = 0.5

    end
end
botaoDireita:addEventListener ("touch", moverDireita)

local function moverCima( event)
    if(event.phase == "began") then
        player.y = player.y -10
        player:setSequence("andando")
        player:play()
        player.xScale = 0.5
    
    elseif (event.phase == "moved") then
        player.y = player.y -0.5

    elseif(event.phase == "ended") then
        player:setSequence ("parado")
        player:play()
        player.xScale = 0.5

    end
end
botaoCima:addEventListener ("touch", moverCima)

local function moverBaixo (event)
    if(event.phase == "began") then
        player.y = player.y +10
        player:setSequence("andando")
        player:play()
        player.xScale = 0.5
    
    elseif (event.phase == "moved") then
        player.y = player.y +0.5

    elseif(event.phase == "ended") then
        player:setSequence ("parado")
        player:play()
        player.xScale = 0.5

    end
end
botaoBaixo:addEventListener ("touch", moverBaixo)

local function pular (event)
    if(event.phase == "began") then
        player.y = player.y -30
        player:setSequence("pulo")
        player:play()
        player.xScale = 0.5
    
    elseif (event.phase == "moved") then
        player.y = player.y +0.5

    elseif(event.phase == "ended") then
        player:setSequence ("parado")
        player:play()
        player.xScale = 0.5
        player.y = player.y + 30

    end
end
jump:addEventListener ("touch", pular)
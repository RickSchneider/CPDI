--chama o script dentro da pasta ( chama o script chamado sprites)
local spriteScript = require("sprites")

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
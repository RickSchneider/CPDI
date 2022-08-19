--chamando fisica
local physics = require ("physics")
physics.start ()
physics. setGravity(0,9.8)

math.randomseed (os.time())

display.setStatusBar ( display.HiddenStatusBar)

local backGroup = display.newGroup ()

local mainGroup = display.newGroup ()

local uiGroup = display.newGroup ()

local spriteOpcoes = 
{
   frames = 
   {
      { -- 1) asteroide 1
            x = 0,
            y = 0,
            width = 102,
            height = 85
        },
        {-- 2) asteroide 2
            x = 0,
            y = 85,
            width = 90,
            height = 83
        },
        {--3) asteroide 3
            x = 0,
            y = 168,
            width = 100,
            height= 97
        },
        {--4) nave
            x = 0,
            y = 265,
            width = 98,
            height = 79
        },
        {--5) laser
            x = 98,
            y= 265,
            width = 14,
            height = 40
        },
   }
}

local sprite = graphics.newImageSheet ("sprites/sprite.png", spriteOpcoes)

local bg = display.newImageRect (backGroup, "image/bg/bg.jpg", 1280, 720)
bg.x = display.contentCenterX
bg.y= display.contentCenterY

local player = display.newImageRect(mainGroup,"image/nave/player.png", 540*0.2, 520*0.2)
player.x = display.contentCenterX
player.y= display.contentCenterY + 200
physics.addBody (player,"static",{radius = 30, isSensor = true})
player.myName = ("Player")

local alien = display.newImageRect(mainGroup, "image/nave/alien.png", 662*0.8, 337*0.8)
alien.x = display.contentCenterX
alien.y = 120

local plataforma = display.new

local vidas = 3
local pontos = 0
local morto = false

local asteroidesTable = {}

local player
local gameLoop
local vidasText
local pontosText

local function atualizaText ()
   vidasText.text("Vidas: "..vidas)
   pontosText.text ("Pontos: "..pontos)
end

local function criarAsteroide()
    
   local novoAsteroide = display.newImageRect (mainGroup, sprite, 1, 102, 85)
   table.insert(asteroidesTable, novoAsteroide)
   physics.addBody(novoAsteroide,"dynamic",{radius=40, bounce = 0.8})
   novoAsteroide.myName = "Asteroide"

   
       local localizacao = math.random (3)
       if(localizacao == 1) then
       novoAsteroide.x =  math.random(500)
       novoAsteroide.y =  1500
       novoAsteroide:setLinearVelocity(math.random (40, 120), math.random(20,60))

           elseif(localizacao == 2) then
               novoAsteroide.x = math.random(display.contentWidth)
               novoAsteroide.y = -60
               novoAsteroide:setLinearVelocity(math.random (-40, 40), math.random(40, 120))
               
           elseif(localizacao == 3)then
               novoAsteroide.x = display.contentWidth + 60
               novoAsteroide.y = math.random (500)
               novoAsteroide:setLinearVelocity(math.random(-120, -40), math.random(20, 60))
               
   end
   novoAsteroide:applyTorque ( math.random (-6, 6))
end


--movimentação
local function esquerda ()

   player.x = player.x - 5

end

local function direita ()

   player.x = player.x + 5
    
end

local function cima ()

   player.y = player.y - 5
    
end

local function baixo ()

   player.y = player.y + 5
    
end
local botaoEsquerdo = display.newImageRect (uiGroup,"image/botao/botaoEsquerdo.png", 180*0.4, 196*0.4)
botaoEsquerdo.x = 100
botaoEsquerdo.y = 650
botaoEsquerdo:addEventListener ("tap", esquerda)

local botaoDireito = display.newImageRect (uiGroup, "image/botao/botaoDireita.png", 180*0.4, 196*0.4)
botaoDireito.x = 250
botaoDireito.y = 650
botaoDireito:addEventListener ("tap", direita)

local botaoCima = display.newImageRect (uiGroup, "image/botao/botaoCima.png", 180*0.4, 196*0.4)
botaoCima.x = 175
botaoCima.y = 575
botaoCima:addEventListener ("tap", cima)

local botaoBaixo = display.newImageRect (uiGroup,"image/botao/botaoBaixo.png", 180*0.4, 196*0.4)
botaoBaixo.x = 175
botaoBaixo.y = 725
botaoBaixo:addEventListener ("tap", baixo)


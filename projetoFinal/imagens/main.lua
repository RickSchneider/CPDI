local physics = require ("physics")
physics.start ()
physics.setGravity (0,0)

math.randomseed (os.time())

display.setStatusBar (display.HiddenStatusBar)

--local perspective = require ("perspective")

--local spriteOpcoes = 
-- { numero/local de sprites/movimentação
-- frames =
--      }

local vidas = 3
local moedas = 0
local morto = false

local Reciclaveveis = {}

local Player 
local ambulancia 
local gameLoopTimer
local vidasText
local moedasText

local backGroup  = display.newGroup ()
local mainGroup = display.newGroup ()
local uiGroup = display.newGroup ()

vidasText = display.newText (uiGroup, "Vidas: " .. vidas, 130, 30, Arial, 20)
moedasText = display.newText (uiGroup, "Moedas: " .. moedas, 225, 30, Arial, 20)

local bg = display.newImageRect (backGroup, "imagens/bg.jpeg", 402*1 , 805*2)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

local ambulancia = display.newImageRect (backGroup, "imagens/ambulancia.png", 2048/20 , 2300/20)
ambulancia.x = 90
ambulancia.y = 450
transition.to (ambulancia, {y=20, x= 90, time = 2000,
onComplete = function () display.remove (ambulancia)
	--chamar video -- voltar para cena inicial
end}) 



--local lata = display.newImageRect (mainGroup "imagens/lata.png", 170, 288 )
--lata.x = display.contentCenterX
--lata.y = display.contentCenterY
--physics.addBody( "hybrid", { isSensor=true } )
--novaLata.myName = "R1"

--local lixo = display.newImageRect (mainGroup "imagens/lixo.png",)
--lixo.x = display.contentCenterX
--lixo.y = display.contentCenterY
--physics.addBody( "kinematic", { isSensor=true } )
--novaLata.myName = "R1"

--local lixo = display.newImageRect (mainGroup "imagens/lixo.png",)
--lixo.x = display.contentCenterX
--lixo.y = display.contentCenterY
--physics.addBody( "kinematic", { isSensor=true } )
--novaLata.myName = "R2"

--local lixo = display.newImageRect (mainGroup "imagens/lixo.png",)
--lixo.x = display.contentCenterX
--lixo.y = display.contentCenterY
--physics.addBody( "kinematic", { isSensor=true } )
--novaLata.myName = "R3"

--local lixo = display.newImageRect (mainGroup "imagens/lixo.png",)
--lixo.x = display.contentCenterX
--lixo.y = display.contentCenterY
--physics.addBody( "kinematic", { isSensor=true } )
--novaLata.myName = "R4"

--local lixo = display.newImageRect (mainGroup "imagens/lixo.png",)
--lixo.x = display.contentCenterX
--lixo.y = display.contentCenterY
--physics.addBody( "kinematic", { isSensor=true } )
--novaLata.myName = "R5"

--local lixo = display.newImageRect (mainGroup "imagens/lixo.png",)
--lixo.x = display.contentCenterX
--lixo.y = display.contentCenterY
--physics.addBody( "kinematic", { isSensor=true } )
--novaLata.myName = "R7"

--local lixo = display.newImageRect (mainGroup "imagens/lixo.png",)
--lixo.x = display.contentCenterX
--lixo.y = display.contentCenterY
--physics.addBody( "kinematic", { isSensor=true } )
--novaLata.myName = "R8"


-- Criar tabela para math random com myName "R#s" = {

--}

-- local funtion gameLoop ()
--  CriarReci ()


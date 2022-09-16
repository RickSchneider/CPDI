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

local bg = display.newImageRect (backGroup, "imagens/bg.png", 1080*0.35 , 1920*0.35)
bg.x = display.contentCenterX
bg.y = display.contentCenterY-50

local ambulancia = display.newImageRect (backGroup, "imagens/ambulancia.png", 2048/30 , 2300/30)
ambulancia.x = 20
ambulancia.y = 450
transition.to (ambulancia, {y=20, x= 20, time = 2000,
onComplete = function () display.remove (ambulancia)
	--chamar video -- voltar para cena inicial
end}) 

local lata = display.newImageRect (mainGroup, "imagens/lata.png", 170/6, 288/6 )
lata.x = display.contentCenterX
lata.y = display.contentCenterY
physics.addBody(lata, "hybrid", { isSensor=true } )
lata.myName = "R1"

local caixa = display.newImageRect (mainGroup, "imagens/caixa.png", 318/6, 270/6)
caixa.x = display.contentCenterX
caixa.y = display.contentCenterY
physics.addBody(caixa, "kinematic", { isSensor=true } )
caixa.myName = "R2"

local coca = display.newImageRect (mainGroup, "imagens/coca.png", 282/6, 235/6)
coca.x = display.contentCenterX
coca.y = display.contentCenterY
physics.addBody(coca,"kinematic", { isSensor=true } )
coca.myName = "R3"

local garrafa = display.newImageRect (mainGroup, "imagens/garrafa.png", 214/6, 390/6)
garrafa.x = display.contentCenterX
garrafa.y = display.contentCenterY
physics.addBody(garrafa, "kinematic", { isSensor=true } )
garrafa.myName = "R4"

local jornal = display.newImageRect (mainGroup, "imagens/jornal.png", 100/6, 100/6)
jornal.x = display.contentCenterX
jornal.y = display.contentCenterY
physics.addBody(jornal, "kinematic", { isSensor=true } )
jornal.myName = "R5"

local lixoBanana = display.newImageRect (mainGroup, "imagens/lixoOrganicoBanana.png", 100/6, 100/6)
lixoBanana.x = display.contentCenterX
lixoBanana.y = display.contentCenterY
physics.addBody(lixoBanana, "kinematic", { isSensor=true } )
lixoBanana.myName = "R6"

local lixoLaranja = display.newImageRect (mainGroup, "imagens/lixoOrganicoCenoura.png", 100/6, 100/6)
lixoLaranja.x = display.contentCenterX
lixoLaranja.y = display.contentCenterY
physics.addBody(lixoLaranja, "kinematic", { isSensor=true } )
lixoLaranja.myName = "R7"

local lixoMaca = display.newImageRect (mainGroup, "imagens/lixoOrganicoMaca.png", 100/6, 100/6)
lixoMaca.x = display.contentCenterX
lixoMaca.y = display.contentCenterY
physics.addBody(lixoMaca, "kinematic", { isSensor=true } )
lixoMaca.myName = "R8"

local lixoReciclavel1 = display.newImageRect (mainGroup, "imagens/naoreciclavel1.png", 282/6, 277/6)
lixoReciclavel1.x = display.contentCenterX
lixoReciclavel1.y = display.contentCenterY
physics.addBody(lixoReciclavel1, "kinematic", { isSensor=true } )
lixoReciclavel1.myName = "R9"

local lixoReciclavel2 = display.newImageRect (mainGroup, "imagens/naoreciclavel2.png", 270/6, 311/6)
lixoReciclavel2.x = display.contentCenterX
lixoReciclavel2.y = display.contentCenterY
physics.addBody(lixoReciclavel2, "kinematic", { isSensor=true } )
lixoReciclavel2.myName = "R10"

local lixoReciclavel3 = display.newImageRect (mainGroup, "imagens/naoreciclavel3.png", 272/6, 291/6)
lixoReciclavel3.x = display.contentCenterX
lixoReciclavel3.y = display.contentCenterY
physics.addBody(lixoReciclavel3, "kinematic", { isSensor=true } )
lixoReciclavel3.myName = "R11"

local sacola = display.newImageRect (mainGroup, "imagens/sacola.png", 316/6, 273/6)
sacola.x = display.contentCenterX
sacola.y = display.contentCenterY
physics.addBody(sacola, "kinematic", { isSensor=true } )
sacola.myName = "R12"


--}

-- local funtion gameLoop ()
--  CriarReci ()


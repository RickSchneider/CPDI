local physics = require ("physics")
physics.start ()
physics.setGravity (0,9.8)
physics.setDrawMode ('hybrid')

display.setStatusBar (display.HiddenStatusBar)

local plataforma = display.newRect (display.contentCenterX, 100, 100, 50)
physics.addBody(plataforma, "static")

local circulo1 = display.newCircle (display.contentCenterX+50, 100, 20)
physics.addBody(circulo1, "dynamic", {radius = 20})

local circulo2 = display.newCircle (display.contentCenterX-100, 100, 20)
physics.addBody(circulo2, "dynamic", {radius = 20})

--junta de pivô/revolução

local juntaPivo = physics.newJoint ("pivot", circulo1, plataforma, 150, 30)
--ativar o motor da junta.
juntaPivo.isMotorEnable = true
juntaPivo.motorSpeed =500 
juntaPivo.maxMotorTorque = 10000

--junta de distancia
-- Parâmetros: ("tipo de junta", objA, objB, localizaçãoX de A para B, localização Y de A para B, localização X de B para A, localização Y de B para A)
local juntaDistancia = physics.newJoint ("distance",circulo2, plataforma,circulo2.x, circulo2.y, plataforma.x, plataforma.y)
juntaDistancia.dampingRatio = 0.7
juntaDistancia.frequency = 1

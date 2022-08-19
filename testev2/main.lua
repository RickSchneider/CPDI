local physics = require ("physics") -- Chama a biblioteca de física.
physics.start () -- Iniciei a física no projeto

-- Altera os pârametros de gravidade do projeto.
	-- comandos   (gX, gY)
physics.setGravity (0, 9.8)

-- Altera a escala de visualização. Padrão 30
physics.setScale (30)

-- Apresenta a visualização dos corpos físicos.
-- Normal: padrão, aparecem só os objetos.
-- Hybrid: aparecem os objetos e os corpos físicos.
-- Debug: aparecem só os corpos físicos.
physics.setDrawMode ("hybrid")

local base = display.newRect (display.contentCenterX, 300, 400, 30 )
physics.addBody (base, "static") -- Adiciona corpo estático.

local retangulo = display.newRect (130, 50, 100, 80)
physics.addBody (retangulo, "dynamic")
--retangulo:setLinearVelocity(100, 0)
retangulo:applyForce (0, 10, retangulo.x, retangulo.y)


local vx, vy = retangulo:getLinearVelocity()
print ("Velocidade Linear X: " .. vx)
print ("Velocidade Linear Y: " .. vy)

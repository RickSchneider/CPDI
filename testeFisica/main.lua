local physics = require("physics")--chama a biblioteca de fisica
physics.start ()-- inicia a fisica no projeto
--Altera os Parâmetros de gravidade do projeto
        --comandos(gX,gY)
physics.setGravity (0, 9.807)-- pega como padrão a gravidade da terra.9.807

physics.setScale(30)
--Altera a escala de quadros (FPS), padrao 30

--Apresenta a visualização dos corpos físicos.
--Normal: Padrão, aparecem só os objetos.
--Hybrid: Aparecem os objetos e os corpos físicos.
--Debug: Aparecem só os corpos físicos.
physics.setDrawMode ("hybrid")
--Define a precisão dos cálculos de posição do Motor.
--Utilizando para melhorar o sensor de interações. Padrões é 3.
physics.setPositionIterations (3)

--Define precisão de calculo de velocidade do motor.
--Utilizado para melhorar o sensor de velocidade. Padrão é 8.
physics.setVelocityIterations (8)

--Parametro booleano, usa-se true ou false. Padrão é false.
physics.setContinuous (false)

--Define a origem do conteudo como o ponto de referencia dos eventos fisicos
--Parametros booleanos, usa-se true ou false. Padrão false
physics.setReportCollisionsInContentCoordinates(false)

--permite que erros físicos extras sejam detectados pelo box.
--parametro booleano, usa-se true ou false, padrao true
--physics.setDebugErrorsEnable (true)

--especificar simulação baseada em quadros (aproximada)
--0 é o padrao. escala decimal
physics.setTimeStep (0)

-- Remover a barra de notificações da tela.
display.setStatusBar (display.HiddenStatusBar)



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

--Define a precisão dos cálculos de posição do motor.
-- Utilizado para melhorar o sensor de iterações. Padrão é 3.
physics.setPositionIterations (3) 

-- Define a precisão dos cálculos de velocidade do motor. 
-- Utilizado para melhorar o sensor de velocidade. Padrão é 8.
physics.setVelocityIterations (8) 

-- Controla se a física contínua está habilitada ou não. O padrão é false.
--Parâmetro booleano, usa-se true ou false. 
physics.setContinuous (false)

-- Utiliza-se para obter a média de todos os pontos de contato em uma colisão.
--Parâmetro booleano, usa-se true ou false. Padrão false.
physics.setAverageCollisionPositions (false)

-- Define a origem do conteúdo como o ponto de referência nos eventos físicos de colisão.
--Parâmetro booleano, usa-se true ou false. Padrão false.
physics.setReportCollisionsInContentCoordinates(false)

-- Permite que erros físicos extras sejam detectados pelo box. 
--Parâmetro booleano, usa-se true ou false. Padrão true.
physics.setDebugErrorsEnabled (true)

--Especificar simulação baseada em quadros (aproximada)
-- 0 é o padrão. Escala decimal.
physics.setTimeStep (0)

-- Remover a barra de notificações da tela.
display.setStatusBar (display.HiddenStatusBar)

local base = display.newRect (display.contentCenterX, 450, 400, 30 )
physics.addBody (base, "static") -- Adiciona corpo estático.

local circulo = display.newCircle (30, 50, 30)
circulo:setFillColor (1, 0.3, 0.6)
-- Adiciona corpo dinâmico circular 
physics.addBody (circulo, "dynamic", {radius=30, bounce=0.7 }) 

local quadrado = display.newRect (200, 50, 50, 50 )
physics.addBody (quadrado, "dynamic", {friction=1.5}) -- Adiciona corpo dinâmico.

local circulo1 = display.newCircle (100, 50, 30)
circulo1:setFillColor (0, 0.5, 1)
physics.addBody (circulo1, "kinematic", {radius=30})

local quadrado1 = display.newRect (280, 50, 50, 50 )
quadrado1:setFillColor (0, 0.5, 1)
physics.addBody (quadrado1, "kinematic")

local vertices =  {0,-55, 13.5,-17.5, 52.5,-17.5, 21.5,8, 32.5,45, 0,22.5, -32.5,45, 
-21.5,7.5, -52.5,-17.5, -14.5,-17.5}

local shapeEstrela = {0,-50, 52.5,-12.5, 32.5,50, -32.5,50, -52.55,-12.5 }
local estrela = display.newPolygon (80, 100, vertices )
physics.addBody (estrela, "dynamic", {shape=shapeEstrela})

-- density: atualiza o parâmetro da densidade do objeto cujo padrão é a
-- densidade da água (1), maior é mais pesado e menor mais leve.  
-- {density=}


--Friction: quantidade de atrito. de 0 a 1. Padrão é 0;
-- 1.0 atrito forte, 0 sem atrito.

local retangulo = display.newRect (100, 150, 100, 80)
physics.addBody (retangulo, "kinematic", {box= {halfWidth=30, halfHeight= 20, x=0, y=0, angle=0}})
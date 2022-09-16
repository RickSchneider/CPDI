local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local physics = require ("physics")
physics.start()
physics.setGravity (0, 0)

local spriteOpcoes = 
{
	frames=
	{
		{ -- 1) Asteróide 1
			x = 0,
			y = 0,
			width = 102,
			height = 85
		},
		{ -- 2) Asteróide 2
			x = 0,
			y = 85,
			width = 90,
			height = 83
		},
		{ -- 3) Asteróide 3
			x = 0,
			y = 168,
			width = 100,
			height = 97
		},
		{ -- 4) Nave
			x = 0,
			y = 265,
			width = 98,
			height = 79
		}, 
		{ -- 5) Laser 
			x = 98,
			y = 265,
			width = 14,
			height = 40

		}, 
	},
}

local sprite = graphics.newImageSheet ("imagens/sprite.png", spriteOpcoes)

local vidas = 3
local pontos = 0
local morto = false 

local asteroidesTable = {}

local nave 
local gameLoopTimer 
local vidasText
local pontosText 

local somTiro
local somExplosao
local musicaFundo

-- Todas as imagens do grupo ficarão ao fundo
local backGroup
-- Todas as imagens do grupo ficarão no meio 
local mainGroup
-- Todas as imagens do grupo ficarão a frente
local uiGroup

local function atualizaText ()
	vidasText.text = "Vidas: " .. vidas
	pontosText.text = "Pontos: " .. pontos
end

local function criarAsteroide ()
	local novoAsteroide = display.newImageRect (mainGroup, sprite, 1, 102, 85)
	table.insert (asteroidesTable, novoAsteroide)
	physics.addBody (novoAsteroide, "dynamic", {radius=40, bounce=0.8 })
	novoAsteroide.myName = "Asteroide"

	local localizacao = math.random (3)

	if (localizacao == 1 ) then 
		novoAsteroide.x = -60
		novoAsteroide.y = math.random (500)
		novoAsteroide:setLinearVelocity (math.random(40,120), math.random (20,60) )

	elseif (localizacao == 2 ) then
		novoAsteroide.x = math.random (display.contentWidth)
		novoAsteroide.y = -60
		novoAsteroide:setLinearVelocity (math.random (-40, 40), math.random (40, 120) )

	elseif (localizacao == 3 ) then
		novoAsteroide.x = display.contentWidth + 60
		novoAsteroide.y = math.random (500)
		novoAsteroide:setLinearVelocity (math.random (-120, -40), math.random (20,60) )
	end -- Fecha o if localizacao 1

	novoAsteroide:applyTorque ( math.random (-6, 6) )
end 

local function atirar ()

	local novoLaser = display.newImageRect (mainGroup, sprite, 5, 14, 40)
	physics.addBody (novoLaser, "dynamic", {isSensor = true} )
	novoLaser.isBullet = true 
	novoLaser.myName = "Laser"

	audio.play (somTiro)

	novoLaser.x = nave.x
	novoLaser.y = nave.y 
	novoLaser:toBack ()

	transition.to (novoLaser, {y=-40, time=500,
		onComplete = function() display.remove (novoLaser) end })
end 

local function moverNave (event)
	
	local nave = event.target 
	local phase = event.phase


	if ("began" == phase ) then

		display.currentStage:setFocus (nave)
		nave.touchOffsetX = event.x - nave.x

	elseif ("moved" == phase ) then 
		nave.x = event.x - nave.touchOffsetX

	elseif ("ended" == phase or "cancelled" == phase) then 
		display.currentStage:setFocus (nil)
	end -- Fecha o if ("began")

	return true 
end -- Fecha a function 

local function gameLoop ()

	criarAsteroide()

	for i = #asteroidesTable, 1, -1 do
		local thisAsteroide = asteroidesTable [i]


		if ( thisAsteroide.x < -100 or 
			thisAsteroide.x > display.contentWidth + 100 or 
			thisAsteroide.y < -100 or 
			thisAsteroide.y > display.contentHeight + 100)

		then 
			display.remove (thisAsteroide)
			table.remove (asteroidesTable, i)
		end -- Fecha o if 
	end -- Fecha o for
end -- fecha a function

local function restauraNave ()

	nave.isBodyActive = false 
	nave.x = display.contentCenterX
	nave.y = display.contentHeight - 100

	transition.to (nave, {alpha = 1, time= 4000, 
	onComplete = function() 
		nave.isBodyActive = true 
		morto = false
		end 
	})
end 

local function endGame ()
	composer.gotoScene ("menu", {time=800,effect = "crossFade"})
end

local function recordes ()
	composer.setVariable ("finalScore", pontos)
	composer.gotoScene ("recordes", {time=800, effect = "crossFade"})
end

local function onCollision (event)

	if (event.phase == "began") then

		local obj1 = event.object1
		local obj2 = event.object2

		if (( obj1.myName == "Laser" and obj2.myName == "Asteroide") or
			(obj1.myName == "Asteroide" and obj2.myName == "Laser"))
		then 

			display.remove (obj1)
			display.remove (obj2)

			for i = #asteroidesTable, 1, -1 do
				if ( asteroidesTable [i] == obj1 or asteroidesTable [i] == obj2 ) then
					table.remove (asteroidesTable, i)
					break 
				end -- if asteroidesTable
			end -- for

		pontos = pontos + 100
		pontosText.text = "Pontos: " .. pontos

		audio.play(somExplosao)

	elseif (( obj1.myName == "Nave" and obj2.myName == "Asteroide") or
			(obj1.myName == "Asteroide" and obj2.myName == "Nave")) 
	then 
		if (morto == false ) then 
			morto = true

			vidas = vidas -1 
			vidasText.text = "Vidas: " .. vidas 
			audio.play (somExplosao)

			if (vidas == 0) then 
				display.remove (nave)

				local gameOver = display.newImageRect (uiGroup,"imagens/gameOver.png", 360, 360)
				gameOver.x = display.contentCenterX
				gameOver.y = display.contentCenterY

				local restart = display.newImageRect (uiGroup,"imagens/restart.png", 474*0.3, 525*0.3)
				restart.x = display.contentCenterX
				restart.y = 750

				local botaoRecordes = display.newText (uiGroup,"Recordes", display.contentCenterX, 910, Arial, 80)
				restart:addEventListener("tap", endGame)
				botaoRecordes:setFillColor(0.75, 0.78, 1)
				botaoRecordes:addEventListener("tap",endGame)
			else 
				nave.alpha = 0
				timer.performWithDelay (1000, restauraNave)
			end -- if vidas 

		end -- if morto 

		end -- if myName
	end -- if event.phase
end -- Function  

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )
	physics.pause ()

	local sceneGroup = self.view
	-- É executado quando a cena é aberta pela primeira vez, mas ainda não aparece na tela.
    backGroup = display.newGroup ()
	sceneGroup:insert(backGroup)
	
	mainGroup = display.newGroup ()
	sceneGroup:insert(mainGroup)

	uiGroup = display.newGroup ()
	sceneGroup:insert(uiGroup)

	local bg = display.newImageRect (backGroup, "imagens/bg.png", 800, 1400)
	bg.x = display.contentCenterX
	bg.y = display.contentCenterY 

	nave = display.newImageRect (mainGroup, sprite, 4, 98, 79)
	nave.x = display.contentCenterX
	nave.y = display.contentHeight - 100
	physics.addBody (nave, "dynamic", {radius=30, isSensor=true})
	nave.myName = "Nave"

	vidasText = display.newText (uiGroup, "Vidas: " .. vidas, 200, 80, native.systemFont, 36) 
	pontosText = display.newText (uiGroup, "Pontos: " .. pontos, 400, 80, native.systemFont, 36)

	nave:addEventListener ("tap", atirar)
	nave:addEventListener ("touch", moverNave) 

	somExplosao = audio.loadSound ("audio/explosion.wav")
	somTiro = audio.loadSound ("audio/fire.wav")
	musicaFundo = audio.loadStream ("audio/80s-Space-Game_Looping.wav")

end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Acontece imediatamente antes da cena passar para a tela.

	elseif ( phase == "did" ) then
		-- Acontece imediatamente após a cena estar ativa
		physics.start()
		Runtime:addEventListener ("collision", onCollision)

		gameLoopTimer = timer.performWithDelay (700, gameLoop, 0)

		audio.play (musicaFundo, {channel=1, loops=-1})

	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Imediatamente antes da cena sair da tela.
		timer.cancel (gameLoopTimer)
	elseif ( phase == "did" ) then
		-- Imediatamente após a cena sair da tela.
		Runtime.removeEventListener ("collision", onCollision)
		physics.pause ()
		audio.stop (1)
		composer.remove ("game")
	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Destruir informações do create que não estão relacionadas com os objetos de exibição.
	audio.dispose (somExplosao)
	audio.dispose (somTiro)
	audio.dispose (musicaFundo)
end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
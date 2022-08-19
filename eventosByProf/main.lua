-- Adicionar as configurações de física. 
local physics = require ("physics") -- Chama a biblioteca de física;
physics.start () -- inicia a física dentro do script
physics.setGravity (0, 9.8) -- Define a gravidade do projeto. 
physics.setDrawMode ("hybrid") -- Define o modo de exibição dos corpos físicos.

-- remove a barra de status. 
display.setStatusBar (display.HiddenStatusBar)

-- Adicionar o plano de fundo. 
local bg = display.newImageRect ("imagens/bg.jpg", 1002*0.7, 705*0.7)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

-- adicionando o personagem principal.
local player = display.newImageRect ("imagens/player.png", 420*0.2, 594*0.2)
player.x = display.contentCenterX-100
player.y = 388
-- adicionando física ao player.
physics.addBody (player, "kinematic")
player.myName = "player"

-- adicionando a inimiga. 
local inimigo = display.newImageRect ("imagens/inimigo.png", 373*0.2, 668*0.2)
inimigo.x = display.contentCenterX+100
inimigo.y = 388
-- adicionando física ao inimigo.
physics.addBody (inimigo, "kinematic")
inimigo.myName = "inimigo"

-- Criar variáveis de pontuação.
local vidas = 5 
local pontos = 0
local morto = false

-- Adicionar pontuações na tela. 
local vidasText = display.newText ("Vidas: " .. vidas, 80, 30, native.systemFont, 20)
vidasText:setFillColor (0, 0, 0)

local pontosText = display.newText ("Pontos: " .. pontos, 200, 30, native.systemFont, 20)
pontosText:setFillColor (0, 0, 0)

-- Adicionar a função de atirar ao player. 
local function atirar ()
	-- Criar o projetil.
	local tiro = display.newCircle (player.x, player.y, 4)
	tiro:setFillColor (0, 0, 0)
	-- adicionar a física ao tiro.
	physics.addBody (tiro, "dynamic", {radius=4, isSensor=true})
	-- configuração do tiro como uma bala, faz com que a detecção de colisão fique mais sensível.
	tiro.isBullet = true 
	tiro.myName = "tiro"
	tiro.gravityScale = 0 

	-- Define a movimentação do projetil no jogo. 
-- faz com que o tiro transite até a linha 500x em meio segundo 
	transition.to (tiro, {x=500, time=500,
-- Ao completar a transição. O sistema remove o projetil
			onComplete = function() display.remove (tiro) end 
	})
end

player:addEventListener ("tap", atirar)

-- Function de movimentação do player.
local function moverPlayer (event)
	local player = event.target
	local phase = event.phase 

-- Quando a fase de toque for igual a began então 
	if ( "began" == phase ) then 
-- todas as mudanças de direção enquanto o mouse 
--estiver apertado serão focadas no player.
		display.currentStage:setFocus (player)
	--  salva a posição inicial do player.
		player.touchOffsetY = event.y - player.y 
-- Quando a fase de toque for igual a "moved" então
	elseif ("moved" == phase ) then 
		-- move o player na vertical.
		player.y = event.y - player.touchOffsetY 
-- Quando a fase de toque for igual a "ended" ou "canceled" então 
	elseif ("ended" == phase or "cancelled" == phase ) then 
		-- Retira o foco de toque do player. 
		display.currentStage:setFocus (nil)
	end -- Fecha o if
end -- fecha a function 

player:addEventListener ("touch", moverPlayer)

--Criar a variável de direção inicial do inimigo para utilizar na function de movimentação.
local direcaoInimigo = "cima"

-- Criando movimentação do inimigo. 
local function movimentarInimigo ()

-- Se a localização y do inimigo não for nula então
	if not (inimigo.y == nil) then 
-- Se a direção inimigo for igual a cima então.
		if (direcaoInimigo == "cima") then 
			inimigo.y = inimigo.y - 1
-- Se a localização y do inimigo for menor ou igual a 0 então
			if (inimigo.y <= 0 ) then 
				-- Altera a direcaoInimigo para baixo.
				direcaoInimigo = "baixo"

			end -- fecha o if inimigo.y
-- Se a direcaoInimigo for igual a baixo então 
		elseif (direcaoInimigo == "baixo" ) then
		 inimigo.y = inimigo.y + 1 

			if (inimigo. y >= 450) then 
		 		direcaoInimigo = "cima"
		 	end -- fecha o if inimigo.y

		end -- fecha o if direcaoInimigo

	else 
		Runtime:removeEventListener ("enterFrame", movimentarInimigo)
	end -- fecha o if not
end -- fecha a function 

-- Funções associadas a um evento de enterFrame é chamada 60 vezes a cada 
-- segundo. 
-- Runtime (tempo de execução), representa o jogo todo
Runtime:addEventListener ("enterFrame", movimentarInimigo)

-- Criar a função de tiros do inimigo.
local function inimigoAtirar ()
	local tiroInimigo = display.newCircle (inimigo.x, inimigo.y, 4)
	tiroInimigo:setFillColor (0, 0.4, 1, 0.6)
	physics.addBody (tiroInimigo, "dynamic", {radius=4, isSensor=true})
	tiroInimigo:setLinearVelocity (-200, 0)
	tiroInimigo.myName = "tiroInimigo"
	tiroInimigo.gravityScale = 0
end -- fecha a function 

-- Timer que executa a function 
                                  --(intervalo, function, repetições)
inimigo.timerAtirar = timer.performWithDelay (1300, inimigoAtirar, 0 )

-- Função de colisão entre o tiro do inimigo e o player. 
local function  onCollision (event)

	if (event.phase == "began" ) then 
	-- Criando variáveis que facilitam a digitação da function
		local obj1 = event.object1
		local obj2 = event.object2 
-- Se ((o myName do obj1 for igual a "" e o myName do obj2 for igual a "" ) ou
			if ((obj1.myName == "tiroInimigo" and obj2.myName == "player" ) or
			-- (o myName do obj1 for igual a "" e o myName do obj2 for igual a "" )) então 
				(obj1.myName == "player" and obj2.myName == "tiroInimigo")) then
				-- Remove o tiroInimigo (variável)
					if (obj1.myName == "tiroInimigo") then
						display.remove (obj1)
					elseif ( obj2.myName == "tiroInimigo") then 
						display.remove (obj2)
					end 	

			-- Remove uma vida do player
				vidas = vidas - 1 
			-- Atualiza o texto do placar.
				vidasText.text = "Vidas: " .. vidas 

				-- Quando vidas for menor ou igual a 0 então
					if (vidas <= 0) then
					-- Remove o player
						display.remove (player)
						-- Remove-se os eventos cujo player é ouvinte
						player:removeEventListener ("touch", moverPlayer)
						player:removeEventListener ("tap", atirar)
					end -- Fecha o if vidas
			end -- Fecha o if myName
	end -- Fecha o if event.phase 
end -- Fecha a function 
 
Runtime:addEventListener ("collision", onCollision)
--colisao entre o tiro do player e o inimigo
local function onCollision2(event)
	
if (event.phase == "began" ) then 
	-- Criando variáveis que facilitam a digitação da function
		local obj1 = event.object1
		local obj2 = event.object2 

			if((obj1.myName == "inimigo" and obj2.myName == "tiro") or
				(obj1.myName == "tiro" and obj2.myName == "inimigo")) then
					--remove o tiro ao colidir
					if (obj1.myName == "tiro") then
						display.remove (obj1)
					else 
						display.remove (obj2)
					end
					pontos = pontos + 1
					pontosText.text = "Pontos: "..pontos
					if(pontos == 500) then

						timer.cancel (inimigo.timerAtirar)
						Runtime:removeEventListener (movimentarInimigo)
						display.remove(obj1)
					else 
						display.remove (obj2)
					end-- remove
				end--if pontos == 500
			end--fecha o if myName
		end-- fecha o event.phase
	--fecha a function

	Runtime:addEventListener("collision", onCollision2)
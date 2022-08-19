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
-- adicionando paredes e chão para manter corpos físicos dentro da tela.
local chao = display.newRect (display.contentCenterX, 470, 500, 30)
-- adicionar a física ao chão. 
physics.addBody (chao, "static")
local paredeEsquerda = display.newRect (-30, 300, 30, 5000)
-- adicionar física a parede. 
physics.addBody (paredeEsquerda, "static")

local paredeDireita = display.newRect (350, 300, 30, 5000)
-- adicionar física a parede. 
physics.addBody (paredeDireita, "static")
-- adicionando o personagem principal.
local player = display.newImageRect ("imagens/player.png", 420*0.2, 594*0.2)
player.x = display.contentCenterX-100
player.y = 388
-- adicionando física ao player.
physics.addBody (player, "dinamic")
player.gravityScale = 0
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

-- Adicionar pontuações na tela. 
local vidasText = display.newText ("Vidas: " .. vidas, 80, 30, native.systemFont, 20)
vidasText:setFillColor (0, 0, 0)

local pontosText = display.newText ("Pontos" .. pontos,200, 30, native.systemFont, 20)
pontosText:setFillColor(0, 0, 0)

--Adicionar a função de atirar ao player

local function atirar ()
    --Criar o projetil.
    local tiro = display.newCircle (player.x, player.y, 4)
    tiro:setFillColor (0, 0, 0)
    --adicionar a fisica ao tiro.
    physics.addBody (tiro, "dynamic", {radius=4, isSensor = true})
    --configuração do tiro como uma bala, faz com que a detecção de colisão fique mais sensivel
    tiro.isBullet = true
    tiro.myName = "tiro"
    tiro.gravityScale = 0

    --define a movimentação do projétil no jogo
    --x=500 - direção do tiro de até 500 pixels caso nao haja colisão
    transition.to(tiro,{x=500, time = 500,
    --ao completar a transição, o sistema remove o projétil
        onComplete = function() display.remove(tiro)
        end
})
end
player:addEventListener ("tap", atirar)

--function de movimentação do player
local function moverPlayer (event)
    local player = event.target
    local phase = event.phase
--quando a fase de toque for igual a began entao
if ("began" == phase) then
--todas as mudanças de direção enquanto o mouse estiver apertado serão focadas no player
    display.currentStage:setFocus(player)
--salva a posição inicial
    player.touchOffsetY= event.y - player.y
    player.touchOffsetX= event.x - player.x
--quando a fase de toque for igual a "moved" entao
    elseif("moved" == phase) then
        player.y = event.y - player.touchOffsetY
        player.x = event.x - player.touchOffsetX
--quando a faser de toque for igual a "ended" ou canceled, então
    elseif ("ended" == phase or "cancelled" == phase) then
--retira o foco de toque do player
    display.currentStage:setFocus(nil)

    end
end

player:addEventListener("touch", moverPlayer)

--criar a variavel de direção inicial do inimigo para utilizar na function de movimentação
local direcaoInimigo = "cima"

--criando movimentação do inimo
local function movimentarInimigo ()

--se a localização y do inimigo nao for nula, entao
    if not(inimigo.y == nil) then
        --se a direção do inimigo for igual a cima então.
        if (direcaoInimigo == "cima") then
            inimigo.y = inimigo.y - 1
            --se a localização do inimigo for maior ou igual a 0 então   
            if(inimigo.y <= 0 ) then
                --altera a direcaoInimigo para baixo
                direcaoInimigo = "baixo"
            end
                --se a direcaoInimigo for igual a baixo entao
                elseif(direcaoInimigo == "baixo") then
                    inimigo.y = inimigo.y + 1
                
                    if (inimigo.y >= 450) then
                        direcaoInimigo = "cima"
                    end
        end
    end
end
Runtime:addEventListener("enterFrame", movimentarInimigo)

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


Runtime:addEventListener ("collision", onCollision)
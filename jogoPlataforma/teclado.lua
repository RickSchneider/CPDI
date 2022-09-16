local teclado = {}

function teclado.novo (objeto)

	local function verificarTecla (event)

		if event.phase == "down" then 
			if event.keyName == "d" then 
				objeto.direcao = "direita"
				objeto:setSequence ("correndo")
				objeto:play ()
				objeto.xScale = 1


			elseif event.keyName == "a" then 
				objeto.direcao = "esquerda"
				objeto:setSequence ("correndo")
				objeto:play ()
				objeto.xScale = -1
			end

				if event.keyName == "space" then 
					objeto.numeroPulo = objeto.numeroPulo + 1

					if objeto.numeroPulo == 1 then 
						objeto:applyLinearImpulse (0, -0.4, objeto.x, objeto.y)

					elseif objeto.numeroPulo == 2 then 
						transition.to (objeto, {rotation = objeto.rotation + 360, time = 750})
						objeto:applyLinearImpulse (0, -0.4, objeto.x, objeto.y)
					end
				end

			elseif event.phase == "up" then 
				if event.keyName == "d" or "a" then 
					objeto.direcao = "parado"
					objeto.setSequence ("parado")
					objeto:play ()


				end
		end
	end

Runtime:addEventListener ("key", verificarTecla)

	local function verificarDirecao

		local velocidadeX, velocidadeY = objeto:getLinearVelocity ()

		if objeto.direcao == "direita" and velocidadeX <= 200 then 
			objeto:applyLinearImpulse (0.2, 0, objeto.x, objeto.y)

		elseif objeto.direcao == "esquerda" and velocidadeX <= -200 then
			objeto:applyLinearImpulse (-0.2, 0, objeto.x, objeto.y)
		end
	end

Runtime:addEventListener ("enterFrame", verificarDirecao)



end

return teclado
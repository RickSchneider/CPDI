local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local json = require ("json") -- Chama a biblioteca json para a cena.

local pontosTable = {}

-- Cria o arquivo pontos.jsn e juntamente um caminho para a pasta. 
local filePath = system.pathForFile ("pontos.json", system.DocumentsDirectory)

local musicaFundo 

local function carregaPontos ()

	-- Abre o arquivo pontos.json como somente leitura
	local pasta = io.open (filePath, "r") 

	if pasta then 
		local contents = pasta:read ("*a") -- Trás todos os dados do arquivo.
		io.close (pasta)
		-- Decodifica as informações do arquivo e salva na table
		pontosTable = json.decode (contents)
	end  
	if (pontosTable == nil or #pontosTable == 0 ) then 
		-- Define as pontuações iniciais dos recordes
		pontosTable = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0} 
	end 
end 

local function salvaPontos ()
	for i = #pontosTable, 11, -1 do -- define que apenas 10 pontuações serão salvas.
		table.remove (pontosTable, i)
	end 

	local pasta = io.open (filePath, "w") -- abre o arquivo para alterações.

	if pasta then 
		-- Inclui as informações da variável table codificada para json.
		pasta:write (json.encode (pontosTable))
		io.close (pasta)
	end 
end 

local function gotoMenu ()
	composer.gotoScene ("menu", {time=800, effect="crossFade"})
end 



-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- É executado quando a cena é aberta pela primeira vez, mas ainda não aparece na tela.
	carregaPontos() -- executa a função que puxa as pontuações anteriores.

	-- inclui a pontuação salva do último jogo na mesa.
	table.insert (pontosTable, composer.getVariable ("finalScore"))

	-- redefine o valor da variável.
	composer.setVariable ("finalScore", 0)

-- função de organização dos valores da tabela do maior para o menor.
	local function compare (a, b)
		return a > b 
	end 
	table.sort (pontosTable, compare) -- Classifica a ordem definida em compare paraa a table.

	salvaPontos () -- Salva os dados atualizados no arquivo JSON

	local bg = display.newImageRect (sceneGroup, "imagens/bg.png", 800, 1400)
	bg.x, bg.y = display.contentCenterX, display.contentCenterY

	local cabecalho = display.newText (sceneGroup, "Recordes", display.contentCenterX, 100, Arial, 80)
	cabecalho:setFillColor (0.75, 0.78, 1)

-- Cria um loop de 1 a 10 para exibir as pontuações.
	for i = 1, 10 do 
		-- Atribui os valores da pontosTable como os que aparecem no loop.
		if (pontosTable[i] ) then
		-- Define que o espaçamento das pontuações seja uniforme de acordo com o número.
			local yPos = 150 + (i*56)

			local ranking = display.newText (sceneGroup, i .. ")", display.contentCenterX-50, yPos, Arial, 44)
			ranking:setFillColor (0.8)
		-- alinha o texto a direita alterando a âncora. 
			ranking.anchorX = 1 

			local finalPontos = display.newText (sceneGroup, pontosTable[i], display.contentCenterX-30, yPos, Arial, 44)
		-- Alinha o texto a esquerda.
			finalPontos.anchorX = 0

		end -- fecha o if 
	end -- fecha o for 

	
end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Acontece imediatamente antes da cena passar para a tela.

	elseif ( phase == "did" ) then
		-- Acontece imediatamente após a cena estar ativa

	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Imediatamente antes da cena sair da tela.

	elseif ( phase == "did" ) then
		-- Imediatamente após a cena sair da tela.

	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Destruir informações do create que não estão relacionadas com os objetos de exibição.

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
-- Chama a biblioteca de física para o código. 
local physics = require ("physics")
-- Inicia a física no projeto. 
physics.start ()
physics.setDrawMode ("normal") -- normal, debug, hybrid

--remover a barra de notificação
display.setStatusBar (display.HiddenStatusBar)

local bg = display.newImageRect ("imagens/background.png", 360, 570 )
bg.x = display.contentCenterX
bg.y = display.contentCenterY 

local plataforma = display.newImageRect ("imagens/platform.png", 300, 50)
plataforma.x = display.contentCenterX
plataforma.y = display.contentHeight - 25
physics.addBody (plataforma, "static")

local balao = display.newImageRect ("imagens/balloon.png", 112, 112)
balao.x = display.contentCenterX
balao.y = display.contentCenterY
balao.alpha = 0.8 
physics.addBody (balao, "dynamic", {radius=50, bounce=0.4})

local numToques = 0

local toquesText = display.newText (numToques, display.contentCenterX, 20, native.systemFont, 50)
toquesText:setFillColor (0, 0, 0)

local function cima ()
		-- Comandos: (impulsoX, impulsoY, balao.x, balao.y)
	balao:applyLinearImpulse (0, -0.75, balao.x, balao.y)
	numToques = numToques + 1
	toquesText.text = numToques
end

balao:addEventListener("tap", cima)

	local function zerou ()
		numToques = 0
		toquesText.text = numToques
	end
	
	plataforma:addEventListener("collision", zerou) = numToques

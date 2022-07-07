--adicionar imagem na tela
--comando display.newImageRect ("pasta/arquivo.formato, largura, altura")
local bg = display.newImageRect ("imagens/bg.jpg", 850*1.2, 850*1.2)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

local player = display.newImageRect ("imagens/player1.png", 260, 300)
player.x = 350
player.y = 790

-- criando funções

local function esquerda ()
    player.x = player.x -5

end
local function direta ()
    player.x = player.x +5

end
local function cima ()
    player.y = player.y -5

end
local function baixo ()
    player.y = player.y +5

end
local botaoEsquerda = display.newImageRect ("imagens/botao.png", 500*0.1, 500*0.1)
botaoEsquerda.x = 600
botaoEsquerda.y = 900
botaoEsquerda:addEventListener ("tap", direta)

local botaoDireita = display.newImageRect ("imagens/botao.png", 500*0.1, 500*0.1)
botaoDireita.x = 500
botaoDireita.y = 900
botaoDireita:addEventListener ("tap", esquerda)

local botaoCima = display.newImageRect ("imagens/botao.png", 500*0.1, 500*0.1)
botaoCima.x = 550
botaoCima.y = 850
botaoCima:addEventListener ("tap", cima)

local botaoBaixo = display.newImageRect ("imagens/botao.png", 500*0.1, 500*0.1)
botaoBaixo.x = 550
botaoBaixo.y = 950
botaoBaixo:addEventListener ("tap", baixo)


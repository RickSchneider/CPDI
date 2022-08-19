--criar um retangulo:
--Comandos: display.newRect (localização x, localização y, largura, altura)
local retangulo = display.newRect (150, 80, 50, 70)

--criar um circulo:
--comandos: display.newCircle (localização x, localização y, radius (raio))
local circulo = display.newCircle (250, 80, 50)

--criar um quadrado:
--comandos: display.newRect (localização x, localização y, largura, altura)
local quadrado = display.newRect (50, 80, 100, 100)

--Criar cum retangulo arredondado:
--comdandos: display.newRoundedRect (localização x, localização y, width, height, cornerRadius)
--cornerRadius: os cantos são arredondados por um quarto de circulo desse valor de raio
local retangulo_arredondado = display.newRoundedRect (350, 80, 70, 100, 20)
--criar um quadrado arredondado:
local retangulo_arredondado = display.newRoundedRect (450, 80, 100, 100, 20)

--criar uma linha:
--comandos: display.newLine(xinicial, yinicial, xfinal, yfinal)
--linha reta vertical              x   y   x     y
local vertical = display.newLine (200, 200, 200, 400)

--linha reta horizontal              x   y     x   y   
local horizontal = display.newLine (20, 200, 400, 200)

--linha reta diagonal
local diagonal = display.newLine (40, 200, 400, 20)

--criar um polígono
--comandos: display.newPolygon (x, y, vertice)
local localizacaoX = 235
local localizacaoY = 400
local vertices = { 0,-110, 27,-35, 105,-35, 43,16, 65,90, 0,45, -65,90, 
-43,15, -105,-35, -27,-35, }

local estrela = display.newPolygon (localizacaoX, localizacaoY, vertices)

--criar novo texto
--comandos: display.newText("texto a ser inserido", x, y, widht, height, font, fontsit, alinhamento)
local helloworld = display.newText("Hello World", 150, 600, arial, 50, center)

local opcoes ={
    text = "Olá Mundo!",
    x = 500,
    y = 500,
    font = Arial,
    fontSize = 50,
    align = "right"
}

local meuTexto = display.newText (opcoes)

--adicionar texto em relevo:
--comando: display.newEmbossedText (opcoes)
--local opcoes= 
--{
--    text = "Texto",
--    x = ,
--    y = ,
--    font = ,
--    fontSize = ,
--    align = ""
--}

local textoRelevo = display.newEmbossedText ("Hello", 450, 600, native.systemFont, 40)
local textoRelevo2 = display.newEmbossedText ("Hello", 650, 600, native.systemFont, 40)

--adicionar cor no objeto/texto:
--comandos:
--variavel:setFillColor (cinza, vermelho, verde, azul, alfa)
textoRelevo2:setFillColor(0, 0.4)

local color = {
    highlight = {r = 0.8, g = 0.819, b = 0.882},
    shadow = {r = 0.3, g = 0.3, b = 0.3}
}

textoRelevo2:setEmbossColor ( color )

quadrado:setFillColor(0.2, 0.5, 1,1,0.5)

circulo:setFillColor(0.9, 0.1, 1,1,0.5)

--gradiente:
--comando:
--local gradiente = {
--type = "gradient",
--color1={ , , },color1={ , , },color2={ , , },direction = ""

local gradiente = {
    type = "gradient",
    color1={1, 0.1, 0.9},
    color2={0.8, 0.8, 0.8},
    direction = "down"
}

estrela:setFillColor ( gradient )
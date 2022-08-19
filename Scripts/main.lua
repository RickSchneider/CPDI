--carregar os scripts e guardalos dentro de uma variavel
local playerScript = require("player")
-- local inimigoScript = require ("inimigo")

local physics = require ("physics")
physics.start()
physics.setGravity(0, 0)
physics.setDrawMode ("normal")

display.setStatusBar(display.HiddenStatusBar)

local grupoBg = display.newGroup()
local grupoMain = display.newGroup()
local grupoUi = display.newGroup()

local bg = display.newImageRect(grupoBg,"imagens/bg.jpg", 728*1.5, 410*1.5)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

local pontos = 0
local vidas = 4

local pontosText = display.newText (grupoUi, "Pontos:  "..pontos, 100, 50, native.systemFont, 20)
pontosText:setFillColor (0, 0, 0)
local vidasText = display.newText (grupoUi, "Vidas".. vidas, 200, 50, native.systemFont, 20)
vidasText:setFillColor (0, 0, 0)


local player = playerScript.novo(grupoMain)
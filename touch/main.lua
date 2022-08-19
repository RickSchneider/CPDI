-- local function detectarTap( event )
 
--     -- Código executado quando o botão é tocado.

--     print( "Objeto tocado: " .. tostring(event.target) )  -- "event.target" é o objeto tocado
--     -- tostring: para sequenciar
--     return true
--    -- "zera" todos os dados depois da função executada.
-- end -- fecha a local function.
 
-- local botaoTap = display.newRect( 200, 200, 200, 50 )
-- botaoTap:addEventListener( "tap", detectarTap )  -- Adicione um ouvinte "tap" ao objeto


-- local function tapDuplo( event )
 
--  -- Quando (o parâmetro número de taps for igual a 2 ) então
--     if ( event.numTaps == 2 ) then
--     	--Print para mostrar que o tap duplo realmente foi detectado.
--         print( "Objeto tocado duas vezes: " .. tostring(event.target) )
--   -- Senão
--     else
--     	-- nada acontece.
--         return true
--     end -- fecha o else.
-- end -- fecha a function 
 
-- local botaoTapDuplo = display.newRect( 100, 100, 200, 50 )
-- botaoTapDuplo:addEventListener( "tap", tapDuplo )




-- local function detectarTouch (event)
-- 	-- Tira print da localização x do toque
-- 	print ("Localização X do toque" .. event.x)
-- 	-- Tira print da localização y do toque
-- 	print ("Localização Y do toque" .. event.y)
-- end 

-- local botao = display.newRect (100, 300, 200, 50)
-- botao:addEventListener ("touch", detectarTouch) -- Adiciona um listener "touch" ao objeto


-- local function fasesToque( event )
 
--  -- se (a fase de evento for igual a "began") então 
--     if ( event.phase == "began" ) then
--         -- Código executado quando o botão é tocado
--         print( "Objeto tocado = " .. tostring(event.target) )  -- "event.target" é o objeto tocado
-- -- entretanto se (a fase de evento for igual a "moved") então 
--     elseif ( event.phase == "moved" ) then
--         -- Código executado quando o toque é movido sobre o objeto
--         print( "localização de toque nas seguintes coordenadas = X:" .. event.x .. ", Y:" .. event.y )
-- -- porém se (a fase de evento for igual a "ended") então 
--     elseif ( event.phase == "ended" ) then
-- -- Código executado quando o toque levanta o objeto
--         print( "Touch terminado no objeto: " .. tostring(event.target) )
    
--     end -- fecha o if e os elseifs

--     return true  -- Impede a propagação de toque/toque para objetos subjacentes
-- end -- fecha a function
 
-- local botaoTouch = display.newRect( 200, 400, 200, 50 )
-- botaoTouch:addEventListener( "touch", fasesToque ) -- Adiciona um listener "touch" ao objeto
 

-------------------------------------------------------------------------------------------
--para usar o multitouch precisamos habilitar primeiramente.
-- system.activate("multitouch")      

-- local newRect1 = display.newRect (display.contentCenterX, display.contentCenterY, 280, 440)
-- newRect1:setFillColor (1, 0, 0.3)

-- local function touchListener(event)
    
--     print("Fase de toque: " .. event.phase)
--     --tostring serve para sequenciar ações
--     print("Localização X: " .. tostring(event.x).. ", Localização Y" .. tostring(event.y))
--     print("ID de toque exclusivo: " .. tostring(event.id))
--     print("-------------")
--     return true
-- end
-- newRect1:addEventListener("touch", touchListener)

--Propagação de toque

-- local function myTouchListener (event)
--     if(event.phase == "began") then
--         --Código executado quando o botao é tocado 
--         print("Object touch = " .. tostring(event.target))
--     end
--     return true --impede a propagação de tap/touch para objetos
-- end

-- local myButton = display.newRect(100, 100, 200, 50)
-- myButton:addEventListener("touch", myTouchListener)

-- local retangulo1 = display.newRect( display.contentCenterX, 160, 60, 60 )
-- retangulo1:setFillColor( 1, 0, 0.3 )
-- local retangulo2 = display.newRect( display.contentCenterX, 320, 60, 60 )
-- retangulo2:setFillColor( 0.3, 0, 1 )
 
-- -- Touch event listener
-- local function touchListener1( event )
 
--     if ( event.phase == "began" ) then
--         event.target.alpha = 0.5
--         -- Definir foco no objeto
-- display.getCurrentStage():setFocus( event.target )
 
--     elseif ( event.phase == "ended" or event.phase == "cancelled" ) then
--         event.target.alpha = 1
--         -- Liberar o foco no objeto
--         display.getCurrentStage():setFocus( nil )
--     end
--     return true
-- end
-- -- Adicione um ouvinte de toque a cada objeto
-- retangulo1:addEventListener( "touch", touchListener1 )
-- retangulo2:addEventListener( "touch", touchListener1 )

local imgA = display.newImageRect ("img/A.png", 260*0.5, 300*0.5)
imgA.x = 200
imgA.y = 200

local imgB = display.newImageRect ("img/B.png", 260*0.5, 300*0.5)
imgB.x = 50
imgB.y = 200
 
local function touchImg(event)
    if(event.phase == "beggan")then
        event.target.alpha = 0.5
        display.getCurrentStage():setFocus (event.target)
    
        elseif (event.phase == "ended" or event.phase == "cancelled")then
            event.target.alpha = 1
            display.getCurrentStage():setFocus (nil)
            end
    return true
end
    
imgA:addEventListener ("touch", touchImg)
imgB:addEventListener ("touch", touchImg)
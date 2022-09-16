local composer = require ("composer")

local physics = require ("physics")
physics.start()
physics.setGravity (0,0)
 
audio.reserveChannels (1)
audio.setVolume (0.2, {channel = 1})

-- faz com que os math.randoms nao tenham padrao previsivel.
math.randomseed (os.time())

display.setStatusBar ( display.HiddenStatusBar)

composer.gotoScene("menu")
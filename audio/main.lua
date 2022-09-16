--utilizada para sons curtos
local audioTiro = audio.loadSound ("Audio/tiro.wav")

--utilizado para musicas/sons longos.
local audioBg = audio.loadStream ("Audio/audio_bg.mp3")

local audioMoeda = audio.loadSound("Audio/moeda.wav")

-- reservando um canal para cada musica de fundo
audio.reserveChannels(1)
audio.reserveChannels(2)

-- controlar o volume do canal
audio.setVolume (1,{channel = 1})
audio.play(audioBg,{channel = 1, loops = -1})
audio.setVolume (1,{channel = 2})



local botaoEsquerda = display.newCircle(60, 300, 32)
botaoEsquerda:setFillColor(1, 0, 0)

local botaoDireita = display.newCircle(260, 300, 32)
botaoDireita:setFillColor(0, 1, 0)

local function tocarTiro (event)
    if(event.phase == "began") then
        audio.pause(audioBg)
        local canalTiro = audio.play (audioTiro)
    elseif (event.phase == "ended")then
        audio.resume (audioBg)
    end

end

botaoEsquerda:addEventListener ("touch", tocarTiro)

local function tocarMoeda (event)
    if(event.phase == "began") then
        audio.pause(audioBg)
        local canalMoeda = audio.play (audioMoeda)
    elseif (event.phase == "ended")then
        audio.resume (audioBg)
    end

end


botaoDireita:addEventListener ("touch", tocarMoeda)
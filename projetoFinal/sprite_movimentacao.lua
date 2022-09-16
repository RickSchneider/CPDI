local composer = require( "composer" )

local scene = composer.newScene()

--1601 largura / 4 = 400,25
--2397 comprimento /4 = 599,25
local spriteOpcoes = 
{
	frames=
	{
		{ -- 1) posição frente 1
			x = 0,
			y = 0,
			width = 400.25,
			height =599.25  
		},
		{ -- 2) posição frente  2
			x = 400.25,
			y = 0,
			width = 400.25,
			height =599.25
		},
		{ -- 3) posição frente  3
			x = 800.50,
			y = 0,
			width = 400.25,
			height =599.25
		},
		{ -- 4) posição frente 4
			x = 1200.75,
			y = 0,
            width = 400.25,
			height =599.25
		}, 
		{ -- 5) posição costas 1 
			x = 0,
			y = 599.25,
			width = 400.25,
			height = 599.25

		}, 
        { -- 6) posição costas 2 
			x = 400.25,
			y = 599.25,
			width = 400.25,
			height = 599.25

		}, 
        { -- 7) posição costas 3
			x = 800.25,
			y = 599.25,
			width = 400.25,
			height = 599.25

		}, 
        { -- 8)  posição costas 4
			x = 1200.75,
			y = 599.25,
			width = 400.25,
			height = 599.25

		}, 
        { -- 9) posição 
        x = 0,
        y = 599.25,
        width = 400.25,
        height = 599.25

    }, 
    { -- 10) posição costas 2 
        x = 400.25,
        y = 599.25,
        width = 400.25,
        height = 599.25

    }, 
    { -- 11) posição costas 3
        x = 800.25,
        y = 599.25,
        width = 400.25,
        height = 599.25

    }, 
    { -- 12)  posição costas 4
        x = 1200.75,
        y = 599.25,
        width = 400.25,
        height = 599.25

	},
}

local sprite = graphics.newImageSheet ("imagens/sprite.png", spriteOpcoes)

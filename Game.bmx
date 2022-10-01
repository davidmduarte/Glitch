SuperStrict

Import "Paralax.bmx"
Import "Pil.bmx"

Type TGame
	Field paralax:TParalax
	Field life:Float
	
	Method New()
		Self.life = 200
		Self.paralax = New TParalax(0, 0)
	End Method
	
	Method render:Int()
		Self.paralax.draw()
		
		' Bottom Background
		SetColor(0, 0, 0)
		DrawRect(0, 425, 1280, 295)
		SetColor(255, 255, 255)
		
		' Left Shade / Progress Bar or Past
		SetBlend(ALPHABLEND)
		SetColor(0, 0, 0)
		SetAlpha(0.7)
		DrawRect(0, 0, Self.life, 720)
		SetAlpha(1)
		SetColor(255, 255, 255)
		SetBlend(MASKBLEND)
		
		' Present line
		SetColor(0, 170, 170)
		DrawRect(Self.life - 1, 0, 2, 720)
		SetColor(255, 255, 255)
		
		
		Return 3
	End Method
End Type

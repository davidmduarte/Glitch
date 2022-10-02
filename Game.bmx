SuperStrict

Import "Paralax.bmx"
Import "Pill.bmx"

Type TGame
	Const every10Seconds:Int = 10 * 60
	Field paralax:TParalax
	Field life:Float
	Field pill:TPill
	Field mode:Int ' 0 music mode | 1 pill mode
	Field countEvery10Seconds:Int
	
	Method New()
		Self.life = 200
		Self.paralax = New TParalax(0, 0)
		Self.pill = New TPill()
		Self.mode = 1
		Self.countEvery10Seconds = 0
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
		
		Self.pill.draw(200)
		
		' Present line
		SetColor(0, 170, 170)
		DrawRect(Self.life - 1, 0, 2, 720)
		SetColor(255, 255, 255)
		
		If KeyDown(KEY_P) Then
			' Aqui vai o pause
		End If
		
		Self.countEvery10Seconds :+ 1
		
		If Self.countEvery10Seconds >= Self.every10Seconds Then
			Self.countEvery10Seconds = 0
			Self.mode = ((Self.mode + 1) Mod 2)
		End If
		
		If Self.mode = 0 Then ' music mode
			' dont know yet
		Else 				  ' pill mode
			pill.handleKeys()
		End If
		
		
		
		Return 3
	End Method
End Type

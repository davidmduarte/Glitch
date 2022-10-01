SuperStrict

Import "Paralax.bmx"

Type TGame
	Field paralax:TParalax
	
	Method New()
		Self.paralax = New TParalax(0, 0)
	End Method
	
	Method render:Int()
		DrawText("Game Play here (under construction)", (1280 - TextWidth("Game Play here (under construction)")) / 2, 400)
		Self.paralax.draw()
		
		Return 3
	End Method
End Type

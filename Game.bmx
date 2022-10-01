SuperStrict

Type TGame
	Field dummy:Int
	
	Method New()
		dummy = 0
	End Method
	
	Method render:Int()
		DrawText("Game Play here (under construction)", (1280 - TextWidth("Game Play here (under construction)")) / 2, 400)
		Return 3
	End Method
End Type

SuperStrict

Type TStory
	Field maxFrames:Int
	Field bgImage:TImage
	Field text:String[6]
	Field y:Float
	Field lastY:Float
	
	Method New()
		Self.maxframes = 20 * 60
		Self.bgImage = LoadImage("assets/splash_bg.png")
		Self.text[0] = "... there’s a moment in life that everything it’s a choice..."
		Self.text[1] = "sometimes... choices are just 10 seconds away of..."
		Self.text[2] = "being wrong...."
		Self.text[3] = "You are the chosen one ... again... a part of the matrix that got away... even NEO could’nt Catch you..."
		Self.text[4] = "You are the only hope To save the lifebeat..."
		Self.text[5] = "And your choices... start NOW!"
		Self.y = 720
		Self.lastY = 200
	End Method
	
	Method render:Int()
		DrawImage(Self.bgImage, 0, 0)
		
		SetScale(1.5, 1.5)
		For Local i:Int = 0 Until 6
			DrawText(Self.text[i], (1280 - (TextWidth(Self.text[i])) * 1.5) / 2, Self.y + (i * 40))
			
			Self.y :+ (Self.lastY - Self.y) / 100
		Next
		SetScale(1, 1)
		
		DrawText(Self.maxFrames, 1200, 700)
		
		Self.maxFrames :- 1
		If Self.maxFrames > 0 Then Return 1
		Return 2
	End Method
End Type

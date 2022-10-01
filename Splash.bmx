SuperStrict

Type TSplash
	Field maxFrames:Float
	Field fade:Float
	Field bgImage:TImage
	Field titleImage:TImage
	
	Method New()
		Self.maxFrames = 4 * 60
		Self.fade = 0 
		Self.bgImage = LoadImage("assets/splash_bg.png")
		Self.titleImage = LoadImage("assets/splash_title.png")
	End Method
	
	Method render:Int()
		DrawImage(Self.bgImage, 0, 0)

		SetBlend(ALPHABLEND)
		SetAlpha(Self.fade)
		DrawImage(Self.titleImage, 50, 200)
		SetAlpha(1)
		SetBlend(MASKBLEND)

		DrawText(Self.maxFrames, 1200, 700)
		
		Self.fade :+ 0.01
		
		Self.maxFrames :- 1
		If Self.maxFrames > 0 Then Return 0
		
		Return 1
	End Method
End Type
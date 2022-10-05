SuperStrict

Type TPill
	Const gravity:Float = 0.1
	Const friction:Float = 0.6
	Const miniJumpForce:Float = -30
	Const jumpForce:Float = -200
	Field image:TImage
	Field bg:TImage
	Field x:Float
	Field y:Float
	Field jumpY:Float
	Field jumpTimeFrames:Float
	Field movY:Float
	Field flagToJumpHigherNextTime:Float
	Field glowAngle:Float
	Field glowAlpha:Float
	
	Method New()
		Self.image = LoadImage("assets/pill.png")
		Self.bg = LoadImage("assets/glow.png")
		Self.y = 350
		Self.jumpY = 0
		Self.movY = 0
		Self.jumpTimeFrames = 0
		Self.flagToJumpHigherNextTime = False
		Self.glowAngle = 0
		SetImageHandle(Self.bg, ImageWidth(Self.bg) / 2, ImageHeight(Self.bg) / 2)
		Self.glowAlpha = 1
	End Method
	
	Method draw(x:Int)
		If Self.jumpY >= 0 Then
			Self.jumpY = Self.miniJumpForce
			Self.jumpTimeFrames = 0
		Else
			Self.jumpY :+ (Self.gravity * Self.jumpTimeFrames)
			Self.jumpTimeFrames :+ 1
		End If
		
		Self.x = x - 25
		Self.glowAngle :+ 1
		Self.glowAlpha = (Self.glowAlpha + 0.55) Mod 360
		
		SetBlend(ALPHABLEND)
		SetRotation(Self.glowAngle)
		SetAlpha(Self.glowAlpha)
		DrawImage(Self.bg, Self.x + 25, Self.y - 80 + Self.jumpY + Self.movY + 40)
		SetRotation(0)
		SetBlend(MASKBLEND)
		SetAlpha(1)
		DrawImage(Self.image, Self.x, Self.y - 80 + Self.jumpY + Self.movY)
	End Method
	
	Method handleKeys()
		If KeyDown(KEY_UP) Then
			Self.movY :- 1
			If Self.movY < 0 Then Self.movY = 0
		Else If KeyDown(KEY_DOWN) Then
			Self.movY :+ 1
			If Self.movY > 55 Then Self.movY = 55
		Else If KeyDown(KEY_SPACE) Then
			Self.flagToJumpHigherNextTime = True
		End If
	End Method
End Type

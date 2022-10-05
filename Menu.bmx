SuperStrict

Type TMenu
	Field maxframes:Int
	Field bgImage:TImage
	Field options:String[5]
	Field idx:Int
	Field creditsMaxFrames:Int
	Field creditsY:Float
	Field lastCreditsY:Float
	Field scale:Float
	Field music:TSound
	Field musicChannel:TChannel
	
	Method New()
		Self.bgImage = LoadImage("assets/splash_bg.png")
		Self.options[0] = "START"
		Self.options[1] = "Credits"
		Self.options[2] = "Rules"
		Self.options[3] = "Read the AWESOME Initial Story again"
		Self.options[4] = "Quit"
		Self.idx = 0
		Self.creditsMaxFrames = 0
		Self.creditsY = -10
		Self.lastCreditsY = 670
		Self.scale = 1.5
		Self.music = LoadSound("assets/glitch_intro_loop.wav", True)
		Self.musicChannel = PlaySound(Self.music)
	End Method
	
	Method render:Int()
		Local lineHeight:Int = 0
		
		DrawImage(Self.bgImage, 0, 0)
		
		For Local i:Int = 0 Until 5
			If i = 0 Then 
				Self.scale = 3
			Else 
				Self.scale = 1.5
			End If
			
			If i = 1 Then
				lineHeight :+ 60
			Else
				lineHeight :+ 40
			End If
			
			If i = idx Then
				SetColor(255, 85, 255)
			Else 
				SetColor(255, 255, 255)
			End If
			
			SetScale(Self.scale, Self.scale)
			DrawText(Self.options[i], (1280 - (TextWidth(Self.options[i]) * Self.scale)) / 2, 100 + lineHeight)
			SetScale(1, 1)
		Next
		
		If Self.creditsMaxFrames > 0 Then
			SetColor(255, 255, 255)
			DrawText("Bruno Ribeiro", 1100, Self.creditsY - 40)
			SetColor(85, 255, 255)
			DrawText("David Duarte", 1100, Self.creditsY - 20)
			SetColor(255, 85, 255)
			DrawText("Miguel Bengala", 1100, Self.creditsY)
			
			Self.creditsY :+ (Self.lastCreditsY - Self.creditsY) / 5
			Self.creditsMaxFrames :+ 1
		Else
			Self.creditsY = -10
		End If
		
		SetColor(255, 255, 255)
		
		If KeyHit(KEY_UP) Then
			Self.idx :-1
			If Self.idx < 0 Then Self.idx = 4
		Else If KeyHit(KEY_DOWN) Then
			Self.idx :+ 1
			If Self.idx > 4 Then Self.idx = 0
		Else If KeyHit(KEY_ENTER) Then
			Select Self.idx
				Case 0 
					StopChannel(Self.musicChannel)
					Return 3
				Case 1 Self.creditsMaxFrames = 5 * 60
				Case 2 
					If Self.options[2] = "Rules" Then 
						Self.options[2] = "There are NO Rules"
					Else
						Self.options[2] = "Rules"
					End If
				Case 3 Return 1
				Case 4 
					StopChannel(Self.musicChannel)
					Return 4
			End Select
		End If
		
		Return 2
	End Method
End Type

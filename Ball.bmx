SuperStrict

Import "SoundLine.bmx"

Type TBall
	Field x:Int
	Field y:Int
	Field active:Int
	Field image:TImage
	Field bg:TImage
	Field idx:Int
	
	Method New(idx:Int)
		Self.bg = LoadImage("assets/active_number_glow.png")
		Self.idx = idx
		Select idx
			Case 0 
				Self.image = LoadImage("assets/pink_number.png")
				Self.y = 514
			Case 1 
				Self.image = LoadImage("assets/blue_number.png")
				Self.y = 542
			Case 2 
				Self.image = LoadImage("assets/white_number.png")
				Self.y = 567
			Case 3 
				Self.image = LoadImage("assets/green_number.png")
				Self.y = 593
		End Select
		Self.active = False
	End Method
	
	Method draw(presentX:Int)
		Self.x = presentX - 33
		
		SetBlend(ALPHABLEND)
		If Self.active Then 
			DrawImage(Self.bg, Self.x + 10, Self.y - 10)
			If soundChannel[Self.idx] <> Null And ChannelPlaying(soundChannel[Self.idx]) Then
				SetChannelVolume(soundChannel[Self.idx], 1)
			End If
		Else
			If soundChannel[Self.idx] <> Null And ChannelPlaying(soundChannel[Self.idx]) Then
				SetChannelVolume(soundChannel[Self.idx], 0.25)
			End If
			
		End If
		DrawImage(Self.image, Self.x, Self.y)
		SetBlend(MASKBLEND)
	End Method
End Type

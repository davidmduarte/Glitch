SuperStrict

Import "Paralax.bmx"
Import "Pill.bmx"
Import "SoundLine.bmx"
Import "Ball.bmx"

Type TGame
	Const every10Seconds:Int = 10 * 60
	Field paralax:TParalax
	Field life:Float
	Field pill:TPill
	Field mode:Int ' 0 music mode | 1 pill mode
	Field countEvery10Seconds:Int
	Field line1:TSoundLine
	Field line2:TSoundLine
	Field line3:TSoundLine
	Field line4:TSoundLine
	Field ball1:TBall
	Field ball2:TBall
	Field ball3:TBall
	Field ball4:TBall
	Field cntFrames:Int
	Field speed:Float
	Field music:TSound
	Field musicChannel:TChannel
	Field infoKeys1:TImage
	Field infoKeys2:TImage
	
	Method New()
		Self.life = 200
		Self.paralax = New TParalax(0, 0)
		Self.pill = New TPill()
		Self.mode = 1
		Self.countEvery10Seconds = 0
		
		Self.line1 = New TSoundLine(0)
		Self.line2 = New TSoundLine(1)
		Self.line3 = New TSoundLine(2)
		Self.line4 = New TSoundLine(3)
		
		Self.ball1 = New TBall(0) 
		Self.ball2 = New TBall(1)
		Self.ball3 = New TBall(2)
		Self.ball4 = New TBall(3)
		Self.cntFrames = 0
		Self.speed = -3
		
		InitLineImages()
		InitSoundLines(Self.line1, Self.line2, Self.line3, Self.line4, Self.speed)
		
		Self.music = LoadSound("assets/glitch_gameplay_loop.wav", True)
		Self.musicChannel = PlaySound(Self.music)
		SetChannelVolume(Self.musicChannel, 0.5)
		
		Self.infoKeys1 = LoadImage("assets/info_keys1.png")
		Self.infoKeys2 = LoadImage("assets/info_keys2.png")
	End Method
	
	Method render:Int()
		Self.paralax.draw()
		
		' Bottom Background
		SetColor(0, 0, 0)
		DrawRect(0, 425, 1280, 295)
		SetColor(255, 255, 255)
		
		'RenderSoundLines
		Self.line1.draw(Self.speed, Self.cntFrames, 200)
		Self.line2.draw(Self.speed, Self.cntFrames, 200)
		Self.line3.draw(Self.speed, Self.cntFrames, 200)
		Self.line4.draw(Self.speed, Self.cntFrames, 200)
		
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
		
		Self.pill.draw(200)
		
		Self.ball1.draw(200)
		Self.ball2.draw(200)
		Self.ball3.draw(200)
		Self.ball4.draw(200)
		
		If KeyDown(KEY_P) Then
			' Aqui vai o pause
		End If
		
		Self.countEvery10Seconds :+ 1
		Self.cntFrames :+ 1
		
		If Self.countEvery10Seconds >= Self.every10Seconds Then
			Self.countEvery10Seconds = 0
			Self.mode = ((Self.mode + 1) Mod 2)
		End If
		
		'If Self.mode = 0 Then ' music mode
			DrawImage(Self.infoKeys1, 10, 10)
			' dont know yet
			HandleSoundKeys(Self.ball1, Self.ball2, Self.ball3, Self.ball4)
		'Else 				  ' pill mode
			DrawImage(Self.infoKeys2, 10, 710 - ImageHeight(Self.infoKeys2))
		'	pill.handleKeys()
		'End If
		
		Return 3
	End Method
End Type

Function HandleSoundKeys(ball1:TBall Var, ball2:TBall Var, ball3:TBall Var, ball4:TBall Var)
	ball1.active = False
	ball2.active = False
	ball3.active = False
	ball4.active = False
	
	If KeyDown(KEY_1) Then ball1.active = True
	If KeyDown(KEY_2) Then ball2.active = True
	If KeyDown(KEY_3) Then ball3.active = True
	If KeyDown(KEY_4) Then ball4.active = True
	
End Function

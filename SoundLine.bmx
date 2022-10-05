SuperStrict

Import "MusicExample.bmx"

Global colorNames:String[] = ["pink", "blue", "white", "green"]
Global sound:TSound[]
Global soundChannel:TChannel[]

Type TRGB
	Field r:Int
	Field g:Int
	Field b:Int

	Method New(r:Int, g:Int, b:Int)
		Self.r = r
		Self.g = g
		Self.b = b
	End Method
End Type

Type TSoundPiece
	Field start:Float
	Field duration:Float
	Field lineIdx:Int
	Field x:Float				' x has a direct relation with start
	Field width:Float           ' width has a direct relation with duration
	Field mapY:Int[4]
	Field mapColor:TRGB[4]

	Method New(lineIdx:Int, start:Float, duration:Float, speed:Float)
		Self.mapY = [522, 549, 575, 601]
		Self.mapColor[0] = New TRGB(255, 85, 255)
		Self.mapColor[1] = New TRGB(85, 255, 255)
		Self.mapColor[2] = New TRGB(255, 200, 255)
		Self.mapColor[3] = New TRGB(0, 220, 0)
		Self.lineIdx = lineIdx
		Self.start = start
		Self.duration = duration
		Self.x = Self.start * speed * -1
		Self.width = Self.duration * speed * -1
	End Method

	Method draw(speed:Float, cntFrames:Float, presentX:Float)
		Local auxX:Float = Self.x + (speed * cntFrames)
		Local auxY:Float = Self.mapY[Self.lineIdx]

		If auxX > 1280 Then Return
		If auxX + Self.width < 0 Then Return

		If presentX >= auxX And presentX <= auxX + Self.width Then
			If soundChannel[Self.lineIdx] = Null Or Not ChannelPlaying(soundChannel[Self.lineIdx])
				soundChannel[Self.lineIdx] = PlaySound(sound[Self.lineIdx])
				SetChannelVolume(soundChannel[Self.lineIdx], 0.25)
			End If
		Else If presentX >= auxX + Self.width Then
			If Len(soundChannel) > Self.lineIdx And soundChannel[Self.lineIdx] <> Null And ChannelPlaying(soundChannel[Self.lineIdx]) Then
				'PauseChannel(soundChannel[Self.lineIdx])
				StopChannel(soundChannel[Self.lineIdx])
			End If
		End If

		SetColor(Self.mapColor[Self.lineIdx].r, Self.mapColor[Self.lineIdx].g, Self.mapColor[Self.lineIdx].b)
		DrawRect(auxX, auxY, Self.width, 10)
		SetColor(255, 255, 255)

	End Method
End Type

Type TSoundLine
	Field pieces:TSoundPiece[]
	Field lineIdx:Int
	Field curIdx:Int

	Method New(lineIdx:Int)
		Self.lineIdx = lineIdx
		Self.pieces = New TSoundPiece[20]
		For Local i:Int = 0 Until 20
			Self.pieces[i] = Null
		Next
		Self.curIdx = 0
	End Method

	Method add(start:Float, duration:Float, speed:Float)
		Self.pieces[Self.curIdx] = New TSoundPiece(Self.lineIdx, start, duration, speed)
		Self.curIdx :+ 1
	End Method

	Method draw(speed:Float, cntFrames:Float, presentX:Float)
		For Local i:Int = 0 Until 20
			If Self.pieces[i] = Null Then Continue
			Self.pieces[i].draw(speed, cntFrames, presentX)
		Next
	End Method
End Type

Function InitSoundLines(line1:TSoundLine Var, line2:TSoundLine Var, line3:TSoundLine Var, line4:TSoundLine Var, speed:Float)
	Local timeStartInFrames:Float
	Local durationInFrames:Float

	For Local i:Int = 0 Until Len(musicExample)
		timeStartInFrames = 50 + musicExample[i].timeStart * 2.5 * 60
		durationInFrames =  musicExample[i].duration  * 2.5 * 60
		
		Select musicExample[i].soundIdx
			Case 0 line1.add(timeStartInFrames, durationInFrames, speed)
			Case 1 line2.add(timeStartInFrames, durationInFrames, speed)
			Case 2 line3.add(timeStartInFrames, durationInFrames, speed)
			Case 3 line4.add(timeStartInFrames, durationInFrames, speed)
		End Select
	Next

	sound = New TSound[4]
	soundChannel = New TChannel[4]
	
	For Local j:Int = 0 Until 4
		sound[j] = LoadSound("assets/" + colorNames[j] + "_sound.wav", True)
	Next
End Function

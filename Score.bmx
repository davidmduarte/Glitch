SuperStrict

Function LeftPad:String(n:Int)
	Local str:String = ""

	For Local i:Int = 0 Until n
		str :+ "0"
	Next
	
	Return str
End Function

Type TScore
	Const heightStep:Int = 40
	Field maxDigits:Int
	Field score:Int
	Field strScore:String
	Field image:TImage
	Field yPos:Float[]
	Field auxYPos:Float[]
	
	Method New(maxDigits:Int, initialScore:Int)
		Self.image = LoadImage("assets/score_digits.png")
		Self.maxDigits = maxDigits
		
		Self.yPos = New Float[Self.maxDigits]
		For Local i:Int = 0 Until Self.maxDigits
			Self.yPos[i] = 0
		Next
		
		Self.auxYPos = New Float[Self.maxDigits]
		For Local i:Int = 0 Until Self.maxDigits
			Self.auxYPos[i] = 0
		Next
		
		Self.score = 0
		Self.add(initialScore)
	End Method
	
	Method add(score:Int)
		Self.score :+ score
		Self.strScore = Self.score + ""
		Self.strScore = LeftPad(Self.maxDigits - Len(Self.strScore)) + Self.strScore
		
		For Local i:Int = 0 Until Self.maxDigits
			Self.yPos[i] = Self.strScore[i] - 48
		Next
	End Method
	
	Method draw()
		For Local i:Int = 0 Until Self.maxDigits
			DrawSubImageRect(Self.image, i * 19, 0, 19, 40, 0, Self.auxYPos[i], 19, 40, 0, 0)
			Self.auxYPos[i] :+ (((9 - (Self.yPos[i] Mod 10)) * Self.heightStep) - Self.auxYPos[i]) / 5
		Next	
	End Method
End Type
'' DEBUG
'Graphics(800, 400)
'
'Local test:TScore = New TScore(5, 0)
'
'Repeat 
'	Cls()
'	DrawRect(0, 0, 800, 400)
'	test.draw()
'	Flip()
'	
'	If KeyDown(KEY_SPACE) Then
'		test.add(1)
'	End If
'Until AppTerminate()
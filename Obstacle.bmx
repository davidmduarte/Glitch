SuperStrict

Global obsImage:TImage[4]
obsImage[0] = LoadImage("assets\tests\obstacle1.png")
obsImage[1] = LoadImage("assets\tests\obstacle2.png")
obsImage[2] = LoadImage("assets\tests\obstacle3.png")
obsImage[3] = LoadImage("assets\tests\obstacle4.png")

Type TObstacle
	Const rowInPixels:Float = 32
	Field obsIdx:Int
	Field lineIdx:Int
	Field rowIdx:Int
	Field x:Float
	Field y:Float
	Field mapY:Float[4]
	Field img:TImage
	
	Method New(obsIdx:Int, lineIdx:Int, rowIdx:Float)
		Self.obsIdx = obsIdx
		Self.lineIdx = lineIdx
		Self.rowIdx = rowIdx
		Self.mapY[0] = 360
		Self.mapY[1] = 376
		Self.mapY[2] = 392
		Self.mapY[3] = 408
		Self.img = obsImage[obsIdx]
		Self.x = Self.rowIdx * Self.rowInPixels
		Self.y = Self.mapY[lineIdx]
	End Method

	Method Draw(speed:Float, cntFrames:Float, presentX:Float)
		Local auxX:Float = Self.x + presentX + speed * cntFrames
		Local auxY:Float = Self.y - 20
		DrawImage( Self.img, auxX, auxY)
	End Method
End Type

Global obstacles:TObstacle[40]
obstacles[0] = New TObstacle(0, 0, 0)
obstacles[1] = New TObstacle(1, 1, 3)
obstacles[2] = New TObstacle(2, 2, 6)
obstacles[3] = New TObstacle(3, 3, 12)
obstacles[4] = New TObstacle(0, 0, 18)
obstacles[5] = New TObstacle(1, 1, 21)
obstacles[6] = New TObstacle(2, 2, 24)
obstacles[7] = New TObstacle(3, 3, 27)
obstacles[8] = New TObstacle(0, 0, 30)
obstacles[9] = New TObstacle(1, 1, 33)
obstacles[10] = New TObstacle(2, 2, 36)
obstacles[11] = New TObstacle(3, 3, 42)
obstacles[12] = New TObstacle(0, 0, 48)
obstacles[13] = New TObstacle(1, 1, 51)
obstacles[14] = New TObstacle(2, 2, 54)
obstacles[15] = New TObstacle(3, 3, 57)
obstacles[16] = New TObstacle(0, 0, 60)
obstacles[17] = New TObstacle(1, 1, 63)
obstacles[18] = New TObstacle(2, 1, 66)
obstacles[19] = New TObstacle(3, 2, 69)
obstacles[20] = New TObstacle(0, 0, 72)
obstacles[21] = New TObstacle(1, 1, 72)
obstacles[22] = New TObstacle(2, 2, 80)
obstacles[23] = New TObstacle(3, 3, 85)
obstacles[24] = New TObstacle(0, 0, 85)
obstacles[25] = New TObstacle(1, 1, 90)
obstacles[26] = New TObstacle(2, 2, 90)
obstacles[27] = New TObstacle(3, 3, 100)
obstacles[28] = New TObstacle(0, 0, 100)
obstacles[29] = New TObstacle(1, 1, 110)
obstacles[30] = New TObstacle(2, 2, 110)
obstacles[31] = New TObstacle(3, 3, 115)
obstacles[32] = New TObstacle(0, 0, 120)
obstacles[33] = New TObstacle(1, 1, 125)
obstacles[34] = New TObstacle(2, 2, 130)
obstacles[35] = New TObstacle(3, 3, 135)
obstacles[36] = New TObstacle(0, 0, 140)
obstacles[37] = New TObstacle(1, 1, 145)
obstacles[38] = New TObstacle(2, 2, 150)
obstacles[39] = New TObstacle(3, 3, 150)

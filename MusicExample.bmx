' 1 beat is 2.5 seconds
SuperStrict

Type TSoundRepresentation
	Field soundIdx:Int
	Field timeStart:Float ' in beats
	Field duration:Float ' in beats
	
	Method New(idx:Int, start:Float, duration:Float)
		Self.soundIdx = idx
		Self.timeStart = start
		Self.duration = duration
	End Method
End Type

Global musicExample:TSoundRepresentation[28]
musicExample[0]  = New TSoundRepresentation(0, 0, 1)
musicExample[1]  = New TSoundRepresentation(1, 1, 1)
musicExample[2]  = New TSoundRepresentation(2, 2, 1)
musicExample[3]  = New TSoundRepresentation(3, 3, 1)

musicExample[4]  = New TSoundRepresentation(0, 4, 1)
musicExample[5]  = New TSoundRepresentation(1, 5, 1)
musicExample[6]  = New TSoundRepresentation(2, 6, 1)
musicExample[7]  = New TSoundRepresentation(3, 7, 1)

musicExample[8]  = New TSoundRepresentation(0,  8, 1)
musicExample[9]  = New TSoundRepresentation(1,  9, 1)
musicExample[10] = New TSoundRepresentation(2, 10, 1)
musicExample[11] = New TSoundRepresentation(3, 11, 1)

musicExample[12] = New TSoundRepresentation(0, 12, 0.25)
musicExample[13] = New TSoundRepresentation(1, 12.25, 0.25)
musicExample[14] = New TSoundRepresentation(2, 12.5, 0.25)
musicExample[15] = New TSoundRepresentation(3, 12.75, 0.25)

musicExample[16] = New TSoundRepresentation(0, 13, 0.25)
musicExample[17] = New TSoundRepresentation(1, 13.25, 0.25)
musicExample[18] = New TSoundRepresentation(2, 13.5, 0.25)
musicExample[19] = New TSoundRepresentation(3, 13.75, 0.25)

musicExample[20] = New TSoundRepresentation(1, 14, 0.25)
musicExample[21] = New TSoundRepresentation(0, 14.25, 0.25)
musicExample[22] = New TSoundRepresentation(2, 14.5, 0.25)
musicExample[23] = New TSoundRepresentation(3, 14.75, 0.25)

musicExample[24] = New TSoundRepresentation(2, 15, 0.25)
musicExample[25] = New TSoundRepresentation(1, 15.25, 0.25)
musicExample[26] = New TSoundRepresentation(0, 15.5, 0.25)
musicExample[27] = New TSoundRepresentation(3, 15.75, 0.25)
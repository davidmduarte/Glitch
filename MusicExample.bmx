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

Global musicExample:TSoundRepresentation[12]
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

'musicExample[12] = New TSoundRepresentation(0, 17, 2)
'musicExample[13] = New TSoundRepresentation(1, 19, 2)
'musicExample[14] = New TSoundRepresentation(2, 21, 2)
'musicExample[15] = New TSoundRepresentation(3, 23, 2)

'musicExample[16] = New TSoundRepresentation(0, 25, 2)
'musicExample[17] = New TSoundRepresentation(1, 27, 2)
'musicExample[18] = New TSoundRepresentation(2, 29, 2)
'musicExample[19] = New TSoundRepresentation(3, 31, 2)

'musicExample[20] = New TSoundRepresentation(1, 33, 1)
'musicExample[21] = New TSoundRepresentation(0, 34, 2)
'musicExample[22] = New TSoundRepresentation(2, 36, 3)
'musicExample[23] = New TSoundRepresentation(3, 39, 1)

'musicExample[24] = New TSoundRepresentation(2, 40, 3)
'musicExample[25] = New TSoundRepresentation(1, 43, 1)
'musicExample[26] = New TSoundRepresentation(0, 44, 1)
'musicExample[27] = New TSoundRepresentation(3, 45, 2)
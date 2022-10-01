SuperStrict

Import "Paralax.bmx"

Type TGame
	Field paralax:TParalax
	
	Method New()
		Self.paralax = New TParalax(0, 0)
	End Method
	
	Method render:Int()
		Self.paralax.draw()
		
		Return 3
	End Method
End Type

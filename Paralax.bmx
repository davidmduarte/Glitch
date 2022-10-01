SuperStrict

Type TParalax
	Field images:TImage[]
	Field x:Float[]
	Field y:Int
	Field movX:Float[]
	Field speed:Float
	
	Method New(x:Int, y:Int)
		Self.speed = -4
	
		Self.images = New TImage[3]
		Self.images[0] = LoadImage("assets/paralax_0.png")
		Self.images[1] = LoadImage("assets/paralax_1.png")
		Self.images[2] = LoadImage("assets/paralax_2.png")
		
		Self.x = New Float[3]
		Self.x[0] = x
		Self.x[1] = x
		Self.x[2] = x
		
		Self.y = y
		
		Self.movX = New Float[3]
		Self.movX[0] = Self.speed * 0.25
		Self.movX[1] = Self.speed * 0.5
		Self.movX[2] = Self.speed
	End Method
	
	Method draw()
		For Local i:Int = 0 Until 3
			TileImage(Self.images[i], Self.x[i], Self.y)
			
			Self.x[i] :+ Self.movX[i]
		Next
	End Method
End Type

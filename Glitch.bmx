SuperStrict

Import "Splash.bmx"
Import "Story.bmx"
Import "Menu.bmx"
Import "Game.bmx"

Function ClearScenes()
	splash = Null
	story = Null
	menu = Null
	game = Null
End Function

AppTitle = "LD51 THEME (Every 10 Seconds) - GLITCH"

Graphics(1280,720)

Global splash:TSplash
Global story:TStory
Global menu:TMenu
Global game:TGame

' 0 - splash
' 1 - story
' 2 - menu
' 3 - game
Local status:Int = 0

Repeat
	Cls()
	DrawText("LD51 THEME (Every 10 Seconds) - GLITCH", 10, 10)
	
	Select status
		Case 0
			If splash = Null Then
				ClearScenes()
				splash = New TSplash()
			End If 
			status = splash.render()
		Case 1
			If story = Null Then
				ClearScenes()
				story = New TStory()
			End If 
			status = story.render()
		Case 2
			If menu = Null Then
				ClearScenes()
				menu = New TMenu()
			End If 
			status = menu.render()
		Case 3
			If game = Null Then
				ClearScenes()
				game = New TGame()
			End If 
			status = game.render()
		Case 4 Exit
	End Select
	
	Flip
Until AppTerminate()
#tag Module
Protected Module TBLanguage
	#tag Note, Name = Description
		All constants are of String type.
		They contain the String that is displayed in contextual menus and in the Customize Window.
		
	#tag EndNote

	#tag Note, Name = See Also
		
		[[TBCanvas]] and [[TBButton]] classes.
	#tag EndNote

	#tag Note, Name = Tips
		#ignore in wiki
		
		************Changing an Icon at Runtime:
		You can perform the same to change the Caption property.
		
		Lets say you have a button "Connected" that should change Icon when your App is connected to a database.
		Note: in the end we manually refresh the Toolbar so it displays the new Icon.
		You will need to use this code:
		***
		Toolbar1.GetButton("Connected").Icon = ConnectedIcon
		Toolbar1.Redisplay()
		***
		
		If you need to change both the Icon and the smallIcon, I recommend doing it this way:
		***
		Dim tempTB As TBButton
		tempTB = ToolBar1.GetButton("Connected")
		tempTB.Icon = ConnectedIcon
		tempTB.SmallIcon = ConnectedSmallIcon
		Toolbar1.Redisplay()
	#tag EndNote

	#tag Note, Name = Using the ToolBar
		#Ignore this note in LR
		
		
		************Adding the ToolBar to a Window:
		
		-Drag the Control in the Window Editor
		-In the Open event of the control, you need to create new buttons using:
		me.CreateButton("Button Caption", "Button Name")
		
		Button name and caption are the only mandatory properties needed to create a button.
		
		Add a text Separator using this function:
		me.CreateTextSeperator
		
		
		************ToolBar Events:
		
		-Action(ButtonName As String)
		Fires when the mouse goes Up and the ToolBar/button is enabled
		If there is no button name, the button caption is passed
		
		-DisplayChanged()
		Fires when the buttonStyles have changed which means that the mininum height or width should change.
		
		-HelpTagText(Text As String)
		If the button that has the MouseOver has a helptag, the helptag is passed
		
		-PaintMore(buttonIndex As Integer, g As Graphics, x As integer, y As integer, w As integer, h As integer)
		If you want to paint something more over a button which's index is passed.
		X, Y, W, H are the position and size of the button.
		
		-Refreshed()
		Fires when the the control has refreshed.
		
		
		
		
		************ToolBar Methods:
		
		-Append(bt As TBButton)
		Appends a new TBButton to the ToolBar
		
		-Count As Integer
		Returns the number of Buttons on the ToolBar
		
		-CountVisible As Integer
		Returrns the number of visible Buttons on the ToolBar (TBButton.Visible=True)
		
		-CreateButton(Caption As String, Name As String = "", HelpTag As String = "", Icon As Picture = Nil, SmallIcon As Picture = Nil, Enabled As Boolean = True, Visible As Boolean = True, Menu As MenuItem = Nil)
		Creates a new Button and appends it to the Array of buttons in the ToolBar
		
		-CreateTextSeparator
		Creates a new TextSeparator Button and appends it to the Array of buttons in the ToolBar
		A TextSeparator is a button that has "-" as a caption.
		
		-GetButton(theName As String)
		Gets a handle to the button by using its name.
		If the button isn't found, this method returns Nil.
		
		-Insert(Index As Integer, bt As TBButton)
		Inserts a TBButton at the Index position
		
		-Redraw()
		Manually refresh the Toolbar. Using Toolbar.Refresh also works, but this method isn't DoubleBuffered.
		
		-Remove(Index As Integer)
		Removes the button at Index position from the Toolbar
		
		-Remove(theName As String)
		Looks in the Array of buttons for a button which's name is "theName", and removes that button from the ToolBar
		
		
		************Shared Methods
		-Register(Name As String, ProductKey As String, SerialKey As Integer)
		Please Refer to the "Registering the ToolBar" note
		
		
		************Properties
		-Bold As Boolean
		Sets the captions of the buttons to bold
		
		-Button(-1) As TBButton
		Array of buttons to display on the ToolBar
		
		-ButtonType As Integer
		0: Button
		1: Toggles
		Acts the same as a BevelButton
		
		-DrawFrame As Boolean
		Option to draw a frame in FrameColor around the control
		
		-enableCustomize As Boolean
		If True, the user can rightclick the Toolbar to edit the button size and order
		
		-enableDrag As Boolean
		If True, the user can drag the buttons to change their order
		
		-enableScroll As Boolean
		Not implemented yet
		
		-ForceVertical As Boolean
		If there are very few items in the Toolbar and you are using DisplayType: Small Icons with label, the Toolbar can be wider than high. This results in incorrect display.
		If ForceVertical is true, the Toolbar will be vertical.
		
		-InitialValue As Integer (Write-Only)
		Makes the "InitialValue"th button selected
		(Useful when at the opening of a program, you need to have that button selected)
		
		-Italic As Boolean
		Sets the captions of the buttons to italic
		
		-minHeight As Integer (Read-Only)
		gets the height for which the buttons will be displayed properly and all be displayed in the case of a vertical ToolBar
		
		-minWidth As Integer (Read-Only)
		gets the width for which the buttons will be displayed properly and all be displayed in the case of a horizontal ToolBar
		
		-redrawTime As Double (only in DebugBuild)
		gets the last needed time to refresh the ToolBar (Usually between 2 and 4 ms)
		
		-SelectedColor As Color
		Color used to Highlight the buttons when selected (only in "Toggles" mode)
		
		-TextFont As String
		Font used to draw the caption. Defaults to System
		
		-Underline As Boolean
		Sets the captions of the buttons to underline
		
		
		************Text strings
		
		All strings displayed on the ToolBar are in this module.
		You can set the strings to another language if you want.
		
		
		
	#tag EndNote


	#tag Constant, Name = kVersion, Type = String, Dynamic = False, Default = \"1.7.0", Scope = Private
	#tag EndConstant

	#tag Constant, Name = tbAdd, Type = String, Dynamic = True, Default = \"Add", Scope = Protected
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Add"
	#tag EndConstant

	#tag Constant, Name = tbAvailableTbButtons, Type = String, Dynamic = True, Default = \"", Scope = Protected
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Available toolbar buttons:"
	#tag EndConstant

	#tag Constant, Name = tbBigIcons, Type = String, Dynamic = True, Default = \"", Scope = Protected
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Big Icons"
	#tag EndConstant

	#tag Constant, Name = tbBigIconsLabel, Type = String, Dynamic = True, Default = \"", Scope = Protected
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Big Icons With Label"
	#tag EndConstant

	#tag Constant, Name = tbClose, Type = String, Dynamic = True, Default = \"", Scope = Protected
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Close"
	#tag EndConstant

	#tag Constant, Name = tbCurrentTbButtons, Type = String, Dynamic = True, Default = \"", Scope = Protected
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Current toolbar buttons:"
	#tag EndConstant

	#tag Constant, Name = tbCustomize, Type = String, Dynamic = True, Default = \"", Scope = Protected
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Customize..."
	#tag EndConstant

	#tag Constant, Name = tbLabelsOnly, Type = String, Dynamic = True, Default = \"", Scope = Protected
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Labels Only"
	#tag EndConstant

	#tag Constant, Name = tbMediumIcons, Type = String, Dynamic = True, Default = \"", Scope = Protected
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Medium Icons"
	#tag EndConstant

	#tag Constant, Name = tbMediumIconsLabel, Type = String, Dynamic = True, Default = \"", Scope = Protected
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Medium Icons With Label"
	#tag EndConstant

	#tag Constant, Name = tbMoveDown, Type = String, Dynamic = True, Default = \"", Scope = Protected
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Move Down"
	#tag EndConstant

	#tag Constant, Name = tbMoveUp, Type = String, Dynamic = True, Default = \"", Scope = Protected
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Move Up"
	#tag EndConstant

	#tag Constant, Name = tbNewTextSeparator, Type = String, Dynamic = True, Default = \"", Scope = Protected
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"- New TextSeparator -"
	#tag EndConstant

	#tag Constant, Name = tbRemove, Type = String, Dynamic = True, Default = \"", Scope = Protected
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Remove"
	#tag EndConstant

	#tag Constant, Name = tbResetDefaults, Type = String, Dynamic = True, Default = \"", Scope = Protected
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Reset Defaults"
	#tag EndConstant

	#tag Constant, Name = tbSmallIcons, Type = String, Dynamic = True, Default = \"", Scope = Protected
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Small Icons"
	#tag EndConstant

	#tag Constant, Name = tbSmallIconsLabel, Type = String, Dynamic = True, Default = \"", Scope = Protected
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Small Icons with Label"
	#tag EndConstant

	#tag Constant, Name = tbWindowTitle, Type = String, Dynamic = True, Default = \"", Scope = Protected
		#Tag Instance, Platform = Any, Language = Default, Definition  = \""
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule

#tag Class
Protected Class TBButton
	#tag Method, Flags = &h0, CompatibilityFlags = not TargetHasGUI
		Sub Constructor(Caption As String, Name As String = "", HelpTag As String = "", Icon As Picture = Nil, SmallIcon As Picture = Nil, Enabled As Boolean = True, Visible As Boolean = True, Align As Integer = AlignLeft)
		  //The default constructor for the TBButton.
		  //If the Name is an empty string then the Name takes the value of the Caption.
		  self.Caption = Caption
		  If Name = "" then
		    mName = Caption
		  else
		    mName = Name
		  End If
		  self.Icon = Icon
		  self.SmallIcon = SmallIcon
		  self.Enabled = Enabled
		  self.Visible = Visible
		  self.HelpTag = HelpTag
		  'self.Menu = Menu
		  If Align < 0 or Align > 2 then
		    self.Align = AlignLeft
		  else
		    self.Align = Align
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = TargetHasGUI
		Sub Constructor(Caption As String, Name As String = "", HelpTag As String = "", Icon As Picture = Nil, SmallIcon As Picture = Nil, Enabled As Boolean = True, Visible As Boolean = True, Menu As MenuItem = Nil, Align As Integer = AlignLeft)
		  //The default constructor for the TBButton.
		  //If the Name is an empty string then the Name takes the value of the Caption.
		  self.Caption = Caption
		  If Name = "" then
		    mName = Caption
		  else
		    mName = Name
		  End If
		  self.Icon = Icon
		  self.SmallIcon = SmallIcon
		  self.Enabled = Enabled
		  self.Visible = Visible
		  self.HelpTag = HelpTag
		  self.Menu = Menu
		  If Align < 0 or Align > 2 then
		    self.Align = AlignLeft
		  else
		    self.Align = Align
		  End If
		End Sub
	#tag EndMethod


	#tag Note, Name = Description
		All buttons displayed in the TBCanvas are TBButton.
		This class contains all necessary properties to display the buttons.
		
	#tag EndNote

	#tag Note, Name = See Also
		
		TBCanvas class; TBLanguage Module.
	#tag EndNote


	#tag Property, Flags = &h0
		#tag Note
			Alignment of the Button.
			See Class Constants for the different values.
		#tag EndNote
		Align As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			The Caption is the displayed String on the TBCanvas.
		#tag EndNote
		Caption As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Gets or sets the enabled state of the button.
		#tag EndNote
		Enabled As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			The Height of the Button. This is used to make drawing faster.
		#tag EndNote
		Height As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			The displayed HelpTag when the MouseCursor is over the button.
		#tag EndNote
		HelpTag As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			The 32x32 Icon displayed next to the Caption.
		#tag EndNote
		Icon As Picture
	#tag EndProperty

	#tag Property, Flags = &h0, CompatibilityFlags = not TargetWeb
		#tag Note
			If the Button has multiple actions, then use the Menu.
		#tag EndNote
		Menu As Menuitem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSmallicon As Picture
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			The Name of the Button. This is only used by the code, when pressing the button.
		#tag EndNote
		#tag Getter
			Get
			  return mName
			End Get
		#tag EndGetter
		Name As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  if me.Reference <> nil then
			    return TBCanvas(me.Reference.Value)
			  else
			    return nil
			  end if
			End Get
		#tag EndGetter
		Private Owner As TBCanvas
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Reference As weakRef
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			The 16x16 Icon displayed for small buttons. If the SmallIcon is Nil then the Icon is resized to 16x16.
		#tag EndNote
		#tag Getter
			Get
			  If mSmallicon is nil then
			    If Icon is nil then Return nil
			    Dim p as Picture = New Picture(16,16,32)
			    p.Graphics.DrawPicture Icon, 0, 0, 16, 16, 0,0, 32, 32
			    p.Mask.Graphics.DrawPicture Icon.Mask, 0, 0, 16, 16, 0, 0, 32, 32
			    Return p
			  End If
			  return mSmallicon
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSmallicon = value
			End Set
		#tag EndSetter
		SmallIcon As Picture
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		#tag Note
			Gets or sets the visible state of the button.
		#tag EndNote
		Visible As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			The width of the button. This is used to make drawing faster.
		#tag EndNote
		Width As Integer
	#tag EndProperty


	#tag Constant, Name = AlignCenter, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = AlignLeft, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = AlignRight, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kVersion, Type = Double, Dynamic = False, Default = \"1.2", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
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
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SmallIcon"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Caption"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Icon"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Align"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

#tag DesktopWindow
Begin DesktopWindow LeapDataWindow
   Backdrop        =   0
   BackgroundColor =   ScreenColour
   Composite       =   False
   DefaultLocation =   2
   FullScreen      =   False
   HasBackgroundColor=   True
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   516
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   ""
   MenuBarVisible  =   False
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   "Cooroy Legal Centre Leap Data"
   Type            =   0
   Visible         =   True
   Width           =   792
   Begin DesktopImageViewer ImageViewer1
      Active          =   False
      AllowAutoDeactivate=   True
      AllowTabStop    =   True
      Enabled         =   True
      Height          =   426
      Image           =   1212555263
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   29
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   79
      Transparent     =   False
      Visible         =   True
      Width           =   733
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   Begin TBCanvas TBCanvas1
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Bold            =   False
      Border          =   False
      ButtonType      =   0
      DisplayType     =   0
      DoubleBuffer    =   False
      DrawFrame       =   True
      enableCustomize =   True
      Enabled         =   True
      enableDrag      =   True
      enableScroll    =   False
      ForceVertical   =   False
      Height          =   57
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   -1
      Italic          =   False
      Left            =   29
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      minHeight       =   0
      minWidth        =   0
      redrawTime      =   0.0
      Scope           =   2
      SelectedColor   =   &c3399FF00
      SelectedColor2  =   &c00000000
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Tooltip         =   ""
      Top             =   20
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   733
   End
End
#tag EndDesktopWindow

#tag WindowCode
#tag EndWindowCode

#tag Events TBCanvas1
	#tag Event
		Sub Open()
		  
		  
		  
		  //Defining text to show
		  Me.CreateButton  "Matters", "MattersButton", "Files helptag", matters_icon_1024x1024,matters_icon_1024x1024, True, True
		  Me.createbutton "Clients","ClientsButton",  "",client_icon_1024x1024, client_icon_1024x1024, True, True
		  Me.createbutton "Archives","ArchivesButton", "",Archive_1024x1024, Archive_1024x1024, True, True
		  Me.createbutton "Documents Register", "DocumentsButton", "",Document_icon_1024x1024, Document_icon_1024x1024, True, True
		  Me.createbutton "Quit", "QuitButton", "",Quit_icon_1024x1024, Quit_icon_1024x1024, True, True
		  
		  //Making the first button selected
		  Me.InitialValue=0
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action(ButtonName As String)
		  
		  Select Case buttonName
		  Case "MattersButton"
		    'MessageBox("You selected  Matters")
		    Var mw As New DesktopWindow 
		    mw.Show(MattersWindow)
		  Case "ClientsButton"
		    'MessageBox("You selected  Clients")
		    Var cw As New DesktopWindow 
		    cw.Show(clientWIndow)
		    
		  Case "ArchivesButton"
		    'MessageBox("You selected  Archives")
		    Var am As New DesktopWindow 
		    am.Show(ArchivedMattersWindow)
		    
		  Case "DocumentsButton"
		    'MessageBox("You selected  Documents")
		    Var dw As New DesktopWindow 
		    dw.Show(DocumentsRegisterWindow)
		    
		  Case "QuitButton"
		    'MessageBox("You selected  Documents")
		    Self.close
		    
		  End Select
		End Sub
	#tag EndEvent
	#tag Event
		Function DrawBackground(g As Graphics) As Boolean
		  //This is where you can draw in the background of the control
		  
		  g.ForeColor = Screencolour '&c96EB99
		  g.FillRect(0, 0, g.Width, g.Height)
		  
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
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
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Window Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&cFFFFFF"
		Type="ColorGroup"
		EditorType="ColorGroup"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="DesktopMenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior

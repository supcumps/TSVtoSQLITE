#tag DesktopWindow
Begin DesktopWindow Window1
   Backdrop        =   0
   BackgroundColor =   &cF3F4D600
   Composite       =   False
   DefaultLocation =   2
   FullScreen      =   False
   HasBackgroundColor=   True
   HasCloseButton  =   True
   HasFullScreenButton=   True
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   560
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   3200
   MaximumWidth    =   3200
   MenuBar         =   0
   MenuBarVisible  =   False
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   "CLC Leap Matters"
   Type            =   0
   Visible         =   True
   Width           =   880
   Begin DesktopButton B_Cancel
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   True
      Caption         =   "Cancel"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   780
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   2
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   520
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin DesktopListBox ListMembers
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   True
      AllowFocusRing  =   True
      AllowResizableColumns=   True
      AllowRowDragging=   False
      AllowRowReordering=   True
      Bold            =   False
      ColumnCount     =   12
      ColumnWidths    =   "5%,	7%,	*,7%,*, *,10*	3%,	5%,	5%,	5%,	5%"
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLineStyle   =   0
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   True
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   459
      Index           =   -2147483648
      InitialValue    =   "ID	Matter	Client	Status	Type	Description	Date	State	Staff Resp	Staff Act.	Staff Assist.	Credit\n\n"
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   1
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   52
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   840
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin DesktopButton B_SearchButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Search"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   371
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin DesktopTextField NameField
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      Height          =   22
      Hint            =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   72
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   "Enter full or part name"
      Top             =   20
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   289
   End
   Begin DesktopLabel Label1
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Name:"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   22
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   233
   End
   Begin DesktopButton DeleteRow
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Delete Row"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   633
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   520
      Transparent     =   False
      Underline       =   False
      Visible         =   False
      Width           =   106
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  Var rs As RowSet
		  
		  If dbFile.Exists Then
		    
		    Try
		      db.Connect
		      'db.WriteAheadLogging = True
		      MessageBox("Connected to database.")
		      // populate the lisbox
		      
		      rs = db.SelectSQL("SELECT * FROM Leap")
		      
		      // populate the listbox
		      PopulateListBox(listMembers, rs)
		    Catch error As DatabaseException
		      MessageBox("Connection error: " + error.Message)
		    End Try
		  Else
		    
		    
		    //======================================
		    Var f As  New FolderItem 
		    f = SpecialFolder.Documents.Child("!!CLCArchives").Child("AllMatters.tsv")
		    'f = FolderItem.ShowOpenFileDialog("text/plain")
		    
		    Try 
		      Var fileData As String
		      Var tis As TextInputStream
		      
		      tis = TextInputStream.Open(f)
		      tis.Encoding = Encodings.UTF8
		      fileData = tis.ReadAll
		      tis.Close
		      
		      Var records()As String
		      'Var fields() As String
		      
		      records = fileData.Split(EndOfLine)
		      
		      // the first line contains the header record
		      Var firstLine As String =  records(0)
		      
		      //
		      // remove spaces and periods from firstLine
		      //1.
		      firstLine = firstLine.ReplaceAll( ".", "" )
		      //2.
		      firstLine = firstLine.ReplaceAll( "Matter", "" )
		      //3.
		      firstLine = firstLine.ReplaceAll( " ", "" )
		      //4.  use regex to replace tabs with a ","
		      
		      Var re As New RegEx
		      re.SearchPattern = "\t"
		      re.ReplacementPattern = ","
		      re.Options.ReplaceAllMatches = True
		      firstLine = re.Replace(firstLine)
		      
		      
		      // now create the database and add data to records
		      
		      'Var db As SQLiteDatabase = dbConnect(firstLine)
		      db  = dbConnect(firstLine)
		      
		      addData(db,records(),firstLine)
		      
		      // populate the lisbox
		      
		      'rs = db.SelectSQL("SELECT * FROM Leap")
		      '
		      '// populate the listbox
		      'PopulateListBox(listMembers, rs)
		      
		    Catch error As IOException
		      MessageBox("Error: unable to open the data file.")
		    End Try
		    
		  End If
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub addData(db as SQLiteDatabase, records() as string, firstLine as String)
		  
		  
		  Var re As New RegEx
		  re.SearchPattern = "\t"
		  re.ReplacementPattern = "','"
		  re.Options.ReplaceAllMatches = True
		  
		  
		  Try
		    db.Connect
		    
		  Catch error As DatabaseException
		    // handle error here
		  End Try
		  
		  
		  
		  Var SQL As String = ""
		  Var columns As String = ""
		  
		  For x As Integer = 1 To records.count -1 // number of rows less the header
		    
		    
		    sql = "INSERT INTO Leap ("+ firstline + ") VALUES ("
		    
		    columns = records(x)
		    // remove any addiitonal apostrophe's
		    columns = columns.ReplaceAll("'","")
		    // now parse that toreplace tabs with commas
		    columns = re.Replace(columns)
		    
		    columns = "'"+ columns +"'" /// error --splits dolalr amounts
		    
		    
		    sql = sql + columns + "); " 
		    
		    db.ExecuteSQL(sql )
		    
		  Next
		  /////////
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function dbConnect(firstLine as string) As SQLiteDatabase
		  'Var db As SQLiteDatabase
		  'Var dbFile As FolderItem
		  '
		  'dbFile = New FolderItem("LeapDATA.sqlite")
		  
		  '
		  'db = New SQLiteDatabase
		  'db.DatabaseFile = dbFile
		  
		  Var headings() As String = firstLine.Split(",")
		  
		  
		  Try
		    db.CreateDatabase
		    db.Connect
		    Var SQL As String
		    sql = "CREATE TABLE Leap (ID INTEGER PRIMARY KEY AUTOINCREMENT"
		    For Each rec As String In headings
		      SQL = SQL + "," + rec + " TEXT"
		    Next
		    SQL = SQL +");" 
		    
		    'MessageBox(sql)
		    
		    db.ExecuteSQL(SQL)
		    Return db
		    
		  Catch error As IOException
		    MessageBox("The database could not be created: " + error.Message)
		  Catch error As DatabaseException
		    MessageBox("Database error: " + error.Message)
		  End Try
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PopulateListBox(dataList As DesktopListbox, rs As RowSet)
		  'Sub PopulateListBox(dataList As DesktopListbox, rs As RowSet)
		  
		  If rs Is Nil Then Return
		  
		  // set up listbox state for population
		  dataList.RemoveAllRows
		  
		  // Add the data from the table
		  While Not rs.AfterLastRow
		    dataList.AddRow("")
		    
		    For i As Integer = 0 To rs.LastColumnIndex
		      dataList.CellTextAt(dataList.LastAddedRowIndex, i) = rs.ColumnAt(i).StringValue
		    Next
		    
		    rs.MoveToNextRow
		  Wend
		  'End Sub
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLify(Source As String) As String
		  Var result As String
		  result = ReplaceAll(Source,"'","''")
		  Return result
		End Function
	#tag EndMethod


#tag EndWindowCode

#tag Events B_Cancel
	#tag Event
		Sub Pressed()
		  self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ListMembers
	#tag Event
		Sub DoublePressed()
		  
		  '
		  Var f As  FolderItem
		  'f = FolderItem.ShowSelectFolderDialog 
		  
		  
		  // Check if a row is selected in the Listbox
		  If Me.SelectedRowIndex >= 0 Then
		    'MessageBox(Me.CellTextAt(Me.SelectedRowIndex, 0))
		    Var item As String = Me.CellTextAt(Me.SelectedRowIndex, 1)
		    
		    f  = SpecialFolder.Documents.child("!!CLCArchives").Child(item)
		    If f <> Nil And f.Exists Then
		      f.launch
		    Else
		      MessageBox("Folder not found")
		    End If
		    
		  End If
		  
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events B_SearchButton
	#tag Event
		Sub Pressed()
		  Var rs As rowset
		  
		  
		  Var sql As String = "SELECT * FROM Leap "
		  
		  If NameField.Text <> "" Then   // create the WHERE clause to isolate records matching the search field
		    sql = sql + "WHERE LOWER(NUMBER) LIKE LOWER('%" + SQLify(NameField.Text) + "%') "
		    sql = sql + "OR LOWER(CLIENT) LIKE LOWER('%" + SQLify(NameField.Text) + "%') "
		    
		  Else
		    
		  End If
		  sql = sql + "ORDER BY CLIENT DESC "
		  
		  
		  rs = db.SelectSQL(SQL)
		  If rs <> Nil Then
		    // populate the listbox
		    PopulateListBox(listMembers, rs)
		  Else
		    MessageBox("Unable to populate search box")
		    
		  End If
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DeleteRow
	#tag Event
		Sub Pressed()
		  If ListMembers.SelectedRowIndex >= 0 Then
		    ListMembers.RemoveRowAt( ListMembers.SelectedRowIndex)
		  Else
		    MsgBox("Invalid row index.")
		  End If
		  
		  
		End Sub
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

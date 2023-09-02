#tag Class
Protected Class App
Inherits DesktopApplication
	#tag Event
		Sub Opening()
		  'Var db As New SQLiteDatabase
		  
		  dbFile =SpecialFolder.Documents.Child("LeapData").Child("LeapDATA.sqlite")
		  db = New SQLiteDatabase
		  db.DatabaseFile = dbfile
		  
		  // uncomment to test creation of database
		  'If dbFile.Exists Then
		  'Try
		  'dbfile.Remove
		  'Catch e As DatabaseException
		  'MessageBox("Unable to remove existing database " + e.Message)
		  'End Try
		  '
		  'End If
		  
		  
		  
		  If dbFile.Exists Then
		    
		    Try
		      db.Connect
		      'db.WriteAheadLogging = True
		      'MessageBox("Connected to database from app opening")
		    Catch error As DatabaseException
		      MessageBox("Connection error: " + error.Message)
		    End Try
		  Else
		    //======================================
		    
		    Try
		      db.CreateDatabase    // if successful, creates and opens the databse
		      
		    Catch error As IOException
		      MessageBox("The database file could not be created: " + error.Message)
		    End Try
		    // now add tables to database
		    Try
		      Var f As  New FolderItem 
		      f = SpecialFolder.Documents.Child("LeapData").Child("MatterList.tsv")
		      makeDatabaseTable(f,"Leap")
		      
		      f = SpecialFolder.Documents.Child("LeapData").Child("ClientDetails.tsv")
		      makeDatabaseTable(f,"Client")
		      
		      f = SpecialFolder.Documents.Child("LeapData").Child("DocumentRegister.tsv")
		      makeDatabaseTable(f,"Documents")
		      
		    Catch error As DatabaseException
		      MessageBox("Unable to create table " + error.message)
		    End Try
		    
		    
		    
		  End If
		  
		  
		  Var mw As New DesktopWindow 
		  mw.Show(mattersWIndow)
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function WindowMainWIndow() As Boolean Handles WindowMainWIndow.Action
		  
		  
		  Var w As desktopWindow
		  w = getFrontWindow()
		  w.Restore
		  
		  w.restore
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WindowMinimize() As Boolean Handles WindowMinimize.Action
		  Var w As desktopWindow
		  w = getFrontWindow()
		  w.Minimize
		  Return True
		  
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WindowTileLeft() As Boolean Handles WindowTileLeft.Action
		  // move window to left of screen
		  Var w As desktopWindow
		  
		  w = getFrontWindow()
		  
		  Var myBounds As New Rect 
		  myBounds.Left = 0
		  myBounds.Top = w.top
		  myBounds.Height = w.Height 
		  myBounds.Width = w.Width
		  w.Bounds = myBounds
		  Return True
		  
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WindowTileRight() As Boolean Handles WindowTileRight.Action
		  
		  // move window to Right  of screen
		  Var w As desktopWindow
		  
		  w = getFrontWindow()
		  
		  Var myBounds As New Rect 
		  myBounds.Left = Screen.ScreenAt(0).AvailableWidth - w.Width
		  myBounds.Top = w.top
		  myBounds.Height = w.Height 
		  myBounds.Width = w.Width
		  w.Bounds = myBounds
		  Return True
		  
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WindowZoom() As Boolean Handles WindowZoom.Action
		  
		  Var w As desktopWindow
		  
		  w = getFrontWindow()
		  windowHandle = w.Handle
		  w.Maximize() 
		  Return True
		  
		  
		  
		  
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub addData(db as SQLiteDatabase, records() as string, headings as String, dbTable as String)
		  
		  
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
		  Var parenthesis As String = DecodeHex("22") // hex code for "
		  
		  For x As Integer = 1 To records.count -1 // number of rows excluding  the header
		    
		    ///  db.ExecuteSQL("INSERT INTO team (Name, Coach) VALUES ('Penguins', 'Coach Mike')")
		    sql = "INSERT INTO "+ dbTable  + "("+ headings + ") VALUES ("
		    
		    columns = records(x)
		    // remove any addiitonal apostrophe's
		    columns = columns.ReplaceAll("'","")
		    
		    columns = columns.ReplaceAll(parenthesis ,"")
		    // now parse that to replace tabs with commas using regex
		    columns = re.Replace(columns)
		    
		    columns = "'"+ columns +"'" /// add the single quote for the sql statement
		    
		    
		    
		    sql = sql + columns + "); " 
		    
		    db.ExecuteSQL(sql )
		    //  INSERT INTO Leap(No,Client,Status,Type,Description,InstructionDate,State,StaffResp,StaffAct,StaffAssist,Credit
		    // ) VALUES ('11111','Mr Fred Nerk','Archived','Purchase (QLD)','LEAP training matter','15/08/2017','QLD','PS','PS','PS','PS
		    // '); 
		    
		  Next
		  /////////
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getFrontWindow() As desktopWindow
		  'Public Function getFrontWindow() As Window
		  Var frontmostWindow As desktopWindow
		  For i As Integer = 0 To App.WindowCount
		    Var w As desktopWindow = app.Window(i)
		    If (w <> Nil) And  w.Visible Then
		      frontmostWindow = w
		      Exit
		    End If
		  Next
		  Return frontmostWindow
		  'End Function
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub makeDatabaseTable(f as folderItem, dbTable as String)
		  
		  
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
		    
		    // now get a separate string for the headings
		    Var headings As String = firstLine
		    // replace tabs with ,
		    'Var tab As String = DecodeHex("9") //ascii for horizontal tab
		    'headings = headings.ReplaceAll( tab,",")
		    
		    // now remove tabs from firstline and prepare for SQL
		    Var re As New RegEx
		    re.SearchPattern = "\t"
		    re.ReplacementPattern = " TEXT, "
		    re.Options.ReplaceAllMatches = True
		    firstLine = re.Replace(firstLine)
		    
		    // now get a separate string for the headings
		    re.ReplacementPattern = ", "
		    headings = re.Replace(headings)
		    
		    
		    // now create the database table and add data to records
		    //sql = "CREATE TABLE Team (ID INTEGER NOT NULL, Name TEXT, Coach TEXT, City TEXT, PRIMARY KEY(ID));"
		    Var SQL As String
		    sql = "CREATE TABLE " + dbTable + " (ID INTEGER  NOT NULL,  "
		    sql = SQL + firstLine + " TEXT, PRIMARY KEY(ID));"
		    db.ExecuteSQL(SQL)
		    
		    // now add the data to the table
		    
		    addData(db,records(),headings,dbTable) 
		    'MessageBox("Data added to table.")
		    
		    
		    
		  Catch error As IOException
		    MessageBox("Error: unable to open the data file.")
		  End Try
		  
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Improved code
		The code first checks if the database file exists. If it does, the code tries to connect to the database and displays a message if the connection is successful. If the database file does not exist, the code opens the data file and reads the data into an array of strings. The first line of the data file contains the header record, which is used to create the database schema. The remaining lines of the data file contain the data records, which are added to the database. The code then populates a listbox with the data from the database.
		
		Here is a step-by-step explanation of the code:
		
		The code creates a new SQLiteDatabase object and sets the database file to the file LeapDATA.sqlite.
		The code checks if the database file exists. If it does, the code tries to connect to the database.
		If the connection to the database is successful, the code displays a message.
		If the database file does not exist, the code opens the data file AllMatters.tsv.
		The code reads the data from the data file into an array of strings.
		The first line of the data file contains the header record. The code uses this record to create the database schema.
		The remaining lines of the data file contain the data records. The code adds these records to the database.
		The code populates a listbox with the data from the database.
		The overall purpose of the code is to create a database and populate it with data from a data file. The code does this by first checking if the database file exists. If it does, the code tries to connect to the database. If the database file does not exist, the code opens the data file and reads the data into an array of strings. The first line of the data file contains the header record, which is used to create the database schema. The remaining lines of the data file contain the data records, which are added to the database. The code then populates a listbox with the data from the database.
		
		
		
		
		Yes, the code could be improved in a few ways. Here are a few suggestions:
		
		The code could be more modularized. The code could be divided into separate functions for each task, such as checking if the database file exists, opening the data file, reading the data from the data file, creating the database schema, adding the data records to the database, and populating the listbox. This would make the code easier to read and understand, and it would also make it easier to maintain and update the code.
		The code could be more error-proof. The code could be checked for potential errors, such as trying to open a data file that does not exist. The code could also be checked for potential security vulnerabilities, such as allowing users to input malicious data into the database.
		The code could be more efficient. The code could be optimized to run faster. This could be done by using more efficient algorithms, or by avoiding unnecessary operations.
		Here is an example of how the code could be improved:
		
		// Create a function to check if the database file exists.
		Function FileExists(fileName As String) As Boolean
		  If File.Exists(fileName) Then
		    Return True
		  Else
		    Return False
		  End If
		End Function
		
		// Create a function to open the data file and read the data into an array of strings.
		Function ReadDataFile(fileName As String) As String()
		  Dim data() As String
		  Dim file As TextInputStream
		
		  file = TextInputStream.Open(fileName)
		  data = file.ReadAll.Split(EndOfLine)
		  file.Close
		
		  Return data
		End Function
		
		// Create a function to create the database schema.
		Function CreateDatabaseSchema(db As SQLiteDatabase, header As String) As Boolean
		  Dim fields() As String
		  fields = header.Split(",")
		
		  For Each field As String In fields
		    db.CreateTable("Leap", field)
		  Next
		
		  Return True
		End Function
		
		// Create a function to add the data records to the database.
		Function AddDataRecords(db As SQLiteDatabase, records() As String, header As String) As Boolean
		  Dim i As Integer
		
		  For i = 1 To records.Length - 1
		    db.Insert("Leap", records(i), header)
		  Next
		
		  Return True
		End Function
		
		// Create a function to populate the listbox.
		Function PopulateListBox(db As SQLiteDatabase, listBox As ListBox) As Boolean
		  Dim rs As RowSet
		  rs = db.SelectSQL("SELECT * FROM Leap")
		
		  For Each row As Row In rs
		    listBox.AddItem(row.Field("Matter"))
		  Next
		
		  Return True
		End Function
		
		// Main function
		If FileExists("LeapDATA.sqlite") Then
		  db.Connect
		Else
		  records = ReadDataFile("AllMatters.tsv")
		  header = records(0)
		  db = CreateDatabaseSchema(db, header)
		  AddDataRecords(db, records, header)
		  PopulateListBox(db, listBox)
		End If
	#tag EndNote


	#tag Property, Flags = &h0
		windowHandle As Ptr
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoQuit"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowHiDPI"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BugVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Copyright"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastWindowIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MajorVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinorVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NonReleaseVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RegionCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StageCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Version"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_CurrentEventTime"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

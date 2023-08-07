#tag Class
Protected Class App
Inherits DesktopApplication
	#tag Event
		Sub Opening()
		  'Var db As New SQLiteDatabase
		  
		  dbFile =SpecialFolder.Documents.Child("!!CLCArchives").Child("LeapDATA.sqlite")
		  If dbFile.Exists Then
		    db = New SQLiteDatabase
		    db.DatabaseFile = dbfile
		    Try
		      db.Connect
		      'db.WriteAheadLogging = True
		      MessageBox("Connected to database.")
		      
		    Catch error As DatabaseException
		      MessageBox("Connection error: " + error.Message)
		    End Try
		  Else
		    //======================================
		    Var f As  New FolderItem 
		    f = SpecialFolder.Documents.Child("!!CLCArchives").Child("AllMatters.tsv")
		    'f = FolderItem.ShowOpenFileDialog("text/plain")
		    Try 
		      db = New SQLiteDatabase
		      db.DatabaseFile = dbfile
		      
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
		      
		      'message
		      
		      // now create the database and add data to records
		      
		      'Var db As SQLiteDatabase = dbConnect(firstLine)
		      db  = dbConnect(firstLine )
		      
		      addData(db,records(),firstLine)
		      
		      // populate the lisbox
		      Var rs As RowSet
		      rs = db.SelectSQL("SELECT * FROM Leap")
		      
		      // populate the listbox
		      'PopulateListBox(listMembers, rs)
		      
		    Catch error As IOException
		      MessageBox("Error: unable to open the data file.")
		    End Try
		    
		    
		  End If
		  
		  
		  'If dbFile.Exists Then
		  'dbfile.Remove
		  'End If
		  
		  
		  
		  Var w As New DesktopWindow 
		  w.Show(WIndow1)
		  
		  
		  
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
		  
		  'dbFile = New FolderItem("LeapDATA.sqlite")
		  
		  
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

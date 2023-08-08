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
		  'dbfile.Remove
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
		    Var f As  New FolderItem 
		    f = SpecialFolder.Documents.Child("!!CLCArchives").Child("AllMatters.tsv")
		    'f = FolderItem.ShowOpenFileDialog("text/plain")
		    Try 
		      'db = New SQLiteDatabase
		      'db.DatabaseFile = dbfile
		      
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
		      'MessageBox("Database created.")
		      addData(db,records(),firstLine)
		      'MessageBox("Data added to table.")
		      // populate the lisbox
		      Var rs As RowSet
		      rs = db.SelectSQL("SELECT * FROM Leap")
		      
		      
		    Catch error As IOException
		      MessageBox("Error: unable to open the data file.")
		    End Try
		    
		    
		  End If
		  
		  
		  
		  
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
		  
		  For x As Integer = 1 To records.count -1 // number of rows excluding  the header
		    
		    
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

	#tag Method, Flags = &h0
		Function FileExists(fileName As String) As Boolean
		  'Function FileExists(fileName As String) As Boolean
		  'If File.Exists(fileName) Then
		  'Return True
		  'Else
		  'Return False
		  'End If
		  'End Function
		End Function
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

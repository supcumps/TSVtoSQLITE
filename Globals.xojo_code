#tag Module
Protected Module Globals
	#tag Method, Flags = &h0
		Function SQLify(Source As String) As String
		  Var result As String
		  result = ReplaceAll(Source,"'","''")
		  Return result
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		appDebug As boolean = FALSE
	#tag EndProperty

	#tag Property, Flags = &h0
		ClientName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		currentRow As RowSet
	#tag EndProperty

	#tag Property, Flags = &h0
		db As SQLiteDatabase
	#tag EndProperty

	#tag Property, Flags = &h0
		dbFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		listBoxHeader As String
	#tag EndProperty

	#tag Property, Flags = &h0
		newRow As Boolean
	#tag EndProperty


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
			Name="listBoxHeader"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="newRow"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="appDebug"
			Visible=false
			Group="Behavior"
			InitialValue="FALSE"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule

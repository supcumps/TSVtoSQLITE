#tag DesktopWindow
Begin DesktopWindow MattersWindow
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
   Width           =   1040
   Begin DesktopButton B_Quit
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   True
      Caption         =   "Quit"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   794
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   2
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   520
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   82
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
      ColumnCount     =   6
      ColumnWidths    =   "10%,10%,*,15%, 15%"
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
      InitialValue    =   "ID	Matter	Client	Status	Type	Date\n\n"
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   52
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   578
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin DesktopButton B_DeleteRow
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Delete Row"
      Default         =   False
      Enabled         =   False
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   549
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   520
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   106
   End
   Begin DesktopButton B_AddRow
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Add New"
      Default         =   False
      Enabled         =   False
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   424
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   520
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   106
   End
   Begin DesktopButton B_Save
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Save"
      Default         =   False
      Enabled         =   False
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   678
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   520
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin DesktopCanvas Canvas1
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   False
      Height          =   459
      Index           =   -2147483648
      Left            =   610
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   52
      Transparent     =   True
      Visible         =   True
      Width           =   422
      Begin DesktopTextField Credit
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
         InitialParent   =   "Canvas1"
         Italic          =   False
         Left            =   758
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   416
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   256
      End
      Begin DesktopLabel L_Credit
         AllowAutoDeactivate=   True
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "Canvas1"
         Italic          =   False
         Left            =   683
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Credit"
         TextAlignment   =   3
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   418
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   50
      End
      Begin DesktopTextField staffAssisting
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
         InitialParent   =   "Canvas1"
         Italic          =   False
         Left            =   758
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   383
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   256
      End
      Begin DesktopLabel L_staffAssisting
         AllowAutoDeactivate=   True
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "Canvas1"
         Italic          =   False
         Left            =   630
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Staff Assisting"
         TextAlignment   =   3
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   385
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   103
      End
      Begin DesktopTextField staffActing
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
         InitialParent   =   "Canvas1"
         Italic          =   False
         Left            =   758
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   350
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   256
      End
      Begin DesktopLabel L_staffActing
         AllowAutoDeactivate=   True
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "Canvas1"
         Italic          =   False
         Left            =   649
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Staff Acting"
         TextAlignment   =   3
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   352
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   84
      End
      Begin DesktopTextField staffResponsible
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
         InitialParent   =   "Canvas1"
         Italic          =   False
         Left            =   758
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   317
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   256
      End
      Begin DesktopLabel L_RESPONSIBLE
         AllowAutoDeactivate=   True
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "Canvas1"
         Italic          =   False
         Left            =   621
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   7
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Staff Responsible"
         TextAlignment   =   3
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   319
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   112
      End
      Begin DesktopTextField State
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
         InitialParent   =   "Canvas1"
         Italic          =   False
         Left            =   758
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   8
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   284
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   256
      End
      Begin DesktopLabel L_State
         AllowAutoDeactivate=   True
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "Canvas1"
         Italic          =   False
         Left            =   683
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   9
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "State"
         TextAlignment   =   3
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   286
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   50
      End
      Begin DesktopTextField dateField
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
         InitialParent   =   "Canvas1"
         Italic          =   False
         Left            =   758
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   10
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   251
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   256
      End
      Begin DesktopLabel L_dateField
         AllowAutoDeactivate=   True
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "Canvas1"
         Italic          =   False
         Left            =   630
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   11
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Instruction Date"
         TextAlignment   =   3
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   253
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   103
      End
      Begin DesktopTextField Description
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
         InitialParent   =   "Canvas1"
         Italic          =   False
         Left            =   758
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   12
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   218
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   256
      End
      Begin DesktopLabel L_Description
         AllowAutoDeactivate=   True
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "Canvas1"
         Italic          =   False
         Left            =   649
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   13
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Description"
         TextAlignment   =   3
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   220
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   84
      End
      Begin DesktopTextField matterType
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
         InitialParent   =   "Canvas1"
         Italic          =   False
         Left            =   758
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   14
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   185
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   256
      End
      Begin DesktopLabel L_matterType
         AllowAutoDeactivate=   True
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "Canvas1"
         Italic          =   False
         Left            =   649
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   15
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Matter Type"
         TextAlignment   =   3
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   187
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   84
      End
      Begin DesktopTextField Status
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
         InitialParent   =   "Canvas1"
         Italic          =   False
         Left            =   758
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   16
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   151
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   256
      End
      Begin DesktopLabel L_Status
         AllowAutoDeactivate=   True
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "Canvas1"
         Italic          =   False
         Left            =   661
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   17
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Status"
         TextAlignment   =   3
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   153
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   72
      End
      Begin DesktopTextField clientName
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
         InitialParent   =   "Canvas1"
         Italic          =   False
         Left            =   758
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   18
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   117
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   256
      End
      Begin DesktopLabel L_clientName
         AllowAutoDeactivate=   True
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "Canvas1"
         Italic          =   False
         Left            =   630
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   19
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Client Name"
         TextAlignment   =   3
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   117
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   103
      End
      Begin DesktopTextField matterNumber
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
         InitialParent   =   "Canvas1"
         Italic          =   False
         Left            =   758
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   20
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   83
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   256
      End
      Begin DesktopLabel L_matterNumber
         AllowAutoDeactivate=   True
         Bold            =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "Canvas1"
         Italic          =   False
         Left            =   630
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   21
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Matter Number"
         TextAlignment   =   3
         TextColor       =   &c000000
         Tooltip         =   ""
         Top             =   83
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   116
      End
   End
   Begin DesktopLabel L_TotalMatters
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   72
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Total Matters:"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   520
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   223
   End
   Begin DesktopButton ClientButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Client Details"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   629
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   22
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   129
   End
   Begin DesktopSearchField SearchClients
      Active          =   False
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowRecentItems=   False
      AllowTabStop    =   True
      ClearMenuItemValue=   "Clear"
      Enabled         =   True
      Height          =   22
      Hint            =   "Search on Matter Nº, Client, Status, Type "
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumRecentItems=   -1
      PanelIndex      =   0
      RecentItemsValue=   "Recent Searches"
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      Text            =   ""
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Visible         =   True
      Width           =   423
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Closing()
		  
		  
		  
		  If appDebug then
		    db.RollbackTransaction
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  
		  appDebug = False
		  
		  If appDebug Then
		    db.BeginTransaction
		  End If
		  
		  
		  
		  Var rs As RowSet
		  
		  If dbFile.Exists Then
		    Try
		      rs = db.SelectSQL("SELECT * FROM Leap")
		      
		      // populate the listbox
		      Var columns As RowSet = db.TableColumns("Leap")
		      Var columNames As String = ""
		      
		      // if you want all column headings, uncomment the following lines 
		      'For Each row As DatabaseRow In columns
		      'columNames  = columNames +  row.Column("ColumnName").StringValue +  Chr(9)
		      'Next
		      'listMembers.HeaderAt(listMembers.AllColumns) = columNames
		      
		      PopulateListBox(listMembers, rs)
		      
		    Catch error As DatabaseException
		      MessageBox("Connection error: " + error.Message)
		    End Try
		    
		  End If 
		  
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub activateCanvasAndButtons(value as BOOLEAN)
		  If value = True Then
		    canvas1.Enabled = True
		    B_AddRow.Enabled = TRUE
		    B_DeleteRow.Enabled = TRUE
		    B_Save.Enabled = TRUE
		    'B_EditRow.Enabled = True
		  Else
		    canvas1.Enabled = FALSE
		    B_AddRow.Enabled = FALSE
		    B_DeleteRow.Enabled = FALSE
		    B_Save.Enabled = FALSE
		    'B_EditRow.Enabled = FALSE
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub clearEntryFields()
		  If Trim(matterNumber.Text) <>"" Then
		    B_Save.Press 
		    matterNumber.Text = "" 
		    clientName.Text = ""
		    State.Text = "" 
		    Status.Text = ""
		    matterType.Text = ""
		    Credit.Text = "" 
		    dateField.Text = ""  
		    Description.Text = "" 
		    staffActing.Text = "" 
		    staffAssisting.Text = "" 
		    staffResponsible.Text = "" 
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub populateClientData(CurrentRow as rowset)
		  If listMembers.SelectedRowCount = 1 Then
		    
		    activateCanvasAndButtons(True)
		    
		    Try
		      
		      Var ID As String = listMembers.RowTagAt(listMembers.SelectedRowIndex)
		      CurrentRow = db.SelectSQL("SELECT * FROM Leap WHERE ID = ?", ID) 
		      
		      matterNumber.Text = CurrentRow.Column("No").StringValue
		      clientName.Text = CurrentRow.Column("Client").StringValue
		      State.Text = CurrentRow.Column("State").StringValue
		      Status.Text = CurrentRow.Column("Status").StringValue
		      matterType.Text = CurrentRow.Column("Type").StringValue
		      Credit.Text = CurrentRow.Column("Credit").StringValue
		      dateField.Text =  CurrentRow.Column("InstructionDate").StringValue
		      Description.Text = CurrentRow.Column("Description").StringValue
		      staffActing.Text = CurrentRow.Column("StaffAct").StringValue
		      staffAssisting.Text = CurrentRow.Column("StaffAssist").StringValue
		      staffResponsible.Text = CurrentRow.Column("StaffResp").StringValue
		      
		    Catch error As DatabaseException
		      MessageBox ("The matter details could not be loaded due to an error.")
		    End Try
		  Else
		    activateCanvasAndButtons(False)
		    clearEntryFields()
		    currentRow = Nil // no row selected
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PopulateListBox(dataList As DesktopListbox, rowsFound As RowSet)
		  'Sub PopulateListBox(dataList As DesktopListbox, rs As RowSet)
		  
		  If rowsFound Is Nil Then Return
		  
		  // set up listbox state for population
		  dataList.RemoveAllRows
		  
		  
		  For Each row As DatabaseRow In rowsFound
		    ListMembers.AddRow(row.Column("ID").StringValue,_
		    row.Column("No").StringValue, _
		    row.Column("Client").Stringvalue,_
		    row.Column("Status").Stringvalue,_
		    row.Column("Type").Stringvalue,_
		    row.Column("InstructionDate").Stringvalue)
		    'row.Column("Description").Stringvalue,_
		    'row.Column("State").Stringvalue,_
		    'row.Column("StaffResp").Stringvalue,_
		    'row.Column("StaffAct").Stringvalue,_
		    'row.Column("StaffAssist").Stringvalue,_
		    'row.Column("Credit").Stringvalue)
		    
		    ListMembers.RowTagAt(ListMembers.LastAddedRowIndex)=row.Column("ID").StringValue
		  Next
		  L_TotalMatters.Text = ("Total matters = " +  ListMembers.RowCount.ToString)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub resetSearch()
		  Var rs As rowset
		  
		  
		  Var sql As String = "SELECT * FROM Leap "
		  
		  If SearchClients.Text <> "" Then   // create the WHERE clause to isolate records matching the search field
		    sql = sql + "WHERE LOWER(No) LIKE LOWER('%" + SQLify(SearchClients.Text) + "%') "
		    sql = sql + "OR LOWER(CLIENT) LIKE LOWER('%" + SQLify(SearchClients.Text) + "%') "
		    sql = sql + "OR LOWER(Type) LIKE LOWER('%" + SQLify(SearchClients.Text) + "%') "
		    sql = sql + "OR LOWER(Status) LIKE LOWER('%" + SQLify(SearchClients.Text) + "%') "
		    
		    
		  Else
		    
		  End If
		  sql = sql + "ORDER BY CLIENT ASC "  // client displayed with increasing alphabet order
		  
		  
		  
		  Try
		    rs = db.SelectSQL(SQL)
		    // populate the listbox - pass name of lisbox and recordset to use
		    PopulateListBox(listMembers, rs)
		  Catch error As DatabaseException
		    System.Beep
		    MessageBox("Unable to complete the search and populate the list box")
		  End Try
		  
		  // clear the data entry fields
		  clearEntryFields()
		  
		  
		  ////////
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Improved code for window openeing event
		change listbox to add relevent info
		decrease size of client info to make room
		Add button and menu item to see listbox with client details
		
		
	#tag EndNote


	#tag Property, Flags = &h0
		currentRow As RowSet
	#tag EndProperty


#tag EndWindowCode

#tag Events B_Quit
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
		    Var item As String = Me.CellTextAt(Me.SelectedRowIndex, 1) // the number of the matter
		    Var name As String = Me.CellTextAt(Me.SelectedRowIndex, 2)
		    'name = name.ReplaceAll( " ", "," )
		    'item = item + "_" + name.LastField(",")
		    
		    //========================
		    // need to be able to find the file by its number only
		    //========================
		    
		    f  = SpecialFolder.Documents.child("LeapData").Child(item)
		    
		    If f <> Nil And f.Exists Then
		      'messagebox("Locating " + name)
		      f.launch
		    Else
		      MessageBox(f.NativePath + " Folder not found")
		      f = FolderItem.ShowSelectFolderDialog 
		    End If
		    
		  End If
		  
		  
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged()
		  'If Me.SelectedRowCount = 1 Then
		  '
		  'activateCanvasAndButtons(True)
		  '
		  'Try
		  '
		  'Var ID As String = Me.RowTagAt(Me.SelectedRowIndex)
		  'CurrentRow = db.SelectSQL("SELECT * FROM Leap WHERE ID = ?", ID) 
		  '
		  'matterNumber.Text = CurrentRow.Column("No").StringValue
		  'clientName.Text = CurrentRow.Column("Client").StringValue
		  'State.Text = CurrentRow.Column("State").StringValue
		  'Status.Text = CurrentRow.Column("Status").StringValue
		  'matterType.Text = CurrentRow.Column("Type").StringValue
		  'Credit.Text = CurrentRow.Column("Credit").StringValue
		  'dateField.Text =  CurrentRow.Column("InstructionDate").StringValue
		  'Description.Text = CurrentRow.Column("Description").StringValue
		  'staffActing.Text = CurrentRow.Column("StaffAct").StringValue
		  'staffAssisting.Text = CurrentRow.Column("StaffAssist").StringValue
		  'staffResponsible.Text = CurrentRow.Column("StaffResp").StringValue
		  '
		  'Catch error As DatabaseException
		  'MessageBox ("The matter details could not be loaded due to an error.")
		  'End Try
		  'Else
		  'activateCanvasAndButtons(False)
		  'clearEntryFields()
		  'currentRow = Nil // no row selected
		  'End If
		  
		  
		  Var ID As String = Me.RowTagAt(Me.SelectedRowIndex)
		  CurrentRow = db.SelectSQL("SELECT * FROM Leap WHERE ID = ?", ID) 
		  populateClientData(CurrentRow)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events B_DeleteRow
	#tag Event
		Sub Pressed()
		  If MattersWindow.ListMembers. SelectedRowCount = 1 Then
		    
		    Try
		      CurrentRow.RemoveRow
		    Catch error As DatabaseException
		      MessageBox ("The Matter record was not deleted due to an error.")
		    End Try
		    
		  End If
		  
		  'resetSearch()
		  
		  // need to remove the folferitem as well/???
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events B_AddRow
	#tag Event
		Sub Pressed()
		  newRow = True
		  clearEntryFields()
		  ListMembers.SelectedRowIndex = -1 // deselct any prior selected row
		  currentRow = Nil // clear global entry
		  
		  B_Save.SetFocus
		  
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events B_Save
	#tag Event
		Sub Pressed()
		  Try
		    If newRow Then
		      Var row As New DatabaseRow
		      
		      row.Column("No").StringValue = matterNumber.Text 
		      row.Column("Client").StringValue = clientName.Text
		      row.Column("State").StringValue = State.Text 
		      row.Column("Status").StringValue = Status.Text
		      row.Column("Type").StringValue = matterType.Text
		      row.Column("Credit").StringValue = Credit.Text
		      row.Column("InstructionDate").StringValue = dateField.Text  
		      row.Column("Description").StringValue = Description.Text 
		      row.Column("StaffAct").StringValue = staffActing.Text 
		      row.Column("StaffAssist").StringValue = staffAssisting.Text 
		      row.Column("StaffResp").StringValue = staffResponsible.Text 
		      db.AddRow("Leap", row)
		      newRow = False
		    Else
		      
		      currentRow.EditRow
		      
		      CurrentRow.Column("No").StringValue = matterNumber.Text 
		      CurrentRow.Column("Client").StringValue = clientName.Text
		      CurrentRow.Column("State").StringValue = State.Text 
		      CurrentRow.Column("Status").StringValue = Status.Text
		      CurrentRow.Column("Type").StringValue = matterType.Text
		      CurrentRow.Column("Credit").StringValue = Credit.Text
		      CurrentRow.Column("InstructionDate").StringValue = dateField.Text  
		      CurrentRow.Column("Description").StringValue = Description.Text 
		      CurrentRow.Column("StaffAct").StringValue = staffActing.Text 
		      CurrentRow.Column("StaffAssist").StringValue = staffAssisting.Text 
		      CurrentRow.Column("StaffResp").StringValue = staffResponsible.Text 
		      
		      currentRow.SaveRow
		    End If
		  Catch error As DatabaseException
		    MessageBox ("The matter details could not be saved due to an error.")
		  End Try
		  
		  resetSearch()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ClientButton
	#tag Event
		Sub Pressed()
		  
		  Var cw As New DesktopWindow 
		  cw.Show(clientWIndow)
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SearchClients
	#tag Event
		Sub TextChanged()
		  ListMembers.RemoveAllRows
		  
		  Var rs As rowset
		  
		  Var sql As String = "SELECT * FROM Leap "
		  
		  If SearchClients.Text <> "" Then   // create the WHERE clause to isolate records matching the search field
		    sql = sql + "WHERE LOWER(No) LIKE LOWER('%" + SQLify(SearchClients.Text) + "%') "
		    sql = sql + "OR LOWER(CLIENT) LIKE LOWER('%" + SQLify(SearchClients.Text) + "%') "
		    sql = sql + "OR LOWER(Type) LIKE LOWER('%" + SQLify(SearchClients.Text) + "%') "
		    sql = sql + "OR LOWER(Status) LIKE LOWER('%" + SQLify(SearchClients.Text) + "%') "
		    
		  Else
		    
		  End If
		  sql = sql + " ORDER BY Client ASC "  // client displayed with increasing alphabet order
		  
		  Try
		    rs = db.SelectSQL(SQL)
		    // populate the listbox - pass name of lisbox and recordset to use
		    PopulateListBox(listMembers, rs)
		  Catch error As DatabaseException
		    System.Beep
		    MessageBox("Unable to complete the search and populate the list box")
		  End Try
		  
		  // clear the data entry fields
		  clearEntryFields()
		  
		  
		  
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

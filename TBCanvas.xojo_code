#tag Class
Protected Class TBCanvas
Inherits Canvas
	#tag CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit))
	#tag Event
		Sub Close()
		  
		  RaiseEvent Close()
		End Sub
	#tag EndEvent

	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  #Pragma Unused x
		  #Pragma Unused y
		  
		  If not enableCustomize then Return True
		  
		  'base.Append(new MenuItem("Big Icons with Labels"))
		  'base.Append(new MenuItem("Medium Icons with Labels"))
		  'base.Append(new MenuItem("Small Icons with Labels"))
		  'base.Append(new MenuItem("Big Icons"))
		  'base.Append(new MenuItem("Medium Icons"))
		  'base.Append(new MenuItem("Small Icons"))
		  'base.Append(new MenuItem("Labels Only"))
		  'base.Append(new MenuItem(MenuItem.TextSeparator))
		  'base.Append(new MenuItem("Customize..."))
		  '
		  'base.Item(DisplayType).Checked=True
		  
		  For i as Integer = 0 to RightClickMenu.Count-1
		    base.Append RightClickMenu.Item(i).Clone
		  Next
		  
		  Return False
		  
		  
		End Function
	#tag EndEvent

	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  Select Case hitItem.Tag
		  Case "BigIconsLabel"
		    DisplayType = TypeBigIconsLabel
		    
		  Case "MediumIconsLabel"
		    DisplayType = TypeMediumIconsLabel
		    
		  Case "SmallIconsLabel"
		    DisplayType = TypeSmallIconsLabel
		    
		  Case "BigIcons"
		    DisplayType = TypeBigIcons
		    
		  Case "MediumIcons"
		    DisplayType = TypeMediumIcons
		    
		  Case "SmallIcons"
		    DisplayType = TypeSmallIcons
		    
		  Case "Labels"
		    DisplayType = TypeLabelsOnly
		    
		  Case "Customize"
		    'Reference = new WeakRef(self)
		    'TBWindow.ShowModal
		  End Select
		  
		  
		  For i as Integer = 0 to RightClickMenu.Count-1
		    RightClickMenu.Item(i).Checked = False
		  Next
		  If RightClickMenu.Count > DisplayType+1 then
		    RightClickMenu.Item(DisplayType).Checked=True
		  End If
		  
		  Redisplay()
		  
		  Return True
		  
		  'Select case hitItem.Text
		  'Case "Big Icons with Labels"
		  'DisplayType = TypeBigIconsLabel
		  'Case "Medium Icons with Labels"
		  'DisplayType = TypeMediumIconsLabel
		  'Case "Small Icons with Labels"
		  'DisplayType = TypeSmallIconsLabel
		  'Case "Big Icons"
		  'DisplayType = TypeBigIcons
		  'Case "Medium Icons"
		  'DisplayType = TypeMediumIcons
		  'Case "Small Icons"
		  'DisplayType = TypeSmallIcons
		  'Case "Labels Only"
		  'DisplayType = TypeLabelsOnly
		  'Case "Customize..."
		  'Reference = new WeakRef(self)
		  'TBWindow.ShowModal
		  'End Select
		  '
		  'Refresh(False)
		End Function
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If AcceptTabs and key=chr(9) then
		    if Keyboard.AsyncShiftKey then
		      key=chr(30)
		    Else
		      key=chr(31)
		    end if
		  End If
		  
		  Select Case Asc(key)
		  Case 28, 30
		    If isSelected>0 then _
		    isSelected = isSelected - 1
		  Case 29, 31
		    If isSelected < UBound(Button) then _
		    isSelected = isSelected + 1
		  End Select
		  
		  
		  Dim x, y As Integer
		  
		  FindXYforBtn(isSelected, X, Y)
		  handleMouseUp(X, Y)
		  
		  'If Button(isSelected).enabled then
		  'Action(isSelected)
		  'End If
		  
		  Refresh(False)
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  If MouseDown(X, Y) then
		    Return True
		  End If
		  
		  If IsContextualClick then Return False
		  
		  X_Down=X
		  Y_Down=Y
		  
		  If enabled then
		    isSelected=FindBtnAtXY(X, Y)
		    LastMouseDown = val(str(isSelected))
		    'isMouseOver = -1
		    If enableDrag then 
		      FindXYforBtn(isSelected, leftDrag, topDrag)
		      noDrag=False
		    End If
		  End If
		  If AcceptFocus then SetFocus
		  Refresh(False)
		  DownTime=ticks
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  //Checking if the mouse was really dragged
		  
		  
		  
		  If X=X_Down and Y=Y_Down or not enabled then Return
		  'If (isDragged < 0 ) then Return '(isDragged < 0 and isSelected<0)
		  
		  If DownTime>0 and enableDrag then
		    If DownTime+30>ticks then 
		      noDrag=False
		    Else
		      noDrag=True
		    End If
		    DownTime=0
		  End If
		  
		  If not enableDrag or noDrag then
		    
		    If enabled then
		      Dim lastMouseSelected as integer =isSelected
		      Dim over as Integer = FindBtnAtXY(X, Y)
		      
		      If LastMouseDown <> over then
		        isSelected = -1
		        isMouseOver = -1
		      Elseif isSelected = -1 Then
		        isSelected = LastMouseDown
		        isMouseOver = Over
		      End If
		      If lastMouseSelected<>isSelected then
		        Refresh(False)
		      End If
		    End If
		    
		  Else
		    
		    If isSelected>-1 then
		      isDragged = isSelected
		      isSelected=-1
		      isMouseOver=-1
		    End If
		    
		    Dim x_mov, y_mov as Integer
		    Dim movIndex As Integer
		    Dim prevBtn, nextBtn As Integer = isDragged
		    Dim Xprev, Yprev, Xnext, Ynext As Integer
		    
		    For i as Integer = isDragged+1 to UBound(Button)
		      If not Button(i).Visible then Continue for
		      nextBtn = i
		      Exit
		    Next
		    
		    For i as Integer = isDragged-1 DownTo 0
		      If not Button(i).Visible then Continue for
		      prevBtn = i
		      Exit
		    Next
		    
		    x_mov=X-X_Down
		    y_mov=Y-Y_Down
		    
		    X_Down=X
		    Y_Down=Y
		    
		    
		    If IsVertical then
		      topDrag = topDrag + y_mov
		    Else
		      leftDrag = leftDrag + x_mov
		    End If
		    
		    
		    FindXYforBtn(nextBtn, Xnext, Ynext)
		    FindXYforBtn(prevBtn, Xprev, Yprev)
		    
		    If IsVertical then
		      If isDragged>0 and topDrag<Yprev + Button(prevBtn).Height/2 then
		        movIndex=-1
		      Elseif isDragged>-1 and isDragged<Ubound(Button) and topDrag + Button(isDragged).Height>Ynext + Button(nextBtn).Height/2 then
		        movIndex=1
		      End If
		    else
		      If isDragged>0 and leftDrag<Xprev + Button(prevBtn).Width/2 then 
		        movIndex=-1
		      Elseif isDragged>-1 and isDragged<Ubound(Button) and leftDrag + Button(isDragged).Width>Xnext + Button(nextBtn).Width/2 then
		        movIndex=1
		      End If
		    End If
		    
		    If movIndex<>0 then
		      dim tb as TBButton = Button(isDragged)
		      
		      Button.Remove(isDragged)
		      Button.Insert(isDragged+movIndex, tb)
		      isDragged=isDragged+movIndex
		      
		    End If
		    Refresh(False)
		  End If
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  
		  If isMouseOver > -1 then
		    isMouseOver=-1
		    
		    Refresh(False)
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  If enabled then
		    Dim lastMouseOver as integer = isMouseOver
		    isMouseOver=FindBtnAtXY(X, Y)
		    If lastMouseOver<>isMouseOver then
		      Refresh(False)
		    End If
		    If isMouseOver>-1 then 
		      HelpTagText(Button(isMouseOver).HelpTag)
		    Else
		      HelpTagText("")
		    End If
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  handleMouseUp(X,Y)
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  #Pragma Unused X
		  #Pragma Unused Y
		  #Pragma Unused deltaX
		  
		  Return False
		  If not enableScroll then Return False
		  If IsVertical then Scroll = min(Scroll-deltaY, 1)
		  
		  Refresh(False)
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  If ButtonType = 0 then isSelected = -1
		  'me.EraseBackground=TargetMacOS
		  me.UseFocusRing = False
		  
		  Limit=-1
		  
		  
		  RightClickMenu = new MenuItem
		  Dim mn As MenuItem
		  
		  mn = new MenuItem(TBLanguage.tbBigIconsLabel)
		  mn.Tag = "BigIconsLabel"
		  RightClickMenu.Append mn
		  
		  
		  mn = new MenuItem(TBLanguage.tbMediumIconsLabel)
		  mn.Tag = "MediumIconsLabel"
		  RightClickMenu.Append mn
		  
		  mn = new MenuItem(TBLanguage.tbSmallIconsLabel)
		  mn.Tag = "SmallIconsLabel"
		  RightClickMenu.Append mn
		  
		  mn = new MenuItem(TBLanguage.tbBigIcons)
		  mn.Tag = "BigIcons"
		  RightClickMenu.Append mn
		  
		  mn = new MenuItem(TBLanguage.tbMediumIcons)
		  mn.Tag = "MediumIcons"
		  RightClickMenu.Append mn
		  
		  mn = new MenuItem(TBLanguage.tbSmallIcons)
		  mn.Tag = "SmallIcons"
		  RightClickMenu.Append mn
		  
		  mn = new MenuItem(TBLanguage.tbLabelsOnly)
		  mn.Tag = "Labels"
		  RightClickMenu.Append mn
		  
		  mn = new MenuItem(MenuItem.TextSeparator)
		  RightClickMenu.Append mn
		  
		  mn = new MenuItem(TBLanguage.tbCustomize)
		  mn.Tag = "Customize"
		  RightClickMenu.Append mn
		  
		  
		  
		  RightClickMenu.Item(DisplayType).Checked = True
		  
		  Open()
		  
		  
		  Call Registered
		  
		  xojo.core.timer.CallLater(10000*(1.0+Rnd), WeakAddressOf AutoUpdate)
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #Pragma Unused areas
		  
		  Dim gg As Graphics
		  #if TargetWindows
		    Dim bufferPicture as Picture = self.Window.BitmapForCaching(self.Width, self.Height)
		    If bufferPicture is nil then Return
		    gg = bufferPicture.Graphics
		  #else
		    gg = g
		  #endif
		  
		  //New version 1.3
		  //Calculates the position of AlignCenter Buttons and AlignRight Buttons
		  If lastSize <> Width * Height then
		    Simulate()
		    lastSize = Width * Height
		  End If
		  
		  
		  
		  
		  Dim nbBt As Integer
		  Dim nbTs As Integer
		  Dim btWidth, btHeight As Integer
		  Dim FromLeft As Integer = 1
		  Dim FromTop As Integer = Scroll
		  Dim Textdx, Textdy, Icondx, Icondy, IconW, IconH, IconSize As Integer
		  Dim CaptionWidth As Integer
		  Dim Align As Integer
		  
		  #if DebugBuild
		    redrawTime = Microseconds
		  #endif
		  
		  'Call Disclosure
		  
		  If not RaiseEvent DrawBackground(gg) then
		    #if TargetMacOS
		      gg.ForeColor = &cE8E8E8
		    #else
		      gg.ForeColor = FillColor
		    #endif
		    gg.FillRect(0, 0, gg.Width, gg.Height)
		  End If
		  
		  gg.TextFont = TextFont
		  gg.Bold = Bold
		  gg.Italic = Italic
		  gg.Underline = Underline
		  gg.TextSize = TextSize
		  #if not DebugBuild
		    If not Registered then
		      g.DrawString("Custom Toolbar not registered", 5, g.TextHeight, Width)
		      Return
		    End If
		  #endif
		  
		  Dim u As Integer = UBound(Button)
		  
		  For i as Integer = 0 to u
		    If not Button(i).Visible then Continue
		    
		    btHeight = Button(i).Height
		    btWidth = Button(i).Width
		    
		    IconW = 0
		    IconH = 0
		    
		    
		    If limit> u and Button(i).Align <> Align then
		      If Button(i).Align = 1 and Align = 0 then
		        FromLeft = PosCenter
		        Align = 1
		      elseIf Button(i).Align = 2 then
		        FromLeft = PosRight
		        Align = 2
		      End If
		    End if
		    
		    If Button(i).Caption <> "-" or i=Limit then
		      //not a textseparator
		      nbBt = nbBt +1
		      
		      If i=Limit then
		        If IsVertical then
		          FromTop = Height - 13
		          btHeight = 12
		        Else
		          FromLeft = Width - 13
		          btWidth = 12
		        End If
		      End If
		      
		      
		      //Drawing button border
		      If Button(i).Enabled and Enabled then
		        If i = isSelected or (i=limit and isSelected=-2)  then
		          If ButtonType = 0 then
		            #if not TargetMacOS
		              //Painting anti Bevel
		              gg.ForeColor=DarkBevelColor
		              //horizontal
		              gg.DrawLine(FromLeft, FromTop , FromLeft + btWidth-2, FromTop )
		              //vertical
		              gg.DrawLine(FromLeft, FromTop, FromLeft, FromTop + btHeight - 2)
		              
		              gg.ForeColor=LightBevelColor
		              //horizontal
		              gg.DrawLine(FromLeft, FromTop + btHeight-1, FromLeft + btWidth-1, FromTop + btHeight-1)
		              //vertical
		              gg.DrawLine(FromLeft + btWidth-1, FromTop, FromLeft + btWidth-1, FromTop + btHeight-1)
		            #endif
		          Elseif ButtonType = 1 then
		            //painting background of button in blue
		            If SelectedColor2 = &c000000 then
		              gg.ForeColor = SelectedColor
		              gg.FillRect(FromLeft, FromTop, btWidth, btHeight)
		              
		            else
		              
		              Dim gclip As Graphics = gg.Clip(FromLeft, FromTop, btWidth, btHeight)
		              'gclip.ForeColor = &c4E92D400
		              'gclip.DrawLine(0,0, gclip.Width, 0)
		              'gclip.ForeColor = &c62AAE200
		              'gclip.DrawLine(0, 1, gclip.Width, 1)
		              gradient(gclip, 0, gclip.Height, SelectedColor, SelectedColor2)
		              'gclip.ForeColor = &c2A66B200
		              'gclip.DrawLine(0, gclip.Height-1, gclip.Width, gclip.Height-1)
		            End If
		            
		          End If
		        Elseif i=isMouseOver and i<>isDragged or (i=limit and isMouseOver = -2) then
		          #if not TargetMacOS
		            //painting border of button to create bevel
		            gg.ForeColor=LightBevelColor
		            //horizontal
		            gg.DrawLine(FromLeft, FromTop , FromLeft + btWidth-2, FromTop )
		            //vertical
		            gg.DrawLine(FromLeft, FromTop, FromLeft, FromTop + btHeight - 2)
		            
		            gg.ForeColor=DarkBevelColor
		            //horizontal
		            gg.DrawLine(FromLeft, FromTop + btHeight-1, FromLeft + btWidth-1, FromTop + btHeight-1)
		            //vertical
		            gg.DrawLine(FromLeft + btWidth-1, FromTop, FromLeft + btWidth-1, FromTop + btHeight-1)
		          #endif
		        End If
		      End If
		      
		      If i<Limit then
		        //Drawing Icons and Text
		        
		        //Caption Width
		        If i = isSelected and ButtonType = 1 then
		          gg.Bold = True
		        Else
		          gg.Bold = Bold
		        End If
		        CaptionWidth=gg.StringWidth(Button(i).Caption)
		        
		        If DisplayType = TypeBigIconsLabel then
		          If Button(i).Icon <> Nil then
		            Icondx = (btWidth - 32)/2
		            IconW = Button(i).Icon.Width
		            IconH = Button(i).Icon.Height
		          End If
		          IconSize = 32
		          Icondy = 3
		          Textdx = (btWidth - CaptionWidth)/2
		          Textdy = 47
		        ElseIf DisplayType = TypeMediumIconsLabel then
		          If Button(i).Icon <> Nil then
		            Icondx = (btWidth - 24)/2
		            IconW = Button(i).Icon.Width
		            IconH = Button(i).Icon.Height
		          End If
		          IconSize = 24
		          Icondy = 3
		          Textdx = (btWidth - CaptionWidth)/2
		          Textdy = 41
		        Elseif DisplayType = TypeBigIcons or DisplayType = TypeMediumIcons and Button(i).Icon <> Nil then
		          
		          If DisplayType = TypeBigIcons then
		            IconSize = 32
		          Elseif DisplayType = TypeMediumIcons then
		            IconSize = 24
		          End If
		          Icondx = (btWidth - IconSize)/2
		          Icondy = (btHeight - IconSize)/2
		          IconW = Button(i).Icon.Width
		          IconH = Button(i).Icon.Height
		          
		        Elseif DisplayType = TypeSmallIconsLabel then
		          Icondx = 8
		          Icondy = 3
		          Textdx = 29
		          Textdy = 17
		          If Button(i).Icon <> Nil then
		            IconW = Button(i).SmallIcon.Width
		            IconH = Button(i).SmallIcon.Height
		          End If
		          IconSize = 16
		          
		        Elseif DisplayType = TypeSmallIcons then
		          Icondx = 8
		          Icondy = 3
		          If Button(i).Icon <> Nil then
		            IconW = Button(i).SmallIcon.Width
		            IconH = Button(i).SmallIcon.Height
		          End If
		          IconSize = 16
		          
		        Elseif DisplayType = TypeLabelsOnly Then
		          Textdx = 8
		          Textdy = 17
		        End If
		        
		        //Drawing Icons
		        If not Button(i).Enabled or not enabled then
		          If DisplayType = TypeBigIconsLabel or DisplayType = TypeBigIcons or DisplayType = TypeMediumIcons or DisplayType = TypeMediumIconsLabel then
		            gg.DrawPicture(MaskIcon(Button(i).Icon, 1), FromLeft + Icondx, FromTop + Icondy, IconSize, IconSize, 0, 0, IconW, IconH)
		          elseif DisplayType = TypeSmallIconsLabel or DisplayType = TypeSmallIcons then
		            gg.DrawPicture(MaskIcon(Button(i).SmallIcon, 1), FromLeft + Icondx, FromTop + Icondy, IconSize, IconSize, 0, 0, IconW, IconH)
		          End If
		        elseif  i=isDragged then
		          If DisplayType = TypeBigIconsLabel or DisplayType = TypeBigIcons or DisplayType = TypeMediumIcons or DisplayType = TypeMediumIconsLabel then
		            gg.DrawPicture(MaskIcon(Button(i).Icon, 1), Icondx + leftDrag, Icondy + topdrag, IconSize, IconSize, 0, 0, IconW, IconH)
		          elseif DisplayType = TypeSmallIconsLabel or DisplayType = TypeSmallIcons then
		            gg.DrawPicture(MaskIcon(Button(i).SmallIcon, 1), Icondx + leftdrag, Icondy+ topdrag, IconSize, IconSize, 0, 0, IconW, IconH)
		          End If
		        Elseif i = isSelected and ButtonType = 0 then
		          If DisplayType = TypeBigIconsLabel or DisplayType = TypeBigIcons or DisplayType = TypeMediumIcons or DisplayType = TypeMediumIconsLabel then
		            gg.DrawPicture(MaskIcon(Button(i).Icon, -1), FromLeft + Icondx, FromTop + Icondy, IconSize, IconSize, 0, 0, IconW, IconH)
		          elseif DisplayType = TypeSmallIconsLabel or DisplayType = TypeSmallIcons then
		            gg.DrawPicture(MaskIcon(Button(i).SmallIcon, -1), FromLeft + Icondx, FromTop + Icondy, IconSize, IconSize, 0, 0, IconW, IconH)
		          End If
		        Else
		          If DisplayType = TypeBigIconsLabel or DisplayType = TypeBigIcons or DisplayType = TypeMediumIcons or DisplayType = TypeMediumIconsLabel then
		            gg.DrawPicture(MaskIcon(Button(i).Icon, 0), FromLeft + Icondx, FromTop + Icondy, IconSize, IconSize, 0, 0, IconW, IconH)
		          elseif DisplayType = TypeSmallIconsLabel or DisplayType = TypeSmallIcons then
		            gg.DrawPicture(MaskIcon(Button(i).SmallIcon, 0), FromLeft + Icondx, FromTop + Icondy, IconSize, IconSize, 0, 0, IconW, IconH)
		          End If
		        End If
		        
		        //Drawing text
		        If i = isSelected and ButtonType = 1 then
		          gg.Bold = True
		          gg.ForeColor = &cFFFFFF
		        Else
		          gg.Bold = Bold
		          gg.ForeColor = TextColor
		        End If
		        If not Button(i).Enabled or not enabled or i=isDragged then
		          gg.ForeColor = DisabledTextColor
		        End If
		        If DisplayType = TypeBigIconsLabel or DisplayType = TypeSmallIconsLabel or _
		          DisplayType = TypeLabelsOnly or DisplayType = TypeMediumIconsLabel then
		          If i=isDragged then
		            gg.DrawString(Button(i).Caption, leftDrag + Textdx, topDrag + textdy)
		          Else
		            #if TargetMacOS
		              If i = isSelected then
		                if ButtonType = 0 then
		                  gg.ForeColor = DisabledTextColor
		                  gg.DrawString(Button(i).Caption, FromLeft + Textdx + 1, FromTop + Textdy +1)
		                  gg.ForeColor = TextColor
		                Elseif ButtonType = 1 then
		                  gg.ForeColor = TextColor
		                  gg.DrawString(Button(i).Caption, FromLeft + Textdx, FromTop + Textdy +1)
		                  gg.ForeColor = &cFFFFFF
		                end if
		              End If
		            #endif
		            gg.DrawString(Button(i).Caption, FromLeft + Textdx, FromTop + Textdy)
		            
		          End If
		        End If
		        If i<>isDragged then
		          PaintMore(i, gg, FromLeft, FromTop, Button(i).Width, Button(i).Height)
		        End If
		      Else
		        //Drawing Disclosure Triangles
		        If enabled then
		          gg.ForeColor = &c0
		        Else
		          gg.ForeColor = DisabledTextColor
		        End If
		        
		        If IsVertical then
		          Icondy=3
		          Icondx=(Button(i).Width - 4)/2
		          
		          For k as Integer = 0 to 1
		            gg.DrawLine(FromLeft+Icondx, FromTop + Icondy+k, FromLeft+Icondx + 2, FromTop + Icondy + 2+k)
		            gg.DrawLine(FromLeft+Icondx+4, FromTop + Icondy+k, FromLeft+Icondx+2, FromTop + Icondy +2+k)
		            
		            gg.DrawLine(FromLeft + Icondx, FromTop +Icondy + 4+k, FromLeft+Icondx + 2, FromTop + Icondy + 6+k)
		            gg.DrawLine(FromLeft+Icondx+4, FromTop + Icondy+4+k, FromLeft+Icondx +2, FromTop + Icondy +6+k)
		          Next
		        Else
		          If DisplayType = TypeBigIconsLabel or DisplayType = TypeBigIcons then
		            Icondy=17
		          Else
		            Icondy=7
		          End If
		          Icondx = 3
		          
		          For k as Integer = 0 to 1
		            gg.DrawLine(FromLeft+Icondx + k, FromTop + Icondy, FromLeft+Icondx + 2 + k, FromTop + Icondy + 2)
		            gg.DrawLine(FromLeft+Icondx+4+k, FromTop + Icondy, FromLeft+Icondx + 6+k, FromTop + Icondy + 2)
		            gg.DrawLine(FromLeft + Icondx+k, FromTop +Icondy + 4, FromLeft+Icondx + 2+k, FromTop + Icondy + 2)
		            gg.DrawLine(FromLeft+Icondx+4+k, FromTop + Icondy+4, FromLeft+Icondx + 6+k, FromTop + Icondy + 2)
		          Next
		        End If
		        Exit
		      End If
		      
		    Else
		      //TextSeparator
		      nbTs = nbTs +1
		      If IsVertical then
		        btHeight = 3
		      Else
		        btWidth = 3
		      End If
		      If IsVertical then
		        For j as Integer = 3 to btWidth - 2 step 2
		          gg.Pixel(FromLeft + j, FromTop + 1) = DarkBevelColor
		        Next
		      Else
		        For j as Integer = 3 to btHeight - 2 step 2
		          gg.Pixel(FromLeft + 1, FromTop + j) = DarkBevelColor
		        Next
		      End If
		    End if
		    
		    
		    If IsVertical then
		      FromTop = FromTop + btHeight + offset
		    Else
		      FromLeft = FromLeft + btWidth + offset
		    End If
		  Next
		  
		  
		  //Drawing Frame
		  If DrawFrame then
		    gg.ForeColor=FrameColor
		    gg.DrawRect(0,0, gg.Width, gg.Height)
		  End If
		  
		  #if TargetWindows
		    g.DrawPicture(bufferPicture, 0,0)
		  #endif
		  
		  #if DebugBuild
		    redrawTime = Microseconds - redrawTime
		  #endif
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Append(bt As TBButton)
		  //Appends a new TBButton to the TBCanvas.
		  
		  Button.Append bt
		  ButtonSize(UBound(Button))
		  
		  me.Redisplay()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AutoUpdate()
		  
		  
		  #if DebugBuild
		    
		    Dim Product As String = me.kProductKey
		    #if TargetWeb
		      If kProductKey.left(3) <> "Web" then
		        Product = "Web" + kProductKey
		      End If
		    #Endif
		    
		    'Call RegisterControls.AutoUpdate(Product, kVersion, Registered, mLimitDate)
		    
		    
		    
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ButtonSize(startFrom As Integer = 0)
		  Dim p As Picture = New Picture(1, 1, 32)
		  
		  Dim gg as Graphics = p.Graphics
		  gg.TextFont = TextFont
		  gg.Bold = Bold
		  gg.Italic = Italic
		  gg.Underline = Underline
		  gg.TextSize = TextSize
		  
		  Dim CaptionWidth As Integer
		  
		  For i as Integer = startFrom to UBound(Button)
		    
		    CaptionWidth = gg.StringWidth(Button(i).Caption)
		    If DisplayType = TypeBigIconsLabel then
		      Button(i).Height = 53
		      Button(i).Width = max(48, CaptionWidth + 16)
		    Elseif DisplayType = TypeBigIcons then
		      Button(i).Height = 45
		      Button(i).Width = 48
		    Elseif DisplayType = TypeMediumIconsLabel then
		      Button(i).Height = 47
		      Button(i).Width = max (42, CaptionWidth + 16)
		    Elseif DisplayType = TypeMediumIcons then
		      Button(i).Height = 39
		      Button(i).Width = 42
		    Elseif DisplayType = TypeSmallIconsLabel then
		      Button(i).Height = 23
		      Button(i).Width=max(32, 29 + CaptionWidth + 8)
		    Elseif DisplayType =TypeSmallIcons then
		      Button(i).Height = 23
		      Button(i).Width = 32
		    Elseif DisplayType = TypeLabelsOnly then
		      Button(i).Height = 23
		      Button(i).Width = max(32, CaptionWidth + 16)
		    End If
		    If IsVertical then Button(i).Width = me.Width - 2
		    
		    If Button(i).Caption="-" then
		      If IsVertical then
		        Button(i).Height = 3
		      Else
		        Button(i).Width = 3
		      End If
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  //Returns the amount of buttons on the TBCanvas.
		  
		  Return UBound(Button)+1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CountVisible() As Integer
		  //Returns the amount of visible buttons on the TBCanvas.
		  
		  Dim amount as Integer
		  For i as Integer = 0 to UBound(Button)
		    If Button(i).Visible then amount = amount + 1
		  Next
		  
		  Return amount
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateButton(Caption As String, Name As String = "", HelpTag As String = "", Icon As Picture = Nil, SmallIcon As Picture = Nil, Enabled As Boolean = True, Visible As Boolean = True, Menu As MenuItem = Nil, Align As Integer = 0)
		  //Creates a new TBButton and adds it to the TBCanvas.
		  
		  Dim bt As new TBButton(Caption, Name, HelpTag, Icon, SmallIcon, Enabled, Visible, Menu, Align)
		  //("SaveBtn","Save This Project","Save (Ctrl+S): this project to disk",SaveFile,SaveFile,SaveFile16,SaveFile16,true,true,nil)
		  
		  
		  
		  Button.Append bt
		  ButtonSize(UBound(Button))
		  
		  lastSize = -1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateTextSeparator()
		  //Creates a new TextSeparator and adds it to the TBCanvas.
		  
		  Button.Append new TBButton("-")
		  ButtonSize(UBound(Button))
		  
		  lastSize = -1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DarkerColor(forColor as color, offset as integer) As color
		  //get a darker color for the given color.
		  Return rgb( max(forColor.Red - offset, 0), max(forColor.green - offset, 0), max(forColor.blue - offset, 0))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DemoMessage()
		  '#If Not DebugBuild
		  'Dim d As new MessageDialog
		  'Dim b As MessageDialogButton
		  '
		  'd.Title = "Demo Software in use"
		  'd.Icon = MessageDialog.GraphicNote
		  'd.ActionButton.Caption="Yes"
		  'd.CancelButton.Visible = True
		  'd.CancelButton.Caption = "No"
		  '
		  'd.Message = "This application was built with a Demo version of Toolbar by Jérémie Leroy." + EndOfLine + _
		  '"If you wish to disable this message, then please encourage the developer of this application to purchase the Toolbar." + EndOfLine + _
		  'EndOfLine + _
		  '"Would you like to visit Jérémie Leroy's website ?"
		  'b=d.ShowModal
		  'If b=d.ActionButton then
		  'ShowURL("http://www.jeremieleroy.com/products.php")
		  'End If
		  '#endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Disclosure() As Boolean
		  #if DebugBuild
		    DisclosureTime = Microseconds 
		  #endif
		  
		  If IsVertical then
		    If minHeight<=Height then 
		      Limit = UBound(Button)+1
		      Return False
		    End If
		  Else
		    If minWidth<=Width then 
		      Limit = UBound(Button)+1
		      Return False
		    End If
		  End If
		  
		  Dim count As Integer
		  Dim fromBorder As Integer = 1
		  
		  For i as Integer = 0 to UBound(Button)
		    If not Button(i).Visible then Continue
		    
		    If IsVertical then
		      If fromBorder + Button(i).Height >= Height-12 then
		        Limit=i
		        Exit
		      End If
		      fromBorder=fromBorder + Button(i).Height
		    Else
		      If fromBorder + Button(i).Width >=Width-12 then
		        Limit=i
		        Exit
		      End If
		      fromBorder = fromBorder + Button(i).Width
		    End If
		    count=count+1
		  Next
		  
		  #if DebugBuild
		    disclosureTime = Microseconds - disclosureTime
		  #endif
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FindBtnAtXY(X As Integer, Y As Integer) As Integer
		  If X<=0 or Y<=0 or X>=Width or Y>=Height then Return -1
		  
		  Dim FromLeft As Integer = 1
		  Dim FromTop As Integer = Scroll
		  'Dim count As Integer
		  
		  Dim u As Integer = UBound(Button)
		  Dim Align As Integer
		  
		  For i as Integer = 0 to UBound(Button)
		    If not Button(i).Visible then Continue
		    
		    If limit>u and Button(i).Align <> Align then
		      If Button(i).Align = 1 and Align = 0 then
		        FromLeft = PosCenter
		        Align = 1
		      elseIf Button(i).Align = 2 then
		        FromLeft = PosRight
		        Align = 2
		      End If
		    End if
		    
		    If Limit <= u then
		      If IsVertical then
		        If Button(i).Height + FromTop>Height-14 then
		          //Disclosure
		          If Y>Height-14 then Return -2
		          Return -1
		        End If
		      Else
		        If Button(i).Width + FromLeft>Width -14 then
		          //Disclosure
		          If X >Width - 14 and Y<Button(i).Height then Return -2
		          Return -1
		        End If
		      End If
		    End If
		    
		    If Y>=FromTop and Y<=FromTop + Button(i).Height and X>=FromLeft and X<FromLeft+Button(i).Width then
		      Return i
		    End If
		    
		    If IsVertical then
		      FromTop = FromTop + Button(i).Height + offset
		    Else
		      FromLeft = FromLeft + Button(i).Width + offset
		    End If
		  Next
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FindXYforBtn(btnIndex As Integer, ByRef X As Integer, ByRef Y As Integer)
		  If btnIndex<0 or btnIndex>UBound(Button) then Return
		  If not Button(btnIndex).Visible then Return
		  
		  Dim FromLeft As Integer = 1
		  Dim FromTop As Integer = Scroll
		  Dim Align As Integer
		  
		  Dim btWidth, btHeight As Integer
		  
		  For i as Integer = 0 to btnIndex
		    If not Button(i).Visible then Continue
		    
		    If limit>UBound(Button) and Button(i).Align <> Align then
		      If Button(i).Align = 1 and Align = 0 then
		        FromLeft = PosCenter
		        Align = 1
		      elseIf Button(i).Align = 2 then
		        FromLeft = PosRight
		        Align = 2
		      End If
		    End if
		    
		    If i = btnIndex then
		      Exit
		    End If
		    
		    btHeight = Button(i).Height
		    btWidth = Button(i).Width
		    
		    If IsVertical then
		      FromTop = FromTop + btHeight + offset
		    Else
		      FromLeft = FromLeft + btWidth + offset
		    End If
		  Next
		  X = FromLeft
		  Y = FromTop
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetButton(theName As String) As TBButton
		  //Gets a TBButton by its name. If the TBButton is not found, the returned value will be Nil.
		  
		  For i as Integer = 0 to UBound(Button)
		    If Button(i).Name = theName then
		      Return Button(i)
		    End If
		  Next
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub gradient(g as graphics, start as integer, length as integer, startColor as color, endColor as color)
		  //modified gradient code, original code: Seth Willits
		  '#pragma DisableBackgroundTasks
		  '#pragma DisableBoundsChecking
		  
		  dim i as integer, ratio, endratio as Single
		  
		  // Draw the gradient
		  for i = start to start + length
		    
		    // Determine the current line's color
		    ratio = ((length-(i-start))/length)
		    
		    
		    endratio = ((i-start)/length)
		    g.ForeColor = RGB(EndColor.Red * endratio + StartColor.Red * ratio, EndColor.Green * endratio + StartColor.Green * ratio, EndColor.Blue * endratio + StartColor.Blue * ratio)
		    
		    // Draw the step
		    
		    g.DrawLine 0, i, g.Width, i
		    
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub handleMouseUp(X As Integer, Y As Integer)
		  isDragged=-1
		  If enabled then
		    
		    If isSelected>-1 then
		      If Button(isSelected).Enabled then
		        If Button(isSelected).Menu <> nil then
		          FindXYforBtn(isSelected, X, Y)
		          Dim m As MenuItem = Button(isSelected).Menu.popup(me.Window.Left + me.Left+X, me.Window.top + me.Top +Button(isSelected).Height + Y)
		          
		          If m<>nil then
		            If Button(isSelected).Name = "" then
		              If m.tag.StringValue <> "" then
		                Action(Button(isSelected).caption + "." + m.Tag)
		              else
		                Action(Button(isSelected).caption + "." + m.Text)
		              End If
		            Else
		              If m.tag.StringValue <> "" then
		                Action(Button(isSelected).Name + "." + m.Tag)
		              else
		                Action(Button(isSelected).Name + "." + m.Text)
		              End If
		            End If
		          End If
		        ElseIf Button(isSelected).Name = "" then
		          Action(Button(isSelected).Caption)
		        Else
		          Action(Button(isSelected).Name)
		        End If
		      End If
		    Elseif isSelected=-2 then
		      dim base as new MenuItem
		      dim bt as MenuItem
		      For i as integer = Limit to UBound(Button)
		        bt = new MenuItem
		        bt.Text = Button(i).Caption
		        bt.Tag = Button(i).Name
		        bt.Icon = Button(i).SmallIcon
		        If i=isSelected then bt.Checked=True
		        If Button(i).Menu <> Nil then
		          bt.tag = "%Menu" + str(i)
		        End If
		        base.Append(bt)
		        
		      Next
		      bt = base.popup '(X + self.Left, Y+self.Top)
		      If bt <> nil then
		        If bt.Tag = "" then
		          Action(bt.Text)
		        Elseif Instr(bt.Tag, "%Menu")>0 then
		          isSelected = val(NthField(bt.Tag, "Menu", 2))
		          handleMouseUp(0,0)
		          
		        Else
		          Action(bt.Tag)
		        End If
		      End If
		    End If
		    
		    If ButtonType = 0 then
		      isSelected = -1
		    End If
		    Simulate()
		    Refresh(False)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function Hash2(s As String, P As UInt16) As Uint16
		  
		  
		  dim R as integer
		  
		  for i as integer = 1 to s.Len
		    
		    dim B as string = s.Mid( i, 1 )
		    dim ascB as integer = asc( B )
		    
		    R = Bitwise.ShiftLeft( R, 4 )
		    
		    R = R + ascB
		    
		    R = R mod P
		  next
		  
		  return val(str(R).Right(1))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function HiDPI() As Integer
		  #If TargetCocoa Then
		    Try
		      Soft Declare Function BackingScaleFactor Lib "AppKit" Selector "backingScaleFactor" (target As Integer) As Double
		      Return BackingScaleFactor(Self.Window.Handle)
		    Catch e As ObjCException
		      Return 1
		    End Try
		    
		  #Else
		    
		    Return 1
		    
		    Declare Function GetDC Lib "user32" (hWnd As Ptr) As Ptr
		    Declare Function GetDeviceCaps Lib "gdi32" _
		    (hdc As Ptr, nIndex As Integer) As Integer
		    Declare Sub ReleaseDC Lib "user32" (hWnd As Ptr, hdc As Ptr)
		    
		    Const LOGPIXELSX = 88
		    Const LOGPIXELSY = 90
		    
		    Dim hdc As Ptr = GetDC(Nil)
		    Dim dpiX As Integer = GetDeviceCaps(hdc, LOGPIXELSX)
		    Dim dpiY As Integer = GetDeviceCaps(hdc, LOGPIXELSY)
		    ReleaseDC(Nil, hdc)
		    
		    Dim scaleFactorX As Double = dpiX / 96
		    Dim scaleFactorY As Double = dpiY / 96
		    Return max(scaleFactorX, scaleFactorY)
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Insert(Index As Integer, bt As TBButton)
		  //Inserts a TBButton in the selected place.
		  
		  Button.Insert(Index, bt)
		  ButtonSize(Index)
		  
		  me.Redisplay()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function InvertColor(input as Color) As color
		  Return rgb(255 - input.Red, 255 - input.Green, 255 - input.Blue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsVertical() As Boolean
		  Return ForceVertical or Height > Width
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function LighterColor(forColor as color, offset as integer) As color
		  //get a darker color for the given color.
		  Return rgb( min(forColor.Red + offset, 255), min(forColor.green + offset, 255), min(forColor.blue + offset, 255))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function MaskIcon(Icon As Picture, Mode As Integer = 0) As Picture
		  If Mode = 0 then Return Icon
		  If Icon is nil then Return Icon
		  
		  Dim tempIcon as Picture = New Picture(Icon.Width, Icon.Height, 32)
		  Dim g as Graphics = tempIcon.Graphics
		  
		  Dim returnIcon As Picture = New Picture(Icon.Width, Icon.Height, 32)
		  returnIcon.Graphics.DrawPicture Icon, 0, 0
		  returnIcon.Mask.Graphics.DrawPicture Icon.Mask, 0,0
		  
		  If Mode <1 then
		    g.ForeColor = &c0
		  Else
		    g.ForeColor = FillColor
		  End If
		  g.FillRect(0,0, g.Width, g.Height)
		  
		  tempIcon.Mask.Graphics.ForeColor = &c808080
		  tempIcon.Mask.Graphics.FillRect(0,0, g.Width, g.Height)
		  
		  returnIcon.Graphics.DrawPicture tempIcon, 0,0
		  Return returnIcon
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Push(btnIndex As Integer, Relative As Boolean = False)
		  //Used to push a button and trigger the event associated to the button.<br/>
		  //If Relative is True, Push(1, True) will push the button right next to the currently selected button.
		  
		  If Relative then
		    isSelected = isSelected + btnIndex
		    If isSelected>UBound(Button) or isSelected<UBound(Button) then 
		      isSelected = isSelected - btnIndex
		      Return
		    End If
		  Else
		    If btnIndex=-2 then
		    Elseif btnIndex>UBound(Button) or btnIndex<0 then 
		      Return
		    End If
		    isSelected=btnIndex
		    Refresh(False)
		  End If
		  While System.MouseDown
		    //Just wait for the mouse to be up to handle the mouse up
		  Wend
		  handleMouseUp(0,0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Redisplay()
		  //Redraws the contents of the TBCanvas. This enables doublebuffering and avoids flickering of the control.
		  
		  '#if not DebugBuild
		  '#pragma DisableBackgroundTasks
		  '#pragma DisableAutoWaitCursor
		  '#endif
		  
		  lastSize = -1
		  me.Invalidate(False)
		  
		  'Refreshed()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Register(Name As String, Key As String) As Boolean
		  //#ignore in LR
		  //In order to register this control in your Application, you need to call this method only once.
		  //If the TBCanvas is registered, the return Value is True. If the Serial Key does not match the Name, the return Value will be False.
		  
		  
		  'RegisterControls.Register(Name, Key)
		  
		  Return Registered
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function Registered() As Boolean
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(Index As Integer)
		  //Removes a button by its passed index.
		  
		  Button.Remove(Index)
		  
		  me.Redisplay()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(theName As String)
		  //Removes a button by its passed name.
		  //If the button isn't found, nothing happens.
		  
		  Dim FoundAt As Integer = -1
		  For i as Integer = 0 to UBound(Button)
		    If Button(i).Name = theName then
		      FoundAt = i
		      Exit
		    End If
		  Next
		  
		  If FoundAt>-1 then
		    Remove(FoundAt)
		    
		  Else
		    System.DebugLog CurrentMethodName + " Button " + theName + " not found."
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Simulate()
		  //Redraws the contents of the TBCanvas. This enables doublebuffering and avoids flickering of the control.
		  
		  '#if not DebugBuild
		  '#pragma DisableBackgroundTasks
		  '#pragma DisableAutoWaitCursor
		  '#endif
		  
		  If Disclosure then
		    PosCenter = 0
		    PosRight = 0
		    Return
		  End If
		  
		  If IsVertical then Return
		  
		  Dim bufferPicture as Picture = New Picture(1,1,32)
		  If bufferPicture is nil then Return
		  Dim gg as Graphics = bufferPicture.Graphics
		  
		  
		  Dim nbBt As Integer
		  Dim nbTs As Integer
		  Dim btWidth, btHeight As Integer
		  Dim FromLeft As Integer = 1
		  Dim FromTop As Integer = Scroll
		  Dim CaptionWidth As Integer
		  Dim Align As Integer
		  Dim LeftWidth, CenterWidth, RightWidth As Integer
		  
		  #if DebugBuild
		    redrawTime = Microseconds
		  #endif
		  
		  
		  
		  gg.TextFont = TextFont
		  gg.Bold = Bold
		  gg.Italic = Italic
		  gg.Underline = Underline
		  gg.TextSize = TextSize
		  
		  For i as Integer = 0 to UBound(Button)
		    If not Button(i).Visible then Continue
		    
		    btHeight = Button(i).Height
		    btWidth = Button(i).Width
		    
		    CaptionWidth=gg.StringWidth(Button(i).Caption)
		    If Button(i).Caption <> "-" then
		      //not a textseparator
		      nbBt = nbBt +1
		      
		      If Button(i).Align <> Align then
		        If Button(i).Align = 1 and Align = 0 then
		          Align = 1
		        elseIf Button(i).Align = 2 then
		          Align = 2
		        End If
		      End if
		      
		      
		    Else
		      //TextSeparator
		      nbTs = nbTs +1
		      If IsVertical then
		        btHeight = 3
		      Else
		        btWidth = 3
		      End If
		    End if
		    
		    
		    If IsVertical then
		      FromTop = FromTop + btHeight + offset
		    Else
		      FromLeft = FromLeft + btWidth + offset
		      If Align = 0 then
		        LeftWidth = LeftWidth + btWidth + offset
		      elseIf Align = 1 then
		        CenterWidth = CenterWidth + btWidth + offset
		      elseif Align = 2 then
		        RightWidth = RightWidth + btWidth + offset
		      End If
		    End If
		  Next
		  
		  PosCenter = LeftWidth + (Width - LeftWidth - RightWidth - CenterWidth) \ 2
		  PosRight = Width - RightWidth
		  
		  
		  
		  #if DebugBuild
		    redrawTime = Microseconds - redrawTime
		  #endif
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Action(ButtonName As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Close()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DisplayChanged(minHeight As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DrawBackground(g As Graphics) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event HelpTagText(Text As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDown(X As Integer, Y As Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PaintMore(buttonIndex As Integer, g As Graphics, x As integer, y As integer, w As integer, h As integer)
	#tag EndHook


	#tag Note, Name = Class Constants
		===DisplayType===
		The following class constants can be used to specify the value of DisplayType property.
		<table width="15;55">
		Class Constant->Description
		TypeBigIcons->Big Icons with no caption (32x32)
		TypeBigIconsLabel->Big Icons with caption (default)
		TypeMediumIcons->Medium Icons with no caption (24x24)
		TypeMediumIconsLabel->Medium Icons with caption
		TypeLabelsOnly->Only the caption is displayed
		TypeSmallIcons->Small Icons with no caption (16x16)
		TypeSmallIconsLabel->Small Icons with caption
		</table>
		
	#tag EndNote

	#tag Note, Name = Description
		This Custom Control based on a Canvas acts like REALBasic's toolbars.<br/>
		5 layouts are integrated (Big Icons, Small Icons, with labels or not...).
		
		Buttons can have a ContextualMenu and a HelpTag.<br/>
		Text Separators can be displayed between buttons.
		
	#tag EndNote

	#tag Note, Name = Events
		#Event Action
		The User clicked on a button or used the Push method to push a button.
		
		#Event DisplayChanged
		This event fires when the display is changed in the TBCanvas. You should resize the TBCanvas when this event fires, using the minWidth or minHeight values.
		
		#Event HelpTagText
		Passes the HelpTagtext associated to the button on which the mouse is over.
		
		#Event MouseDown
		#Ignore
		
		#Event Open
		#Ignore
		
		#Event PaintMore
		Enables painting directly on the TBCanvas each time the control is refreshed.
		
		#Event DrawBackground
		Enables painting the background of the TBCanvas.<br/>
		Return True if you handled the background paint.
		
	#tag EndNote

	#tag Note, Name = External link
		
		Download page: http://www.jeremieleroy.com/products.php#Toolbar
	#tag EndNote

	#tag Note, Name = History
		===Version 1.7.2===
		Released November 11th, 2018
		
		*Fix:
		**Updated for Xojo 2018r3
		
		===Version 1.6.0===
		Released February 9th, 2015
		
		*New:
		**RightClickMenu to have direct access to the Right click menu when user right-clicks the TBCanvas
		**Redisplay function to completely refresh the internal buffers
		**All Strings displayed in Right-click menu and TBWindow are now string constants for Localization
		**SelectColor2 to define a gradient background for Toggle buttons.
		
		*Fix:
		**Fixed a crash when closing the containing Window
		**The Toolbar is now correctly refreshed when adding/inserting/deleting a Toolbar button.<br/>
		Call the Redisplay function if you edit a button directly.
		
		===Version 1.5===
		Released December 25th, 2013
		
		*New:
		**The CustomToolbar is now Retina Ready
		**Better Graphics on Mac OS X.
		**Border Property.
		
		*Deprecated:
		**DrawFrame (use Border instead).
		
		===Version 1.4.1===
		
		
		*Fix:
		**Bug when no icon is set
		**Bug with Button width when TextSize isn't 0
		
		===Version 1.4===
		Released March 19th, 2012
		
		*New:
		**Display types: TypeMediumIcon, TypeMediumIconLabel<br/> When medium icon is selected, it expects to have a 24x24 picture in the Button.Icon property. (Customer request)
		
		===Version 1.2===
		Released December 15th, 2009
		
		*New:
		**Method: GetButton(theName As String) <br/> Lets you get a handle to a button by using its name.
		**Method: Redraw() is now a public method. It used to be Protected.
		**Button "Name" property is now ReadOnly
		**Property: ForceVertical As Boolean
		
		*Fix:
		**Fixed and tested on REALBasic 2008r1 up to 2009r5
		
		
		
		===Version 1.1===
		Released 08 November 2009
		
		*New:
		**New constructor for Toolbar button
		**For button with menus, if the menuitem has a tag, then the tag is passed in the menu event. If not, the caption is passed.
		
		*Fix:
		**Fixed MenuItem display when a button is hidden because of the width of the toolbar
		
		
		
		
		===Version 1.0===
		Released 01 May 2009
		
		
		
	#tag EndNote

	#tag Note, Name = See Also
		[[TBButton]] class; [[TBLanguage]] Module.
		
	#tag EndNote


	#tag Property, Flags = &h0
		#tag Note
			Applies the Bold style to the captions.
		#tag EndNote
		Bold As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Enables or disables drawing of a frame around the Toolbar.
		#tag EndNote
		Border As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Array containing all buttons to be displayed in the TBCanvas.
		#tag EndNote
		Button() As TBButton
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			Possible Values are 0 and 1.
			If value is 0, the Buttons do not keep a selected state after being clicked.
			If value is 1, the buttons stay highlighted after being clicked.
		#tag EndNote
		#tag Getter
			Get
			  return mButtontype
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value<0 or Value >1 then Value = 0
			  mButtontype = value
			End Set
		#tag EndSetter
		ButtonType As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			#Ignore in Language Reference
		#tag EndNote
		#tag Getter
			Get
			  if Reference <> nil then
			    return TBCanvas(Reference.Value)
			  else
			    return nil
			  end if
			End Get
		#tag EndGetter
		Shared CustomizeOwner As TBCanvas
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private disclosureTime As Double
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			The DisplayType for the Buttons.
			Defines if the buttons are displayed with a caption, with an icon, big or small. See the Notes section for more information.
		#tag EndNote
		#tag Getter
			Get
			  return mDisplaytype
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Value<>mDisplaytype then
			    If value <0 or value>6 then Value = 0
			    
			    if RightClickMenu <> Nil then
			      For i as Integer = 0 to RightClickMenu.Count-1
			        RightClickMenu.Item(i).Checked = False
			      Next
			      If RightClickMenu.Count > DisplayType+1 then
			        RightClickMenu.Item(DisplayType).Checked=True
			      End If
			    End If
			    
			    mDisplaytype = value
			    ButtonSize()
			    DisplayChanged(minHeight)
			    Scroll=1
			  End If
			  
			  
			End Set
		#tag EndSetter
		DisplayType As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private DownTime As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Border
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Border = value
			End Set
		#tag EndSetter
		DrawFrame As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		#tag Note
			If True, the user can right-click the Toolbar to edit the size of buttons and the order.
		#tag EndNote
		enableCustomize As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			If True, the user can drag buttons to re-arrange the order.
		#tag EndNote
		enableDrag As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			If True, the user can scroll all buttons with the MouseWheel, if the Width or Height of the TBCanvas isn't enough to display all buttons.
		#tag EndNote
		enableScroll As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			If True, the TBCanvas will be displayed vertically.
		#tag EndNote
		ForceVertical As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			The initially selected button.
		#tag EndNote
		#tag Setter
			Set
			  isSelected=Value
			End Set
		#tag EndSetter
		InitialValue As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected isDragged As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected isMouseOver As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected isSelected As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Applies the Italic style to the captions.
		#tag EndNote
		Italic As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LastMouseDown As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected lastSize As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected leftDrag As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Limit As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mButtontype As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDisplaytype As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			The required height necessary to correctly display the buttons.
		#tag EndNote
		#tag Getter
			Get
			  Dim h As Integer = 2
			  For i as Integer = 0 to UBound(Button)
			    If not Button(i).Visible then Continue
			    h=h + Button(i).Height
			    If not IsVertical then Exit
			  Next
			  Return h
			End Get
		#tag EndGetter
		minHeight As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mInitialvalue As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			The required width necessary to correctly display the buttons.
		#tag EndNote
		#tag Getter
			Get
			  Dim w As Integer = 2
			  For i as Integer = 0 to UBound(Button)
			    If not Button(i).Visible then Continue
			    w=w + Button(i).Width
			    If IsVertical then Exit
			  Next
			  Return w
			End Get
		#tag EndGetter
		minWidth As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared mLimitDate As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private noDrag As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected offset As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PosCenter As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PosRight As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Contains the last amount of Microseconds necessary to redraw the full contents.
			Only to be used in DebugBuild.
		#tag EndNote
		redrawTime As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			#Ignore in Language Reference
		#tag EndNote
		Shared Reference As weakRef
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			The menu displayed when right-clicking a Button in the Toolbar.
			
			If enableCustomize is false, the menu will not be shown.
			
			It is possible to change the Text for each MenuItem but do not change the Tags.
		#tag EndNote
		RightClickMenu As MenuItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Scroll As Integer = 1
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			The color used to indicate that a button is selected.
		#tag EndNote
		SelectedColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			The second color (for a gradient background) used to indicate that a button is selected.
			If this color is equal to &c000000, a solid background is displayed.
			
			
			If you need to use full black as second color, set this property to &c000001.
		#tag EndNote
		SelectedColor2 As Color = &c000000
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Name of the font used to display the text.
		#tag EndNote
		TextFont As String = "System"
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			
			Size of the font used to display the text.
		#tag EndNote
		TextSize As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected topDrag As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Applies the underline style to the text.
		#tag EndNote
		Underline As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private X_Down As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Y_Down As Integer
	#tag EndProperty


	#tag Constant, Name = kProductKey, Type = String, Dynamic = False, Default = \"CustomToolbar", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kReleaseDate, Type = Double, Dynamic = False, Default = \"20181110", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kVersion, Type = String, Dynamic = False, Default = \"1.7.2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeBigIcons, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeBigIconsLabel, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeLabelsOnly, Type = Double, Dynamic = False, Default = \"6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeMediumIcons, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeMediumIconsLabel, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeSmallIcons, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeSmallIconsLabel, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocus"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabs"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
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
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
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
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=false
			Group="Appearance"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Font"
			InitialValue="System"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="minWidth"
			Visible=false
			Group="Font"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="minHeight"
			Visible=false
			Group="Font"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DrawFrame"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialValue"
			Visible=true
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ButtonType"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Button"
				"1 - Toggles"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisplayType"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Big icons with label"
				"1 - Medium icons with label"
				"2 - Small icons with label"
				"3 - Big icons"
				"4 - Medium icons"
				"5 - Small icons"
				"6 - Label only"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="enableCustomize"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="enableDrag"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="enableScroll"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectedColor"
			Visible=true
			Group="Behavior"
			InitialValue="&h3399FF"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectedColor2"
			Visible=true
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="redrawTime"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ForceVertical"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Border"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

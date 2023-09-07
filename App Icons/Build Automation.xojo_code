#tag BuildAutomation
			Begin BuildStepList Linux
				Begin BuildProjectStep Build
				End
			End
			Begin BuildStepList Mac OS X
				Begin BuildProjectStep Build
				End
				Begin SignProjectStep Sign
				  DeveloperID=com.JHLConsultants.LeapData
				End
			End
			Begin BuildStepList Windows
				Begin BuildProjectStep Build
				End
				Begin IDEScriptBuildStep Script1 , AppliesTo = 2, Architecture = 0, Target = 0
					; Sample script For creating an installer For a 32-bit Xojo desktop app
					; To use this script, specify the values For the two constants
					; below With those For your app And project.
					; XojoAppName Is the name Of the build app without the ".exe" extension.
					#define XojoAppName            "LeapData"
					; XojoProjectName Is the name Of the project file, including its extension.
					#define XojoProjectName        "TSVtoSQLite.xojo_project"
					
					[Setup]
					; NOTE: The value Of AppId uniquely identifies this application.
					; Do Not use the same AppId value In installers For other applications.
					; (To generate a New GUID, click Tools | Generate GUID from the menu.)
					AppId={4AF0B9EE-2A29-4E8D-8A8F-0F2F8D1E39F0}
					AppName={#TSVtoSQLite}
					AppVerName={#TSVtoSQLite} 1.0
					AppPublisher=JHLConsultants
					AppPublisherURL=
					AppSupportURL=
					AppUpdatesURL=
					DefaultDirName={pf}\\{#XojoAppName}
					DefaultGroupName={#XojoAppName}
					; save installer file alongside this script
					OutputDir=.
					OutputBaseFilename=Setup{#XojoAppName}
					; If you have an End User License Agreement (EULA) that you want the user To agree To before letting the install Continue,
					; put the path To it here.
					LicenseFile=
					Compression=lzma
					SolidCompression=yes
					ChangesAssociations=yes
					; Require Windows Vista Or later
					MinVersion=0,6.0.6001
					
					[Languages]
					Name: "english"; MessagesFile: "compiler:Default.isl"
					
					[Tasks]
					Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
					
					; These directories will be created by the installer inside the DefaultDirName
					; (defined above).
					[Dirs]
					Name: "{app}\\{#XojoAppName} Libs"
					Name: "{app}\\{#XojoAppName} Resources"
					
					; These are the files To include.  By default you want To include
					; the EXE plus the Libs And Resources folders
					; but you can include any other files you like As well.
					[Files]
					Source: ".\\{#XojoAppName}\\Desktop\\Builds - {#XojoProjectName}\\Windows\\{#XojoAppName}\\{#XojoAppName}.exe"; DestDir: "{app}"; Flags: ignoreversion
					Source: ".\\{#XojoAppName}\\Desktop\\Builds - {#XojoProjectName}\\Windows\\{#XojoAppName}\\{#XojoAppName} Libs\\*"; DestDir: "{app}\\{#XojoAppName} Libs"; Flags: ignoreversion recursesubdirs createallsubdirs
					Source: ".\\{#XojoAppName}\\Desktop\\Builds - {#XojoProjectName}\\Windows\\{#XojoAppName}\\{#XojoAppName} Resources\\*"; DestDir: "{app}\\{#XojoAppName} Resources"; Flags: ignoreversion recursesubdirs createallsubdirs
					
					; NOTE: Don't use "Flags: ignoreversion" on any shared system files
					
					; Creates icons/links In the Start Menu And/Or the desktop If the user chooses during installation.
					[Icons]
					Name: "{group}\\{#XojoAppName}"; Filename: "{app}\\{#XojoAppName}.exe"
					Name: "{commondesktop}\\{#XojoAppName}"; Filename: "{app}\\{#XojoAppName}.exe"; Tasks: desktopicon
					
					; Give the user the option To run the app after the installation Is finished.
					[Run]
					Filename: "{app}\\{#XojoAppName}.exe"; Description: "{cm:LaunchProgram,{#XojoAppName}}"; Flags: nowait postinstall skipifsilent
					
					; This specifies the Visual C++ Windows Runtime Redistributable To also install because
					; it Is required by Xojo apps made With 2016r1 Or later.
					[Files]
					Source: "C:\\Program Files (x86)\\Xojo\\Xojo 2016r1.1\\Extras\\Windows Runtime\\Installers\\VC_redist.x86.exe"; DestDir: {tmp}
					
					[Run]
					Filename: {tmp}\\VC_redist.x86.exe; Parameters: "/install /quiet /norestart"; StatusMsg: "Installing 32-bit Windows Universal runtime..."; Flags: waituntilterminated
					
					
				End
			End
#tag EndBuildAutomation

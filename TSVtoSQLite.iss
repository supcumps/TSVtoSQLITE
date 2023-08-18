  ; Sample script for creating an installer for a 32-bit Xojo desktop app
  ; To use this script, specify the values for the two constants
  ; below with those for your app and project.
  ; XojoAppName is the name of the build app without the ".exe" extension.
  #define XojoAppName            "TSVtoSQLite"
  ; XojoProjectName is the name of the project file, including its extension.
  #define XojoProjectName        "TSVtoSQLite.xojo_project"

  [Setup]
  ; NOTE: The value of AppId uniquely identifies this application.
  ; Do not use the same AppId value in installers for other applications.
  ; (To generate a new GUID, click Tools | Generate GUID from the menu.)
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
  ; If you have an End User License Agreement (EULA) that you want the user to agree to before letting the install continue,
  ; put the path to it here.
  LicenseFile=
  Compression=lzma
  SolidCompression=yes
  ChangesAssociations=yes
  ; Require Windows Vista or later
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

  ; These are the files to include.  By default you want to include
  ; the EXE plus the Libs and Resources folders
  ; but you can include any other files you like as well.
  [Files]
  Source: ".\\{#XojoAppName}\\Desktop\\Builds - {#XojoProjectName}\\Windows\\{#XojoAppName}\\{#XojoAppName}.exe"; DestDir: "{app}"; Flags: ignoreversion
  Source: ".\\{#XojoAppName}\\Desktop\\Builds - {#XojoProjectName}\\Windows\\{#XojoAppName}\\{#XojoAppName} Libs\\*"; DestDir: "{app}\\{#XojoAppName} Libs"; Flags: ignoreversion recursesubdirs createallsubdirs
  Source: ".\\{#XojoAppName}\\Desktop\\Builds - {#XojoProjectName}\\Windows\\{#XojoAppName}\\{#XojoAppName} Resources\\*"; DestDir: "{app}\\{#XojoAppName} Resources"; Flags: ignoreversion recursesubdirs createallsubdirs

  ; NOTE: Don't use "Flags: ignoreversion" on any shared system files

  ; Creates icons/links in the Start Menu and/or the desktop if the user chooses during installation.
  [Icons]
  Name: "{group}\\{#XojoAppName}"; Filename: "{app}\\{#XojoAppName}.exe"
  Name: "{commondesktop}\\{#XojoAppName}"; Filename: "{app}\\{#XojoAppName}.exe"; Tasks: desktopicon

  ; Give the user the option to run the app after the installation is finished.
  [Run]
  Filename: "{app}\\{#XojoAppName}.exe"; Description: "{cm:LaunchProgram,{#XojoAppName}}"; Flags: nowait postinstall skipifsilent

  ; This specifies the Visual C++ Windows Runtime Redistributable to also install because
  ; it is required by Xojo apps made with 2016r1 or later.
  [Files]
  Source: "C:\\Program Files (x86)\\Xojo\\Xojo 2016r1.1\\Extras\\Windows Runtime\\Installers\\VC_redist.x86.exe"; DestDir: {tmp}

  [Run]
  Filename: {tmp}\\VC_redist.x86.exe; Parameters: "/install /quiet /norestart"; StatusMsg: "Installing 32-bit Windows Universal runtime..."; Flags: waituntilterminated


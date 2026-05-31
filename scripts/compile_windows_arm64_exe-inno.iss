; Inno Setup script for LocalSend Windows ARM64
; Based on the original compile_windows_exe-inno.iss

#define MyAppName "LocalSend"
#define MyAppVersion "1.17.0"
#define MyAppPublisher "Tien Do Nam"
#define MyAppURL "https://localsend.org"
#define MyAppExeName "localsend_app.exe"

[Setup]
AppId={{00809252-FEC6-448E-83B4-E7F55AE7E47D}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DisableProgramGroupPage=yes
PrivilegesRequiredOverridesAllowed=dialog
OutputDir=..\output
OutputBaseFilename=LocalSend-{#MyAppVersion}-windows-arm64-installer
SetupIconFile=..\staging\logo.ico
UninstallDisplayIcon={app}\{#MyAppExeName}
Compression=lzma
SolidCompression=yes
WizardStyle=modern
ArchitecturesAllowed=arm64
ArchitecturesInstallIn64BitMode=arm64

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "chinesesimplified"; MessagesFile: "Languages\ChineseSimplified.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "..\staging\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\staging\*.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\staging\data\*"; DestDir: "{app}\data"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\staging\settings.json"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}";
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[CmdletBinding()]
param
(
)

Set-StrictMode -Version Latest

function CheckGitInstall {
    if (-not (Test-Path -LiteralPath 'env:EXTENSIONTEMPLATE_GITINSTALLCHECKED') -or $Global:EXTENSIONTEMPLATE_GITINSTALLCHECKED -eq 'N') {
        if (-not (cmd /c where git)) {
            Write-Host
            Write-Host -Object 'Git is not installed! Install Git from https://git-scm.com/' -ForegroundColor Red
            pause
            exit
        }
    }
    $Global:EXTENSIONTEMPLATE_GITINSTALLCHECKED = 'Y'
}

if (-not (Test-Path -LiteralPath 'env:EXTENSIONTEMPLATE_UPDATECHECKED') -or $env:EXTENSIONTEMPLATE_UPDATECHECKED -eq 'N') {
    Write-Host -Object @'


     ███████╗██╗  ██╗████████╗███████╗███╗   ██╗███████╗██╗ ██████╗ ███╗   ██╗ 
     ██╔════╝╚██╗██╔╝╚══██╔══╝██╔════╝████╗  ██║██╔════╝██║██╔═══██╗████╗  ██║ 
     █████╗   ╚███╔╝    ██║   █████╗  ██╔██╗ ██║███████╗██║██║   ██║██╔██╗ ██║ 
     ██╔══╝   ██╔██╗    ██║   ██╔══╝  ██║╚██╗██║╚════██║██║██║   ██║██║╚██╗██║ 
     ███████╗██╔╝ ██╗   ██║   ███████╗██║ ╚████║███████║██║╚██████╔╝██║ ╚████║ 
     ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝ 
     
     ████████╗███████╗███╗   ███╗██████╗ ██╗      █████╗ ████████╗███████╗
     ╚══██╔══╝██╔════╝████╗ ████║██╔══██╗██║     ██╔══██╗╚══██╔══╝██╔════╝
        ██║   █████╗  ██╔████╔██║██████╔╝██║     ███████║   ██║   █████╗  
        ██║   ██╔══╝  ██║╚██╔╝██║██╔═══╝ ██║     ██╔══██║   ██║   ██╔══╝  
        ██║   ███████╗██║ ╚═╝ ██║██║     ███████╗██║  ██║   ██║   ███████╗
        ╚═╝   ╚══════╝╚═╝     ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝
       
       
'@ -ForegroundColor DarkGray

    Write-Host -Object 'Thank you for using this extension template.' -ForegroundColor Green
    Write-Host

    Write-Host -Object 'Using latest version of extension template...'
    CheckGitInstall
   
    $env:EXTENSIONTEMPLATE_TEMP = [System.IO.Path]::GetTempFileName()
    Remove-Item -LiteralPath $env:EXTENSIONTEMPLATE_TEMP -Recurse -Force -ErrorAction SilentlyContinue
    New-Item -ItemType Directory -Path $env:EXTENSIONTEMPLATE_TEMP -Force | Out-Null
    try {
        git clone --single-branch --branch WIP https://dev.azure.com/softera-baltic/LBC-SofteraExtended/_git/ExtensionTemplate $env:EXTENSIONTEMPLATE_TEMP
    
        $env:EXTENSIONTEMPLATE_UPDATECHECKED = 'Y'
        . "$env:EXTENSIONTEMPLATE_TEMP\ExtensionTemplate.ps1"
    } finally {
        Remove-Item -LiteralPath $env:EXTENSIONTEMPLATE_TEMP -Recurse -Force -ErrorAction SilentlyContinue
    }
    $env:EXTENSIONTEMPLATE_UPDATECHECKED = 'N'
    return
}

CheckGitInstall



$WorkspaceTemplate = @'
{
	"folders": [
		{
			"path": "MainApp"
		},
		{
			"path": "TestApp"
		},
		{
			"path": "."
		}
	],
	"settings": {
		"files.exclude": {
			"**/*.code-workspace": true,
			"MainApp/": true,
			"TestApp/": true
		},
		"[al]": {
			"files.trimTrailingWhitespace": true,
			"files.trimFinalNewlines": true,
		},
		"al.enableCodeAnalysis": true,
		"al.codeAnalyzers": [
			"${CodeCop}",
			"${UICop}",
			"${PerTenantExtensionCop}",
			"${AppSourceCop}"
		],
		"al.ruleSetPath": "./al.ruleset.json",
		"CRS.OnSaveAlFileAction": "Reorganize",
		"CRS.ObjectNamePrefix": ">>>EXTENSIONTEMPLATE_PREFIX<<< ",
		"CRS.RemovePrefixFromFilename": true,
		"CRS.FileNamePattern": "<ObjectNameShort>.<ObjectTypeShortPascalCase>.al",
		"CRS.FileNamePatternExtensions": "<ObjectNameShort>.<ObjectTypeShortPascalCase>.al",
		"CRS.FileNamePatternPageCustomizations": "<ObjectNameShort>.<ObjectTypeShortPascalCase>.al"
	}
}
'@

$ManifestTemplate = @'
{
  "id": ">>>EXTENSIONTEMPLATE_APPID<<<",
  "name": ">>>EXTENSIONTEMPLATE_APPNAME<<<",
  "publisher": ">>>EXTENSIONTEMPLATE_PUBLISHER<<<",
  "version": "1.0.0.0",
  "brief": ">>>EXTENSIONTEMPLATE_APPNAME<<<",
  "description": ">>>EXTENSIONTEMPLATE_APPNAME<<<",
  "privacyStatement": ">>>EXTENSIONTEMPLATE_HOMEPAGE<<<",
  "EULA": ">>>EXTENSIONTEMPLATE_HOMEPAGE<<<",
  "help": ">>>EXTENSIONTEMPLATE_HOMEPAGE<<<",
  "url": ">>>EXTENSIONTEMPLATE_HOMEPAGE<<<",
  "contextSensitiveHelpUrl": ">>>EXTENSIONTEMPLATE_HOMEPAGE<<<",
  "logo": "logo-lt.png",
  "dependencies": [>>>EXTENSIONTEMPLATE_DEPENDECIES<<<],
  "screenshots": [],
  "platform": ">>>EXTENSIONTEMPLATE_PLATFORM<<<",
  "application": ">>>EXTENSIONTEMPLATE_APPLICATION<<<",
  "idRanges": [
    {
      "from": 0,
      "to": 0
    }
  ],
  "showMyCode": true,
  "runtime": ">>>EXTENSIONTEMPLATE_RUNTIME<<<",
  "features": [
    "TranslationFile"
  ],
  "supportedLocales": ["en-US", "lt-LT"]
}
'@

$AppSourceCopTemplate = @'
{
    "mandatoryAffixes": [">>>EXTENSIONTEMPLATE_PREFIX<<<"],
    "version": "1.0.0.0",
    "supportedCountries": ["US"]
}
'@

if (Get-Item -Path .\*.code-workspace -Exclude RenameMe.code-workspace) {
    Write-Host
    Write-Host -Object 'Project is already configured.' -ForegroundColor Red
    pause
    exit
}

if (Get-ChildItem -Force) {
    Write-Host
    Write-Host -Object "Folder $($PWD.ProviderPath) will be cleared and reinitialized using the latest extension template." -ForegroundColor Red
    Write-Host
    Write-Host -Object 'ALL FILES WILL BE DELETED. NEW FILES WILL BE COPIED FROM THE LATEST EXTENSION TEMPLATE!' -ForegroundColor Red
    Write-Host
    :ConfirmInitialize for (;;) {
        switch -Regex -CaseSensitive (Read-Host -Prompt @'
Initialize folder using the extension template?

                (NO/YES)
'@)
        {
            '[nN][oO]?' { break ConfirmInitialize }
            'YES' { break }
            default { continue }
        }

        Write-Host -Object 'Replacing extension template in the current folder...' -ForegroundColor DarkYellow
        Remove-Item -Path * -Recurse -Force
        Copy-Item -Path "$env:EXTENSIONTEMPLATE_TEMP\*" -Destination . -Exclude .git -Recurse -Force
        Write-Host -Object 'Using the latest extension template files.' -ForegroundColor DarkYellow
        break ConfirmInitialize
    }
}

if (Test-Path -LiteralPath .\.git) {
    Write-Host
    Write-Warning -Message 'Folder is a Git repository!'
    :ConfirmReinitializeGitRepo for (;;) {
        switch -Regex -CaseSensitive (Read-Host -Prompt @'
Reinitialize Git repository?

GIT HISTORY WILL BE LOST!!!

DO THIS ONLY IF YOU HAVE COPIED .git DIRECTORY FROM EXTENSION TEMPLATE!!!

                (NO/YES)
'@)
        {
            '[nN][oO]?' { break ConfirmReinitializeGitRepo }
            'YES' { break }
            default { continue }
        }

        Remove-Item -LiteralPath .\.git -Recurse -Force
        break ConfirmReinitializeGitRepo
    }
}
if (-not (Test-Path -LiteralPath .\.git)) {
    git init
} elseif (git status --short) {
    Write-Host
    Write-Host -Object 'Git index is not empty! Please commit AND push all needed files before running this command to prevent data loss.' -ForegroundColor Red
    pause
    return
}

Write-Host
Write-Host -Object 'This setup will help you to configure extension for AL development.' -ForegroundColor Green

Write-Host
Write-Host -Object 'First, specify AL extension properties.' -ForegroundColor Green
$AppName = ''
$AppPublisher = 'Softera Baltic'
$HomePage = 'https://www.softera.lt'
$RuntimeVersion = '5.0'
$Prefix = 'DEMO'
:SetupManifest for (;;) {
    do {
        $AppName, $null = @((Read-Host -Prompt "Application name [$AppName]"); $AppName) -ne ''
    } while ([string]$AppName -eq '')

    do {
        $AppPublisher, $null = @((Read-Host -Prompt "Publisher name [$AppPublisher]"); $AppPublisher) -ne ''
    } while ([string]$AppPublisher -eq '')

    :SetupHomePage for (;;) {
        $HomePage, $null = @((Read-Host -Prompt "Publisher/application home page [$HomePage]"); $HomePage) -ne ''
        if ($HomePage -eq '') {
            Write-Host -Object "Home page $HomePage is not valid." -ForegroundColor Red
        } else {
            if ($HomePage -match '^http(s?)\:\/\/[0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*(:(0-9)*)*(\/?)([a-zA-Z0-9\-\.\?\,\''\/\\\+&%\$#_]*)?') { break }
            Write-Host -Object "Home page $HomePage does not exist." -ForegroundColor Red
            :ConfirmHomePage for (;;) {
                switch -Regex (Read-Host -Prompt 'Use specified home page anyway? (Yes/No)')
                {
                    'no?' { break ConfirmHomePage }
                    'y(?:es)?' { break SetupHomePage }
                }
            }
        }
    }

    for (;;) {
        Write-Host -Object 'Valid runtime versions are: 2.0 - BC13' -ForegroundColor Green
        Write-Host -Object '                            3.0 - BC14' -ForegroundColor Green
        Write-Host -Object '                            4.0 - BC15' -ForegroundColor Green
        Write-Host -Object '                            5.0 - BC16' -ForegroundColor Green
        Write-Host -Object '                            6.0 - BC17' -ForegroundColor Green
        $RuntimeVersion, $null = @((Read-Host -Prompt "Runtime version [$RuntimeVersion]"); $RuntimeVersion) -ne ''
        if ($RuntimeVersion -in @('2.0', '3.0', '4.0', '5.0', '6.0')) { break }
        Write-Host -Object "RuntimeVersion $RuntimeVersion is not valid." -ForegroundColor Red
    }

    do {
        $Prefix, $null = @((Read-Host -Prompt "Prefix [$Prefix]"); $Prefix) -ne ''
    } while ([string]$Prefix -eq '')

    # TODO: al.ruleset.json rule for ignoring TranslationFile requirement.
    # TODO: al.ruleset.json rule for ignoring missing previous app version requirement (AppSourcCop.json)
    # TODO: al.ruleset.json for changing some warnings to errors - to deal with them proactively

    Write-Host
    Write-Host -Object 'Please double-check configuration:' -ForegroundColor Green
    Write-Host -Object "Application name: $AppName"
    Write-Host -Object "Application publisher: $AppPublisher"
    Write-Host -Object "Publisher/application home page: $HomePage"
    Write-Host -Object "Runtime version: $RuntimeVersion"
    Write-Host -Object "Prefix: $Prefix (e.g. `"$Prefix My Object`")"
    Write-Host
    :RequestConfirmation for (;;) {
        switch -Regex (Read-Host -Prompt 'Does this look good? (Yes/No)')
        {
            'y(?:es)?' { break SetupManifest }
            'no?' { break RequestConfirmation }
        }
    }
}

Write-Host

Write-Host -Object 'Creating workspace file...' -ForegroundColor Green
$Workspace = $WorkspaceTemplate
$Workspace = $Workspace -replace '>>>EXTENSIONTEMPLATE_PREFIX<<<', ($Prefix -replace '"', '\"')
$Pattern = ([System.IO.Path]::GetInvalidFileNameChars() | ForEach-Object -Process { [regex]::Escape($_) }) -join '|'
$WorkspaceFile = ".\$($AppName -replace $Pattern, ' ').code-workspace"
$Workspace | Out-File -FilePath $WorkspaceFile -NoNewline -Encoding utf8

Write-Host -Object 'Creating application manifest file...' -ForegroundColor Green
$Platform, $Application, $Dependencies = switch ($RuntimeVersion) {
    '2.0' { '13.0.0.0', '13.0.0.0', '' }
    '3.0' { '14.0.0.0', '14.0.0.0', '' }
    '4.0' { '15.0.0.0', '',         '' }
    '5.0' { '16.0.0.0', '16.0.0.0', '' }
    '6.0' { '17.0.0.0', '17.0.0.0', '' }
}
$ApplicationPattern = '>>>EXTENSIONTEMPLATE_APPLICATION<<<'
if ($RuntimeVersion -eq '4.0') {
    $ApplicationPattern = "`r`n  `"application`": `">>>EXTENSIONTEMPLATE_APPLICATION<<<`",?"
    $Dependencies = @'

    {
      "appId": "63ca2fa4-4f03-4f2b-a480-172fef340d3f",
      "publisher": "Microsoft",
      "name": "System Application",
      "version": "1.0.0.0"
    },
    {
      "appId": "437dbf0e-84ff-417a-965d-ed2bb9650972",
      "publisher": "Microsoft",
      "name": "Base Application",
      "version": "15.0.0.0"
    }
  
'@
}
$Manifest = $ManifestTemplate
$Manifest = $Manifest -replace '>>>EXTENSIONTEMPLATE_APPID<<<', [guid]::NewGuid().ToString().ToLower()
$Manifest = $Manifest -replace '>>>EXTENSIONTEMPLATE_APPNAME<<<', ($AppName -replace '"', '\"')
$Manifest = $Manifest -replace '>>>EXTENSIONTEMPLATE_PUBLISHER<<<', ($AppPublisher -replace '"', '\"')
$Manifest = $Manifest -replace '>>>EXTENSIONTEMPLATE_HOMEPAGE<<<', ($HomePage -replace '"', '\"')
$Manifest = $Manifest -replace '>>>EXTENSIONTEMPLATE_DEPENDECIES<<<', $Dependencies
$Manifest = $Manifest -replace '>>>EXTENSIONTEMPLATE_PLATFORM<<<', $Platform
$Manifest = $Manifest -replace $ApplicationPattern, $Application
$Manifest = $Manifest -replace '>>>EXTENSIONTEMPLATE_RUNTIME<<<', $RuntimeVersion
$Manifest | Out-File -FilePath ".\MainApp\app.json" -NoNewline -Encoding utf8

Write-Host -Object 'Creating AppSourceCop settings file...' -ForegroundColor Green
$AppSourceCop = $AppSourceCopTemplate
$AppSourceCop = $AppSourceCop -replace '>>>EXTENSIONTEMPLATE_PREFIX<<<', ($Prefix -replace '"', '\"')
$AppSourceCop | Out-File -FilePath ".\MainApp\AppSourceCop.json" -NoNewline -Encoding utf8

Write-Host
Write-Host -Object 'Extension template configured.' -ForegroundColor Green

Write-Host
Write-Host -Object 'Remaining manual steps:' -ForegroundColor Yellow
Write-Host -Object '  * Set object ID range in app.json file;' -ForegroundColor Yellow

Write-Host
Write-Host -Object 'Happy coding!' -ForegroundColor Green

& code --new-window $WorkspaceFile .\MainApp\app.json .\MainApp\al.ruleset.json .\MainApp\AppSourceCop.json

pause
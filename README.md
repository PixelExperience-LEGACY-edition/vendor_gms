This project aims to bring GMS support to AOSP builds, directly extracted from Pixel devices factory rom.

The proprietary files are extracted, using the extract-files.sh script, from the Pixel factory rom and the overlay's are reversed from Pixel factory rom and gms GSI.

This repository was created under the assumption that these are the sections of GMS apps:


GMS mandatory core packages:
```
AndroidAutoStub
AndroidPlatformServices
ConfigUpdater
GoogleExtShared
GoogleFeedback
GoogleLocationHistory
GoogleOneTimeInitializer
GooglePackageInstaller
GooglePartnerSetup
GooglePrintRecommendationService
GoogleRestore
GoogleServicesFramework
GoogleCalendarSyncAdapter
GoogleContactsSyncAdapter
SpeechServicesByGoogle
GmsCore
Phonesky
SetupWizard
WebViewGoogle
Wellbeing
```

GMS mandatory application packages
```
Chrome
Drive
Gmail2
Duo
Maps
YTMusic
Photos
Velvet
Videos
YouTube
```

GMS optional application packages
```
CalendarGoogle
DeskClockGoogle
LatinImeGoogle
TagGoogle
talkback
Keep
CalculatorGoogle
FilesGoogle
```

Additionally the following Pixel specific apps are included:
```
PixelThemesStub
MarkupGoogle
DeviceIntelligenceNetworkPrebuilt
DevicePersonalizationPrebuiltPixel2020
SettingsIntelligenceGooglePrebuilt
NexusLauncherRelease
PixelSetupWizard
WallpaperPickerGoogleRelease
DocumentsUIGoogle
```

# Kumaran Nagar Residents Welfare — Android project

This ZIP contains an Android Studio Trusted Web Activity (TWA) project linked to:
https://society-connect-senthil.senven-kumar.chatgpt.site/

It is an Android launcher for the hosted website, not a copy of the website source,
resident database, APK, or signed Play Store bundle. Internet is required. Web
features and data remain on the hosted Site. No credentials or resident records
are embedded. The home symbol is a placeholder icon; replace it with your logo.

## 1. Open and build on Windows

1. Extract this ZIP. Install Android Studio supporting Android Gradle Plugin
   8.13.2, a compatible JDK (17 or 21), and Android SDK platform 36.
2. In PowerShell, inside the extracted project folder run `./setup-gradle.ps1`.
   The script downloads Gradle 8.13 from Gradle's official distribution service
   and checks its published SHA-256. This requires internet access.
   If local script execution is blocked, install Gradle 8.13 manually from
   https://gradle.org/releases/ and use that installation instead.
3. Open this folder in Android Studio. Under Settings > Build, Execution,
   Deployment > Build Tools > Gradle, select a local Gradle distribution and
   choose `.tools/gradle-8.13` (or your manual installation). Select JDK 17/21.
4. Sync the project. Allow Android Studio to download SDK/dependencies.
5. Run on an Android device with an updated supported browser such as Chrome.
   You can also generate the standard wrapper using the command printed by
   setup-gradle.ps1, after the Android SDK is configured.

The standard Gradle wrapper binaries could not be downloaded in the preparation
environment, so the ZIP includes this explicit setup script instead. An Android
SDK was unavailable here: this project has not been compiled or device-tested.

## 2. Before enabling full-screen TWA

Until Digital Asset Links verification succeeds, the browser normally displays
its toolbar. This is expected. Authentication redirects to other origins can
also show browser UI. Test the entire sign-in and sign-out journey.

1. Choose the permanent application ID. The suggested ID is
   `org.kumarannagar.residents`; availability/ownership has not been verified.
   If changed, update app/build.gradle and website/assetlinks.json.template.
2. Create the app in Play Console and configure Play App Signing. Copy the
   **app signing certificate SHA-256** from Play Console, not just the upload
   certificate. Replace the placeholder in website/assetlinks.json.template.
3. Publish that JSON on the website at:
   https://society-connect-senthil.senven-kumar.chatgpt.site/.well-known/assetlinks.json
   It must return HTTP 200, JSON content type, without login or redirects.
   Confirm that the hosting access gate permits this unauthenticated file.
   If that cannot be configured on this domain, use suitable hosting/domain
   before planning a full-screen TWA release; update all URL references.
4. Do not publish the template with its placeholder fingerprint. No website
   hosting or access changes were made by generating this ZIP.

## 3. Resident access and data

The last inspected Site access configuration allowed only the owner account.
Packaging does not grant access to residents. Configure intended resident access
and working Google reviewer instructions before testing. Keep sensitive resident
and financial records protected by server-side authorization. Verify actual
multi-user data sharing, persistence, role restrictions and backups; none of
these capabilities are supplied or audited by this Android wrapper.

## 4. Create the signed Play Store file

In Android Studio choose Build > Generate Signed App Bundle / APK > Android
App Bundle. Create or select your upload keystore, keep it and its password
secure, select release, and generate the signed `.aab`. No signing keys are
included in this archive. The release Gradle task alone is not signed.
The output is normally under app/build/outputs/bundle/release/.

Complete the store listing, privacy policy, Data safety declarations, content
rating, app access instructions, and any applicable account deletion process.
Check the current Play target API and policy requirements before submission.
For personal developer accounts created after 13 November 2023, the current
production-access process requires at least 12 continuously opted-in closed
testers for 14 days, followed by an application for production access.
Google approval is not guaranteed by packaging a website.

## 5. Device checklist

- Sign in/out as a resident and reviewer; test access from a non-owner account.
- Verify all actual forms, records, uploads, downloads, links and roles.
- Check Android Back, rotation, large text, keyboard, app relaunch, network loss.
- Verify the installed Play-signed build validates the asset links.
- Confirm the privacy disclosures match actual website and SDK behavior.

## Official references

- https://developer.android.com/develop/ui/views/layout/webapps/trusted-web-activities
- https://github.com/GoogleChrome/android-browser-helper
- https://developer.android.com/build/releases/agp-8-13-0-release-notes
- https://support.google.com/googleplay/android-developer/answer/6112435
- https://support.google.com/googleplay/android-developer/answer/14151465
- https://support.google.com/googleplay/android-developer/answer/9859455

Prepared 3 November 2026. This is an editable source package for Android setup;
it has not been published to Google Play.

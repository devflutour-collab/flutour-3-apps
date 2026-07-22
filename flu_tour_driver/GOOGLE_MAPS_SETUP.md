# Google Maps Setup Guide for FluTour APK

## Quick Setup

The FluTour app uses Google Maps for displaying the Luxor tour location. Follow these steps to enable it.

## Step 1: Get Your Google Maps API Key

### Option A: Using Google Cloud Console

1. **Go to Google Cloud Console:**
   - Visit: https://console.cloud.google.com/

2. **Create a New Project:**
   - Click on the project dropdown at the top
   - Click "NEW PROJECT"
   - Enter "FluTour" as the project name
   - Click "CREATE"

3. **Enable Maps APIs:**
   - In the left sidebar, click "APIs & Services" → "Library"
   - Search for "Maps SDK for Android"
   - Click on it and press "ENABLE"
   - Also search for and enable "Google Maps Platform"

4. **Create API Key:**
   - Go to "APIs & Services" → "Credentials"
   - Click "CREATE CREDENTIALS" → "API Key"
   - Copy the generated API key

### Option B: Using Firebase Console (Recommended for Flutter)

1. **Go to Firebase Console:**
   - Visit: https://console.firebase.google.com/

2. **Create or Select Your Project:**
   - Click "Add project"
   - Name it "FluTour"
   - Enable Google Analytics if desired
   - Click "Create project"

3. **Configure Maps:**
   - In the left menu, go to "Build" → "Authentication"
   - Go to "Project settings" → "Google Cloud Console"
   - Enable Maps SDK for Android in the APIs Library

4. **Get API Key:**
   - Go to "Credentials"
   - Create an API Key
   - Copy the key

## Step 2: Add Your API Key to Android Configuration

### Method 1: Edit AndroidManifest.xml

1. **Open the file:**
   ```
   android/app/src/main/AndroidManifest.xml
   ```

2. **Find this line:**
   ```xml
   <meta-data
       android:name="com.google.android.geo.API_KEY"
       android:value="YOUR_API_KEY"/>
   ```

3. **Replace "YOUR_API_KEY" with your actual API key:**
   ```xml
   <meta-data
       android:name="com.google.android.geo.API_KEY"
       android:value="AIzaSyDxxx...your_actual_key_here"/>
   ```

### Method 2: Using Environment Variable (Recommended)

1. **Create a local.properties file in the android directory** (if not exists)

2. **Add your API key:**
   ```
   google.maps.api.key=AIzaSyDxxx...your_actual_key_here
   ```

3. **Update build.gradle.kts:**
   ```kotlin
   android {
       // ... other config
       buildTypes {
           release {
               buildConfigField("String", "MAPS_API_KEY", "\"${project.properties['google.maps.api.key']}\"")
           }
       }
   }
   ```

## Step 3: Configure for iOS (Optional)

If building for iOS, you also need to add the API key:

1. **Open ios/Runner/Info.plist**

2. **Add the following keys:**
   ```xml
   <dict>
       <!-- ... other keys ... -->
       <key>GCM_API_KEY</key>
       <string>YOUR_API_KEY</string>
   </dict>
   ```

## Step 4: Restrict Your API Key (Security)

To prevent unauthorized use of your API key:

1. **In Google Cloud Console:**
   - Go to "Credentials"
   - Click on your API Key
   - Under "Application restrictions," select "Android apps"
   - Click "Add package name and fingerprint"
   - Add your app's package name: `com.example.flu_tour_apk`

2. **Get Your SHA-1 Fingerprint:**
   ```bash
   cd android
   ./gradlew signingReport
   ```
   - Copy the SHA1 value from debug or release keystore

3. **Add to API Key:**
   - Paste the package name and SHA-1 fingerprint in the API key restrictions

## Step 5: Build and Test

1. **Get dependencies:**
   ```bash
   flutter pub get
   ```

2. **Run the app:**
   ```bash
   flutter run
   ```

3. **Navigate to the Map Picker screen:**
   - Go through: Welcome → Role Selection → Login → Location → Map Picker
   - You should see the Google Map with Luxor location

4. **Build APK:**
   ```bash
   flutter build apk --release
   ```

## Troubleshooting

### Map shows blank/empty
- **Cause:** API key not configured or invalid
- **Solution:** Double-check the API key in AndroidManifest.xml

### "Google Play services not available" error
- **Cause:** Device doesn't have Google Play Services installed
- **Solution:** Use a real device or emulator with Google Play Services

### "Invalid API key" error
- **Cause:** API key not enabled for Maps SDK
- **Solution:** Go to Google Cloud Console and enable "Maps SDK for Android"

### Map displays but no tiles load
- **Cause:** Network issue or API quota exceeded
- **Solution:** Check internet connection or increase API quota in Google Cloud

### "Permission denied" errors
- **Cause:** App permissions not granted
- **Solution:** The app requests location permissions at runtime. Grant them when prompted.

## Custom Tile Provider

The app uses the following custom Google Maps tile URL:
```
http://mt0.google.com/vt/lyrs=m&hl=en&x={x}&y={y}&z={z}
```

**Parameters:**
- `lyrs=m` - Map tiles (m = map, s = satellite, t = terrain, h = hybrid)
- `hl=en` - Language (en = English)
- `x={x}&y={y}&z={z}` - Tile coordinates (automatically filled by the library)

## API Quota and Pricing

**Free Tier Includes:**
- 25,000 Maps loads per 24 hours
- Additional charges after free tier

**To manage costs:**
1. Set daily quota limits in Google Cloud Console
2. Restrict API key to your app only
3. Monitor usage in the API dashboard

## Additional Resources

- **Google Maps Flutter Documentation:**
  https://pub.dev/packages/google_maps_flutter

- **Google Cloud Console:**
  https://console.cloud.google.com/

- **Maps API Documentation:**
  https://developers.google.com/maps/documentation/maps-static/overview

- **Flutter Location Permissions:**
  https://pub.dev/packages/geolocator

## Support

For issues:
1. Check Google Cloud Console for API errors
2. Verify API key restrictions match your app
3. Ensure AndroidManifest.xml is correctly updated
4. Run `flutter clean` and rebuild
5. Check Flutter/Dart documentation for dependency issues

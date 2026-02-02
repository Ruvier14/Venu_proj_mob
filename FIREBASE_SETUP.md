# Firebase Setup Guide for Venu Mobile App

This guide will help you set up Firebase for the Venu mobile application.

## Prerequisites

1. A Google account
2. Flutter installed on your system
3. Firebase CLI installed: `npm install -g firebase-tools`

## Step-by-Step Setup

### 1. Create a Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Add project" or select an existing project
3. Enter project name: "venu-mobile" (or your preferred name)
4. Follow the setup wizard (enable Google Analytics if desired)
5. Click "Create project"

### 2. Enable Authentication

1. In your Firebase project, go to "Authentication" in the left sidebar
2. Click "Get started"
3. Go to the "Sign-in method" tab
4. Enable "Email/Password" provider:
   - Click on "Email/Password"
   - Toggle "Enable"
   - Click "Save"

### 3. Configure Firebase for Flutter

#### Option A: Using FlutterFire CLI (Recommended)

```bash
# Install FlutterFire CLI
dart pub global activate flutterfire_cli

# Make sure it's in your PATH
export PATH="$PATH":"$HOME/.pub-cache/bin"

# Login to Firebase
firebase login

# Navigate to your project directory
cd Venu_proj_mob

# Configure Firebase for your Flutter app
flutterfire configure
```

The `flutterfire configure` command will:
- Prompt you to select your Firebase project
- Ask which platforms you want to support (Android, iOS, Web, macOS)
- Automatically generate `lib/firebase_options.dart` with your configuration
- Register your app with Firebase for each selected platform

#### Option B: Manual Configuration

If you prefer to configure manually or the CLI doesn't work:

##### For Android:

1. In Firebase Console, click the Android icon to add an Android app
2. Register app with package name: `com.example.venu_proj_mob`
3. Download `google-services.json`
4. Place it in `android/app/google-services.json`
5. Add to `android/build.gradle`:
   ```gradle
   dependencies {
       classpath 'com.google.gms:google-services:4.3.15'
   }
   ```
6. Add to `android/app/build.gradle`:
   ```gradle
   apply plugin: 'com.google.gms.google-services'
   ```

##### For iOS:

1. In Firebase Console, click the iOS icon to add an iOS app
2. Register app with bundle ID: `com.example.venuProjMob`
3. Download `GoogleService-Info.plist`
4. Open Xcode: `open ios/Runner.xcworkspace`
5. Drag `GoogleService-Info.plist` into the Runner folder in Xcode
6. Make sure "Copy items if needed" is checked

##### For Web:

1. In Firebase Console, click the Web icon to add a Web app
2. Register your app
3. Copy the Firebase configuration
4. Update `lib/firebase_options.dart` with the web configuration values

### 4. Update Firebase Configuration

After running `flutterfire configure`, your `lib/firebase_options.dart` file will be automatically generated with the correct values. 

If you configured manually, update the placeholder values in `lib/firebase_options.dart` with your actual Firebase project credentials:

```dart
static const FirebaseOptions web = FirebaseOptions(
  apiKey: 'YOUR_ACTUAL_WEB_API_KEY',
  appId: '1:YOUR_ACTUAL_APP_ID:web:YOUR_ACTUAL_WEB_ID',
  messagingSenderId: 'YOUR_ACTUAL_SENDER_ID',
  projectId: 'your-actual-project-id',
  authDomain: 'your-actual-project-id.firebaseapp.com',
  storageBucket: 'your-actual-project-id.appspot.com',
);
```

Do the same for Android, iOS, and macOS configurations.

### 5. Set Up Firestore (Optional)

1. In Firebase Console, go to "Firestore Database"
2. Click "Create database"
3. Choose production mode or test mode:
   - **Test mode**: Anyone can read/write (good for development)
   - **Production mode**: Requires authentication rules
4. Select a location for your database
5. Click "Enable"

### 6. Configure Security Rules

#### For Firestore:

Go to Firestore > Rules and add:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Allow authenticated users to read/write their own data
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    
    // Add more rules as needed for your app
  }
}
```

#### For Authentication:

The Email/Password authentication is already secure by default. Users can only access their own account data.

### 7. Test Your Setup

1. Run the app:
   ```bash
   flutter run
   ```

2. Try to sign up with a test account
3. Check Firebase Console > Authentication > Users to see if the user was created
4. Try logging in with the test account

## Troubleshooting

### Error: "Firebase app has not been initialized"

- Make sure you've run `flutterfire configure`
- Check that `lib/firebase_options.dart` exists and has valid configuration
- Ensure `Firebase.initializeApp()` is called in `main.dart` before `runApp()`

### Error: "Default Firebase app has not been initialized"

- Check your internet connection
- Verify your Firebase configuration values are correct
- Try running `flutter clean` and `flutter pub get`

### iOS Build Error: "GoogleService-Info.plist not found"

- Make sure you've added `GoogleService-Info.plist` to your Xcode project
- Check that it's in the Runner target

### Android Build Error: "google-services.json not found"

- Verify `google-services.json` is in `android/app/`
- Check that you've added the google-services plugin to gradle files

## Security Best Practices

1. **Never commit Firebase credentials to version control**
   - `lib/firebase_options.dart` should be in `.gitignore` if it contains sensitive data
   - Use environment variables for sensitive configuration in production

2. **Set up proper Firestore security rules**
   - Don't leave database in test mode in production
   - Implement proper authentication checks

3. **Enable App Check** (recommended for production)
   - Protects your Firebase resources from abuse
   - Go to Firebase Console > App Check

4. **Monitor Usage**
   - Set up budget alerts in Firebase Console
   - Monitor authentication attempts for suspicious activity

## Additional Resources

- [FlutterFire Documentation](https://firebase.flutter.dev/)
- [Firebase Console](https://console.firebase.google.com/)
- [Firebase Authentication Documentation](https://firebase.google.com/docs/auth)
- [Cloud Firestore Documentation](https://firebase.google.com/docs/firestore)

## Support

If you encounter issues:
1. Check the [FlutterFire GitHub Issues](https://github.com/firebase/flutterfire/issues)
2. Review [Firebase Documentation](https://firebase.google.com/docs)
3. Ask on [Stack Overflow](https://stackoverflow.com/questions/tagged/flutter+firebase)

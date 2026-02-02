# Venu Mobile App

Mobile Version of Venu - A Flutter application with Firebase backend.

## Features

- 🔐 User Authentication (Login/Sign Up)
- 🔥 Firebase Integration
- 📱 Cross-platform (iOS, Android, Web)
- 🎨 Material Design 3
- 👤 User Profile Management

## Prerequisites

Before you begin, ensure you have the following installed:

- Flutter SDK (3.0.0 or higher) - [Installation Guide](https://flutter.dev/docs/get-started/install)
- Dart SDK (comes with Flutter)
- Firebase CLI - `npm install -g firebase-tools`
- For Android: Android Studio with Android SDK
- For iOS: Xcode (macOS only)

## Firebase Setup

1. Create a new Firebase project at [Firebase Console](https://console.firebase.google.com/)

2. Enable Authentication:
   - Go to Authentication > Sign-in method
   - Enable Email/Password authentication

3. Configure Firebase for your platforms:

   ```bash
   # Install FlutterFire CLI
   dart pub global activate flutterfire_cli
   
   # Login to Firebase
   firebase login
   
   # Configure your Flutter app with Firebase
   flutterfire configure
   ```

4. The `flutterfire configure` command will:
   - Create a new Firebase project or select an existing one
   - Register your app with Firebase
   - Generate `lib/firebase_options.dart` with your project's configuration
   - Configure iOS, Android, and Web platforms

   **Note:** After running this command, replace the placeholder Firebase configuration in `lib/firebase_options.dart` with the generated configuration.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Ruvier14/Venu_proj_mob.git
   cd Venu_proj_mob
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Update Firebase configuration in `lib/firebase_options.dart` with your project credentials (if not done via flutterfire configure)

## Running the App

### For Android/iOS:
```bash
flutter run
```

### For Web:
```bash
flutter run -d chrome
```

### For a specific device:
```bash
# List available devices
flutter devices

# Run on specific device
flutter run -d <device_id>
```

## Building the App

### Android APK:
```bash
flutter build apk
```

### Android App Bundle:
```bash
flutter build appbundle
```

### iOS:
```bash
flutter build ios
```

### Web:
```bash
flutter build web
```

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── firebase_options.dart     # Firebase configuration
├── screens/
│   ├── auth/
│   │   ├── login_screen.dart    # Login screen
│   │   └── signup_screen.dart   # Sign up screen
│   └── home_screen.dart         # Home screen after login
└── services/
    └── auth_service.dart        # Authentication service
```

## Technologies Used

- **Flutter**: UI framework
- **Firebase Auth**: User authentication
- **Cloud Firestore**: Database (ready for integration)
- **Provider**: State management
- **Material Design 3**: UI/UX design system

## Features to Implement

- [ ] Password reset functionality
- [ ] Email verification
- [ ] Social authentication (Google, Apple)
- [ ] User profile editing
- [ ] Cloud Firestore data integration
- [ ] Push notifications
- [ ] Offline support

## Troubleshooting

### Common Issues:

1. **Firebase not initialized**: Make sure you've run `flutterfire configure` and updated `firebase_options.dart`

2. **Build errors**: Try:
   ```bash
   flutter clean
   flutter pub get
   ```

3. **iOS build issues**: 
   ```bash
   cd ios
   pod install
   cd ..
   ```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

Project Link: [https://github.com/Ruvier14/Venu_proj_mob](https://github.com/Ruvier14/Venu_proj_mob)

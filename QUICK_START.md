# Quick Start Guide

## After Installing Flutter:

### Setup Options:

**Option 1: VS Code only** (Recommended if you have a physical Android device or want web)
- Install VS Code
- Install Flutter extension in VS Code
- Connect your physical Android device (enable USB debugging)
- OR run on web: `flutter run -d chrome`

**Option 2: VS Code + Android Studio** (For Android emulator)
- Install VS Code + Flutter extension
- Install Android Studio (for Android SDK and emulator)
- Create an Android emulator in Android Studio
- Run: `flutter run`

### Running the App:

1. Open terminal in this folder: `C:\Users\User\Desktop\lab-mis`

2. Run:
   ```
   flutter pub get
   ```

3. Connect your device/emulator OR use web:
   ```
   flutter run -d chrome
   ```

4. Or run on connected device:
   ```
   flutter run
   ```

## Your App Structure:

✅ All features implemented:
- Exam model with named parameters
- List screen with cards, icons, sorting
- Color-coded past/future exams
- Detail screen with time remaining
- Beautiful UI with badges
- Proper folder organization (models, screens, data)

## To Change Your Index Number:

Edit `lib/screens/exam_list_screen.dart` line 14:
```dart
title: const Text('Распоред за испити - [YOUR_INDEX_HERE]'),
```

## Features Summary:

- ✅ AppBar with your index number
- ✅ 11 exams (hardcoded static data)
- ✅ Card-based design
- ✅ Chronological sorting by date
- ✅ Different colors for past/passed exams
- ✅ Icons for date, time, rooms
- ✅ Badge showing total exam count
- ✅ Navigation to detail screen
- ✅ Time remaining calculation
- ✅ Organized code structure

Your app is 100% complete and ready to run!


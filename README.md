# Brandie Task App

A Flutter-based task management application with a modern UI design.

## Demo Video

You can watch a demo of the application here: [Demo Video](https://icecreamapps.com/v/b6su5m8)

## Quick Start (Android)

For Android users, you can directly install the pre-built APK:
1. Download the APK from the `apk` folder: [oriflame.apk](apk/oriflame.apk)
2. Enable "Install from Unknown Sources" in your Android settings
3. Install the APK on your device

## Prerequisites

- Flutter SDK (version 3.8.0 or higher)
- Dart SDK (version 3.8.0 or higher)
- Android Studio / Xcode (for mobile development)
- VS Code (recommended IDE)

## Getting Started

1. Clone the repository:
```bash
git clone https://github.com/yourusername/brandie_task_app.git
cd brandie_task_app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Project Structure

- `lib/` - Contains the main application code
- `assets/` - Contains all static assets (images, icons)
- `test/` - Contains test files

## Assumptions & Improvements

1. **UI-First Approach**: The project focuses primarily on UI implementation with hardcoded data for demonstration purposes.
2. **Responsive Design**: The UI is designed to work across different screen sizes and orientations.
3. **Asset Organization**: Assets are organized into specific folders (sidebar, social, filter, account_card) for better maintainability.

## Features

- Modern and clean UI design
- Task management interface
- Responsive layout
- Cross-platform support (iOS, Android, Web)

## Development Notes

- The project uses Material Design components
- State management is handled using Flutter's built-in state management solutions
- All UI components are built with reusability in mind

## Running on Different Platforms

### Android
```bash
flutter run -d android
```

### iOS
```bash
flutter run -d ios
```

### Web
```bash
flutter run -d chrome
```

## Building for Production

### Android APK
```bash
flutter build apk
```

### iOS IPA
```bash
flutter build ios
```

### Web
```bash
flutter build web
```

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

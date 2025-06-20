# Brandie Task App

This is my practical assignment submission for the Brandie Task App. It's a Flutter application designed for reviewing accounts.

## Key Features Implemented:

- **Review Accounts Screen**: Displays a list of accounts.
- **Toggle Archive View**: Allows switching between active and archived accounts.
- **Responsive Layout**: Adapts UI for mobile, tablet, and desktop screens.
- **Sidebar Navigation**: Provides navigation on larger screens (and as a drawer on mobile).
- **Account Cards**: Displays individual account details.
- **Filtering**: Includes a filter bar for account management.

## How to Try the App

### Watch the Demo
I've recorded a quick demo of the app: [Demo Video](https://icecreamapps.com/v/b6su5m8)

### Install on Android
To install on Android:
1. Download the APK from the `apk` folder: [oriflame.apk](apk/oriflame.apk)
2. Enable "Install from Unknown Sources" in your Android settings
3. Install and run the app

### Run from Source
To run the project yourself:
1. Ensure Flutter (SDK version 3.32.0+) is installed.
2. Clone this repository.
3. Run `flutter pub get` in the project directory.
4. Execute `flutter run` to start the application.

## My Approach

My focus was on building a functional, responsive UI. I used Flutter's built-in widgets and state management to achieve the required features. Data is currently hardcoded for demonstration purposes.

## Notes

- The app currently uses sample data for demonstration
- I've organized the code to make it easy to understand and modify
- All assets are properly organized in the assets folder

Feel free to explore the code and let me know if you have any questions!

## Prerequisites

- Flutter SDK (version 3.32.0 or higher)
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

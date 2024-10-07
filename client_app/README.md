# Flutter Project: DFCU HR Management App

This Flutter application is designed to interact with the DFCU HR Management API, allowing users to manage employee data through a clean and intuitive interface. This guide will help you set up the project, build the APK, or use the pre-built APK directly.

## Table of Contents
- [Flutter Project: DFCU HR Management App](#flutter-project-dfcu-hr-management-app)
  - [Table of Contents](#table-of-contents)
  - [Features](#features)
  - [Requirements](#requirements)
  - [Getting Started](#getting-started)
    - [Building the APK](#building-the-apk)
    - [Using the Pre-built APK](#using-the-pre-built-apk)

## Features

- **Register Employee**: Add new employees clicking Add New User on Home Page and Filling out the details
- **View Employee Data**: All Registered Employeees are shown on the home page
- **Update Employee Data**: Click Edit on an existing employee details

## Requirements

Before you begin, ensure you have the following installed:
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- Android Studio or VS Code with Flutter plugins
- A valid emulator or connected device for testing

## Getting Started

1. Clone the repository:
    ```bash
    git clone https://github.com/tagasimon/HR-Mgt-System.git
    cd HR-Mgt-System
    ```

2. Install the required dependencies:
    ```bash
    flutter pub get
    ```

3. Run the project:
    ```bash
    flutter run
    ```

### Building the APK

To build the APK for this project:

1. Run the following command to build a release APK:
    ```bash
    flutter build apk --release
    ```

2. The APK will be generated at:
    ```
    build/app/outputs/flutter-apk/app-release.apk
    ```

3. You can transfer this APK to your Android device or emulator for testing.

### Using the Pre-built APK

If you don't want to build the APK yourself, you can use the pre-built APK found in the home directory of the repository.

1. Navigate to the home directory of the cloned repository:
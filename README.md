# Connecting Your Flutter Project to Firebase

## Prerequisites

1. **Node.js**: Ensure you have Node.js installed. Firebase CLI requires Node.js to function properly. You can download it from [Node.js official website](https://nodejs.org/).

2. **Flutter**: Make sure you have Flutter installed and set up on your machine.

## Steps to Connect to Firebase

1. **Install Firebase CLI and Login**:
    Open your terminal and run the following command to install Firebase CLI:

    ```bash
    npm install -g firebase-tools
    ```

    Then, log in to Firebase:

    ```bash
    firebase login
    ```

2. **Install and Run the FlutterFire CLI**:
    From any directory, run this command to install the FlutterFire CLI:

    ```bash
    dart pub global activate flutterfire_cli
    ```

    Then, at the root of your Flutter project directory, run this command to configure Firebase:

    ```bash
    flutterfire configure --project=PROJECT_ID
    ```

    This automatically registers your per-platform apps with Firebase and adds a `lib/firebase_options.dart` configuration file to your Flutter project.

## Execution Policy Issue on Windows

If you encounter an error related to the execution policy while running Firebase commands on Windows, it is likely due to the system's execution policy settings. To resolve this, you can temporarily change the execution policy by running the following command in PowerShell as an administrator:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

This command allows scripts to run for the current session. Note that this change is temporary and only applies to the current PowerShell session.

## Conclusion

By following these steps, you should be able to connect your Flutter project to Firebase and resolve any execution policy issues on Windows.

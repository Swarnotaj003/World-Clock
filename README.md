# World Clock App

## About
**World Clock App** is a sleek, cross-platform application built with `Flutter` that allows users to effortlessly track time across different time zones. Whether you're coordinating with international teams, planning trips, or staying in touch with loved ones abroad, this app provides a seamless way to monitor multiple locations in real time. With a focus on simplicity and usability, it offers an intuitive interface, customizable features, and smooth performance on Android, iOS, and web.

## Objective

The objective of this project is to learn to integrate the interactive UI components of Flutter with a third-party API, [Time.io](https://timeapi.io/swagger/index.html).

## Demo
You can download the APK file to install the application on your Android device:
> This will require **granting permission** to *install apps from unknown sources*

[**Download APK**](https://github.com/Swarnotaj003/World-Clock/releases/download/v1.0/app-debug.apk)


## App Preview
Home (Night) | Edit location | Evening | Morning | Afternoon
-------------|---------------|---------|---------|----------
![image](https://github.com/user-attachments/assets/cfb52429-4120-42cd-a16a-12205cafccb7) | ![image](https://github.com/user-attachments/assets/75db7d05-075c-4bbc-8b27-5ef0b86738ed) | ![image](https://github.com/user-attachments/assets/d52c8235-671b-420d-9b22-e29fc1f224b7) | ![image](https://github.com/user-attachments/assets/4e73a434-54e5-4607-8550-6ad9f368d787) | ![image](https://github.com/user-attachments/assets/93d4d29b-c397-4eef-b7ff-c5a98dff8f9c)


## Getting Started

To run this project locally, follow these steps:

### Prerequisites

- Flutter SDK installed on your device
- An IDE like Android Studio or VS Code
- An Android emulator or a physical device for testing

### Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/Swarnotaj003/World-Clock.git
    cd world_clock
2. Install the dependencies:
    ```bash
    flutter pub get
3. Set up Firebase:
    - Create a Firebase project in the Firebase Console.
    - Add your Android app to the Firebase project and download the google-services.json file.
    - Place the google-services.json file in the android/app directory.
4. Configure your app:
    - Update the necessary configurations in android/app/build.gradle and android/build.gradle as per Firebase setup instructions.

5. Run the app:
    ```bash
    flutter run

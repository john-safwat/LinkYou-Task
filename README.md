# Task: Google Login and User List Integration

## Overview
This project implements a simple Flutter application with Google login authentication, user registration via API, and a user listing page.

### Key Features:
1. **Google Login**: Allows users to log in using their Google account.
2. **API Interaction**: After logging in, the app posts the user's details (username or email) to an API.
3. **User List Display**: Once the user has been posted, the app navigates to a screen that displays a list of users fetched from the API.

## Requirements

### Tools & Technologies:
- **Flutter** (version 3.0+)
- **Google Sign-In** Plugin: [`google_sign_in`](https://pub.dev/packages/google_sign_in)
- **HTTP Requests**: `Dio` package
- **State Management**: (`Provider`)
- **Dart**: SDK version >= 2.12
- API Endpoint: https://reqres.in/api/users

## Setup Instructions

### Prerequisites:
- Install Flutter on your machine: [Flutter Setup Guide](https://flutter.dev/docs/get-started/install)
- Add `google_sign_in` and `http` dependencies to `pubspec.yaml`:
  ```yaml
  dependencies:
    flutter:
      sdk: flutter
    flutter_lints: ^3.0.0
    lottie: ^3.1.2
    flutter_native_splash: ^2.4.1
    provider: ^6.1.2
    firebase_core: ^3.4.0 

### Steps:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-repo.git
   cd your-repo

2. **Install Dependencies: Run the following command to get the necessary dependencies:**:
flutter pub get

2. **Configure Google Sign-In: Follow the setup instructions in the google_sign_in package documentation. Make sure to configure your google-services.json (for Android) and GoogleService-Info.plist (for iOS)**:

## Code Structure
```lib/
|-- Core/
|   |-- Assets/
|   |   |-- animation_assets.dart
|   |   |-- images_assets.dart
|   |-- Base/
|   |   |-- base_navigator.dart
|   |   |-- base_state.dart
|   |   |-- base_view_model.dart
|   |-- Colors/
|   |   |-- colors_manager.dart
|   |-- Error/
|   |   |-- dio_error_handler.dart
|   |   |-- firebase_auth_exception_handler.dart
|   |-- Theme/
|   |   |-- app_theme.dart
|   |-- Utils/
|   |   |-- dialog_utils.dart
|   |   |-- negative_action_button.dart
|   |   |-- pos_action_button.dart
|-- Data/
|   |-- API/
|   |   |-- api_manager.dart
|   |   |-- api_manager_constants.dart
|   |-- DataSource/
|   |   |-- firebase_auth_remote_data_source_impl.dart
|   |   |-- users_remote_data_source_impl.dart
|   |-- Firebase/
|   |   |-- firebase_auth_database.dart
|   |-- Models/
|   |   |-- Registration_response.dart
|   |   |-- support.dart
|   |   |-- userDTO.dart
|   |   |-- users_response_DTO.dart
|   |-- Repository/
|   |   |-- users_repository_impl.dart
|-- Domain/
|   |-- DataSource/
|   |   |-- firebase_auth_remote_data_source_contract.dart
|   |   |-- users_remote_data_source_contract.dart
|   |-- Exceptions/
|   |   |-- bad_network_connection_exception.dart
|   |   |-- dio_server_exception.dart
|   |   |-- firebase_google_sign_in_exception.dart
|   |   |-- operation_timeout_exception.dart
|   |   |-- unknown_exception.dart
|   |-- Models/
|   |-- Reposiotry/
|   |   |-- users_repository_contract.dart
|   |-- UseCase/
|   |   |-- get_users_list_use_case.dart
|   |   |-- sign_in_with_google_use_case.dart
|-- Presentation/
|   |-- Home/
|   |   |-- Widgets/
|   |   |   |-- user_item.dart
|   |   |-- home_navigator.dart
|   |   |-- home_view.dart
|   |   |-- home_view_model.dart
|   |-- Login/
|   |   |-- login_navigator.dart
|   |   |-- login_view.dart
|   |   |-- login_view_model.dart
|-- firebase_options.dart
|-- main.dart
```


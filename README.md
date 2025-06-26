# Flutter MVVM BLoC App

A Flutter application demonstrating the **MVVM (Model-View-ViewModel)** architecture using the **BLoC (Business Logic Component)** pattern. It integrates multiple API calls using the `http` package and supports **Firebase Authentication** for user management.

---

## ✨ Features

- **Multiple API Calls**: Fetches posts, users, and quotes from public APIs.
- **Firebase Authentication**: Email/password sign-in and sign-out.
- **MVVM Architecture**: Separation of Models, Views, and ViewModels (BLoCs).
- **BLoC Pattern**: Event-based state management for reactive UI.
- **Clean Folder Structure**: Scalable and maintainable project layout.
- **Error Handling**: Robust network and API error management.

---

## 📁 Folder Structure


lib/
├── data/
│   ├── models/
│   │   ├── post_model.dart
│   │   ├── user_model.dart
│   │   └── quote_model.dart
│   ├── repositories/
│   │   └── api_repository.dart
│   └── services/
│       └── api_service.dart
├── presentation/
│   ├── blocs/
│   │   ├── auth/
│   │   │   ├── auth_bloc.dart
│   │   │   ├── auth_event.dart
│   │   │   └── auth_state.dart
│   │   ├── post/
│   │   │   ├── post_bloc.dart
│   │   │   ├── post_event.dart
│   │   │   └── post_state.dart
│   │   ├── user/
│   │   │   ├── user_bloc.dart
│   │   │   ├── user_event.dart
│   │   │   └── user_state.dart
│   │   └── quote/
│   │       ├── quote_bloc.dart
│   │       ├── quote_event.dart
│   │       └── quote_state.dart
│   ├── screens/
│   │   ├── home_screen.dart
│   │   ├── post_screen.dart
│   │   ├── user_screen.dart
│   │   └── quote_screen.dart
│   └── widgets/
│       └── loading_widget.dart
├── utils/
│   ├── constants.dart
│   └── network_utils.dart
└── main.dart


---

## ⚙️ Prerequisites

- **Flutter SDK**: Version 3.32.0 or higher
- **Dart**: Version 3.0.0 or higher
- **Firebase CLI**: For Firebase configuration
- **Node.js**: For Firebase CLI
- **IDE**: VS Code, Android Studio, etc. (with Flutter plugins)

---

## 🛠️ Setup Instructions

### 1. Clone the Repository

```bash
git clone <repository-url>
cd my_mvvm_bloc_app



Install Dependencies:Update pubspec.yaml with the following dependencies and run flutter pub get:
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.3
  http: ^1.2.0
  firebase_core: ^3.6.0
  firebase_auth: ^5.3.1
  cloud_firestore: ^5.4.4
  firebase_analytics: ^11.3.3



Configure Firebase:

Install Firebase CLI:npm install -g firebase-tools


Log in to Firebase:firebase login


Configure Firebase for the project:flutterfire configure --project=practice-app-tj8i0w

Select android and ios platforms, and ensure the Android package name is com.example.bloc_pattern_app.
If the CLI fails, manually add the app in the Firebase Console:
Add an Android app with package name com.example.bloc_pattern_app and place google-services.json in android/app/.
Add an iOS app with bundle ID com.example.blocPatternApp and place GoogleService-Info.plist in ios/Runner/.




Run the App:
flutter run



Architecture
The app follows the MVVM architecture with the BLoC pattern:

Models (data/models/): Define data structures (PostModel, UserModel, QuoteModel) for API responses.
ViewModels (presentation/blocs/): BLoCs (AuthBloc, PostBloc, UserBloc, QuoteBloc) handle business logic and state management.
Views (presentation/screens/): UI components (HomeScreen, PostScreen, UserScreen, QuoteScreen) react to BLoC states.
Repositories (data/repositories/): ApiRepository acts as an intermediary between BLoCs and ApiService.
Services (data/services/): ApiService handles HTTP requests to external APIs.
Utilities (utils/): Constants and network utilities for configuration.

API Endpoints

Posts: https://jsonplaceholder.typicode.com/posts
Users: https://jsonplaceholder.typicode.com/users
Quotes: https://dummyjson.com/quotes

Usage

Sign In:

On the HomeScreen, enter an email and password registered in Firebase Authentication to sign in.
If authentication fails, an error message is displayed.


View Data:

After signing in, navigate to:
Posts: Displays a list of posts with titles and bodies.
Users: Shows a list of users with names and emails.
Quotes: Lists quotes with their authors.


Each screen fetches data from its respective API and displays a loading indicator or error message as needed.


Sign Out:

From the authenticated HomeScreen, click "Sign Out" to return to the sign-in form.



Troubleshooting

Firebase Configuration Error:

Check firebase-debug.log for details.
Ensure the Firebase project ID (practice-app-tj8i0w) exists and you have permissions.
Verify google-services.json and GoogleService-Info.plist are correctly placed.


API Errors:

Ensure internet connectivity.
Check debugPrint logs in the console for error details.
Verify API endpoints in utils/constants.dart.


BLoC State Issues:

Ensure all BLoCs are provided in main.dart via MultiBlocProvider.
Check that events are triggered correctly in screens.



Contributing

Fork the repository.
Create a feature branch (git checkout -b feature/new-feature).
Commit changes (git commit -m 'Add new feature').
Push to the branch (git push origin feature/new-feature).
Create a pull request.

License
This project is licensed under the MIT License.
# Multi-Feature Flutter App

This project is a comprehensive Flutter application built to demonstrate modern Android development practices. It showcases a clean architecture using **Riverpod** for state management, **Freezed** for immutable data models, and various external APIs to provide a rich multi-feature experience.

## Features

The application is composed of five distinct modules, navigable via a bottom navigation bar:

1.  **😂 Joke Generator**: Fetches random jokes using the [Official Joke API](https://github.com/15Dkatz/official_joke_api).
2.  **💬 Quote of the Day**: Displays inspiring quotes from [ZenQuotes](https://zenquotes.io/).
3.  **💱 Currency Converter**: Shows live currency exchange rates (USD base) using the [ExchangeRate-API](https://www.exchangerate-api.com/).
4.  **🎬 Movie Search**: Allows users to search for detailed movie information (Plot, Poster, Year) using the [OMDb API](https://www.omdbapi.com/).
    *   *Note: Requires a valid OMDb API Key.*
5.  **💡 Random Facts**: Delivers interesting and useless facts via the [Useless Facts API](https://uselessfacts.jsph.pl/).

## Tech Stack & Best Practices

*   **State Management**: [flutter_riverpod](https://pub.dev/packages/flutter_riverpod) (v2.x) using `FutureProvider` and `StateProvider`.
*   **Data Modeling**: [freezed](https://pub.dev/packages/freezed) & [json_serializable](https://pub.dev/packages/json_serializable) for robust, immutable data classes and JSON parsing.
*   **Networking**: [http](https://pub.dev/packages/http) package for API integration.
*   **UI/UX**:
    *   Material Design 3 components.
    *   Responsive and safe layouts using `SafeArea` and `Expanded`.
    *   Modern `SearchBar` implementation with optimized user interaction.
    *   Custom error and loading states handled gracefully via Riverpod's `AsyncValue`.

## Getting Started
### Prerequisites

*   Flutter SDK (Latest Stable)
*   Dart SDK

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/yourusername/dummy_app.git
    cd dummy_app
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Generate code:**
    Since this project uses `freezed`, you must run the build runner to generate the model files:
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

4.  **Configure API Keys:**
    *   Open `lib/services/movie_service.dart`.
    *   Replace the placeholder with your OMDb API key:
        ```dart
        final String apiKey = 'YOUR_API_KEY';
        ```

5.  **Run the app:**
    ```bash
    flutter run
    ```

## Project Structure

```
lib/
├── features/         # Feature-specific widgets (e.g., JokeScreen)
├── models/           # Freezed data models (Joke, Quote, Movie, etc.)
├── providers/        # Centralized Riverpod providers
├── screens/          # Main application screens (MainScreen, MovieScreen, etc.)
├── services/         # API service classes for network requests
└── main.dart         # App entry point
```

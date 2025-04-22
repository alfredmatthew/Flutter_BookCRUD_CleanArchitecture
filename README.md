# Flutter x Spring Boot Book Management App

## Explanation

This project is a Flutter application designed to interact with a Spring Boot backend API for managing a collection of books. It demonstrates basic CRUD (Create, Read, Delete) operations for book data. The app fetches a list of books, allows users to add new books via a dialog, and enables deleting existing books directly from the list.

## Features

*   **List Books**: Displays a list of books fetched from the backend API.
*   **Create Book**: Provides a dialog to input ISBN, Title, and Author to add a new book.
*   **Delete Book**: Allows users to delete a book by tapping a delete icon on the list item.
*   **Pull to Refresh**: Implements pull-to-refresh functionality on the book list to fetch the latest data.

## Tech Stack & Dependencies

*   **Frontend**:
    *   Flutter & Dart
*   **Backend**:
    *   Spring Boot
*   **State Management**:
    *   `bloc` / `flutter_bloc`: For managing application state using the Cubit pattern.
*   **Dependency Injection**:
    *   `get_it`: Service locator for managing dependencies.
*   **HTTP Client**:
    *   `http`: For making requests to the backend REST API.
*   **Functional Programming**:
    *   `dartz`: For handling errors and asynchronous operations using `Either`.
*   **Value Equality**:
    *   `equatable`: To simplify equality comparisons for entities and models.
*   **UI**:
    *   `pull_to_refresh`: For implementing the pull-to-refresh feature.

## What I Learned from This Project

*   **State Management with Bloc/Cubit**: Implementing Cubits to manage the state for different features (listing, creating, deleting books) and reacting to state changes in the UI.
*   **Dependency Injection**: Using `get_it` to register and retrieve dependencies like data sources, repositories, use cases, and Cubits, promoting loose coupling.
*   **REST API Integration**: Communicating with a backend API using the `http` package to perform GET, POST, and DELETE requests.
*   **Asynchronous Programming & Error Handling**: Utilizing `Future` and `Either` (from `dartz`) to handle asynchronous operations and manage success/failure states gracefully.
*   **Layered Architecture (Clean Architecture principles)**: Structuring the application into layers (Presentation, Domain, Data) to separate concerns and improve maintainability.
*   **Flutter UI Development**: Building the user interface with Flutter widgets like `Scaffold`, `AppBar`, `ListView`, `Card`, `ListTile`, `FloatingActionButton`, `AlertDialog`, and `TextField`.
*   **Connecting Flutter to a Backend**: Establishing communication between a Flutter frontend and a backend service (like Spring Boot) over HTTP.

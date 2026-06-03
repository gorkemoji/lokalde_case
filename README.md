# Lokalde (MediFinder) - Case Study

## DEMO VIDEO
[Watch Demo Video](https://github.com/gorkemoji/lokalde_case/blob/main/demo.MP4)

This project is a mobile application developed as a case study to demonstrate a clean, maintainable, and production-ready approach to building a healthcare provider (doctor, clinic, hospital) search and filter flow. It is made for Lokalde.

## Features
* **Provider List:** Displays a list of healthcare providers with a unified and concurrent search bar.
* **Advanced Filtering:** Modular filter screen supporting Country, City (text input), and Specialty/Facility Type criteria.
* **Provider Detail:** Comprehensive profile view with a dynamic SliverAppBar, image fallbacks, and contact information.
* **Premium UX:** Shimmer effects for loading states, smooth entry animations, and a built-in retry mechanism for error/offline scenarios.

## Architecture & State Management
* **Architecture:** The project follows the **Model-View-ViewModel (MVVM)** architectural pattern. This separation of concerns ensures that the UI components (Views) are strictly decoupled from the business logic and data manipulation (ViewModels), making the codebase highly testable, readable, and scalable.
* **State Management:** The **`provider`** package was chosen for state management. `ProviderViewModel` acts as the single source of truth for the provider list, active filters, search queries, and loading/error states. `Consumer` widgets are used strategically across the app to rebuild only the necessary parts of the UI, optimizing performance.

## Important Technical Decisions
* **Modular Widget Structure:** Complex screens (like `FilterScreen` and `ProviderDetailScreen`) and list items (`ProviderCard`) were broken down into smaller, single-responsibility stateless widgets and private methods.
* **Robust Search & Filter Logic:** The search and filter mechanisms work concurrently. The search query elegantly checks against the provider's name, category, and workplace simultaneously without conflicting with active filters.
* **UI/UX Polish:** * Replaced standard loading spinners with skeleton **Shimmer (Skeleton)** effects that perfectly match the actual card layout.
    * Implemented a `SliverAppBar` with gradient overlays and `errorBuilder` handling to gracefully fall back to default icons if local/network images fail.
    * Used `flutter_animate` for smooth fade and slide transitions on list items.
* **Null Safety & Edge Cases:** Safely handled missing mock data (e.g., missing bio or workplace) to prevent UI overflows or null assertion crashes. Implemented explicit "Empty" and "Error" states with retry capabilities.

## Testing
Unit tests have been implemented to verify the core business logic and initial states within the `ProviderViewModel`, ensuring that the search and initialization function exactly as expected.
* Run tests using: `flutter test`

## IMPORTANT NOTE!!
The app waits 2 seconds for retrieving mock data. It is made **on purpose** for using shimmer effects!

## Setup & Installation
1. Clone the repository: `git clone https://github.com/gorkemoji/lokalde_case`
2. Fetch dependencies: `flutter pub get`
3. Run the application: `flutter run`

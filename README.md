# MovieBuzz (SwiftUI MVVM) - TMDb

A SwiftUI iOS app that displays popular movies from [The Movie Database (TMDb)](https://www.themoviedb.org/), supports search, shows detailed information, plays trailers, and allows users to favorite movies.

Built using **MVVM architecture**, `async/await` networking, and `UserDefaults` for favorites persistence.

---

## Features

- **Home / Movies List**
  - Display popular movies: poster, title, rating
  - Infinite scroll (paging)
  - Search bar 
  - Tap a movie to view details  

- **Movie Detail**
  - Trailer playback (YouTube embedded)
  - Movie title, overview, genres, runtime, rating
  - Favorite/unfavorite button  

- **Favorites**
  - View all favorited movies
  - Tap to open detail view
  - Favorites persist across app launches  

- **Architecture**
  - MVVM: Models, ViewModels, Views
  - Networking via `TMDBService` with `async/await`
  - Favorites via `FavoritesManager` backed by `UserDefaults`
  - Declarative SwiftUI views

---

## Requirements

- Xcode 26.0
- iOS 26.0
- Swift 6.2
- Internet connection (TMDb API)

---

## Setup

1. **TMDb API Key**  
      - Sign up at [TMDb](https://www.themoviedb.org/) and get an API key.
      - Add your API key in the project:
      - Open `MoviesApiService.swift` and replace the placeholder in `APIConstants` enum:
     ```swift
     static let apiKey = "<YOUR_TMDB_API_KEY>"
     ```
     

2. **Build & Run**
   - Open project in Xcode
   - Select target device / simulator
   - Press `Cmd + R` to build and run

3. **Dependencies**
   - Uses only native SwiftUI / Foundation APIs; no external packages.

---
## Screenshots

1. **HomeScreen**
<img width="424" height="858" alt="MovieBuzzHomeScreen" src="https://github.com/user-attachments/assets/7f74315c-717b-4822-bb47-0592552505cb" />

2. **FavouriteScreen**
<img width="420" height="849" alt="MovieBuzzFavouriteScreen" src="https://github.com/user-attachments/assets/be429a82-66cb-4fbd-84a4-de50f308473e" />
<img width="423" height="849" alt="MovieBuzzEmptyFavScreen" src="https://github.com/user-attachments/assets/8184fbd7-f714-4561-87a2-10e235dfd9ad" />

3. **SearchScreen**
<img width="435" height="859" alt="MovieBuzzSearchScreen" src="https://github.com/user-attachments/assets/b9645c87-0813-439b-9397-af2111f29ce8" />

4. **MovieDetailScreen**
<img width="415" height="857" alt="MovieBuzzDetailScreen" src="https://github.com/user-attachments/assets/1283ea6d-4f72-454f-981c-b023bf17559e" />


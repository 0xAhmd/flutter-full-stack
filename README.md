# 📚 漫画シリーズ Manga Series DB

A fullstack manga database application built with **Flutter** for the frontend and **PHP** for the backend. This app allows users to browse and view manga series with locally cached images and supports refreshing the content using pull-to-refresh gestures.


## 📱 Frontend (Flutter)

- Built with **Flutter** for modern, responsive UI.
- Uses **GridView** to display manga covers and titles.
- Implements **LiquidPullToRefresh** for interactive refresh.
- Supports:
  - Hero animations between screens.
  - Cached images for offline support.
  - Dark UI theme for better aesthetics.

## 💻 Backend (PHP)

- A lightweight PHP backend API handles all data storage and retrieval.
- Fetches manga data from a database and returns it as JSON.
- Supports caching logic and efficient data access.
- Endpoints provide:
  - All manga list
  - Individual manga details
  - Image URLs

## 📦 Features

- 🔍 View manga with title and image.
- 🧠 Smart caching mechanism to reduce network usage.
- 🌀 Pull-to-refresh to force data updates.
- 🌙 Clean dark theme UI.

---

## 🧱 Technologies Used

| Layer      | Tech Stack          |
|------------|---------------------|
| Frontend   | Flutter, Dart       |
| Backend    | PHP, MySQL (assumed)|
| UI Effects | Hero, LiquidPullToRefresh |
| Data Layer | Local file caching, REST API |


## 🚀 Getting Started

###   Requirements

- Flutter SDK
- PHP Server (e.g. XAMPP, Laragon, or live server)
- Connected MySQL DB (or JSON API)

## 🛠️ Setup
### 1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/manga-series-db.git
   ```

### 2. Set up backend:

Place the PHP backend in your server directory.
Update your Flutter API URL accordingly.

### 3. Run Flutter app:
```
cd flutter_app
flutter pub get
flutter run
```

### sc
 ![image](https://github.com/user-attachments/assets/cdf42c13-01aa-4182-bc2b-939ad9f4d97b)



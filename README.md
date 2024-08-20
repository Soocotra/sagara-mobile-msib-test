# Simple Weather App

This project was developed as part of the internship test for MSIB Sagara Technology. The Simple Weather App is designed to provide users with weather updates and forecasts using the OpenWeatherMap API.
<p align="center">
  <img src="https://github.com/user-attachments/assets/be982ef9-ba5c-4d28-81f3-78e156c836b8" width=320 height=680>
</p>

## Table of Contents
- [A. How to Run the Project](#a-how-to-run-the-project)
- [B. Project Specifications](#b-project-specifications)
  - [1. Technology](#1-technology)
  - [2. Clean Architecture](#2-clean-architecture)
  - [3. State Management](#3-state-management)
  - [4. Dependency Injection](#4-dependency-injection)
  - [5. API Consumer](#5-api-consumer)
- [C. Main Features](#c-main-features)
  - [1. Weather Display](#1-weather-display)
  - [2. API Integration](#2-api-integration)
- [D. Packages Used](#d-packages-used)
- [E. Credits](#e-credits)

## A. How to Run the Project

To run the Simple Weather App on your local machine, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/Soocotra/sagara-mobile-msib-test.git
   ```
   
2. **Navigate to the Project Directory**:
   ```bash
   cd weather_forecast
   ```

3. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

4. **Run the Project**:
   ```bash
   flutter run
   ```

## B. Project Specifications

### 1. Technology
- **Dart**: ">=3.4.4 <4.0.0"
- **Flutter**: ">=3.22.0"

### 2. Clean Architecture
The project follows Clean Architecture principles, which include three main layers:
- **Data Layer**
- **Domain Layer**
- **Presentation Layer**

### 3. State Management
- **Bloc Pattern**

### 4. Dependency Injection
- **GetIt**

### 5. API Consumer
- **Retrofit**.
- **Dio**.

## C. Main Features

### 1. Weather Display:
- **Current Weather Conditions**: Displays the current weather conditions for the user's location.
- **3-Hour Weather Forecast**: Provides a 3-hour weather forecast.
- **5-Day Weather Forecast**: Displays weather predictions for the next 5 days.
- **Dynamic Themes**: The app automatically changes its color theme and background based on the current weather type (Sunny, Rain, Thunderstorm, Misty, Snow, Cloud).

### 2. API Integration:
- The app uses the [OpenWeatherMap 5 Day / 3 Hour Forecast API](https://openweathermap.org/forecast5) to fetch weather data.

## D. Packages Used

The following packages are utilized in the project:

- **flutter_bloc**
- **get_it**
- **dio**
- **retrofit**
- **flutter_screenutil**
- **retrofit_generator**
- **google_fonts**
- **get**
- **flutter_svg**
- **flutter_dotenv**
- **build_runner**
- **meta**
- **bloc**
- **geolocator**
- **intl**
- **collection**

- **geocoding**

## E. Credits

**App Design**
- UI references from [Mark Vassilevsky](https://www.figma.com/community/file/1177627357046864157) and [Julia Prokhorova](https://www.figma.com/community/file/1249011821506249463).
- Theme example for Cloudy and Rainy:
<p align="center">
  <img src="https://github.com/user-attachments/assets/be982ef9-ba5c-4d28-81f3-78e156c836b8" width=220 height=480>
  <img src="https://github.com/user-attachments/assets/2f56f366-a017-405f-92c8-6187a4489c54" width=220 height=480>
  <img src="https://github.com/user-attachments/assets/1cdb5814-377a-4ce6-8620-54a828596878" width=220 height=480>
</p>p

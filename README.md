# Kantin App

A Flutter application for canteen management with user and admin roles.

## Features

- Clean Architecture (Presentation, Domain, Data layers)
- User Authentication with roles (User/Admin)
- User Dashboard:
  - Browse food items
  - Cart management
  - Order tracking
  - Chat support
  - Profile management
- Admin Dashboard:
  - Menu management
  - Order management
  - User management
  - Analytics
  - Inventory management

## Getting Started

### Prerequisites

- Flutter SDK (^3.5.4)
- Dart SDK (^3.5.4)

### Installation

1. Clone the repository
```bash
git clone https://github.com/yourusername/kantin_app.git
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

### Demo Credentials

- Admin:
  - Email: admin@example.com
  - Password: admin123

- User:
  - Email: user@example.com
  - Password: user123

## Project Structure

```
lib/
  ├── data/
  │   ├── models/
  │   ├── repositories/
  │   └── datasources/
  ├── domain/
  │   ├── entities/
  │   ├── repositories/
  │   └── usecases/
  └── presentation/
      ├── providers/
      ├── screens/
      │   ├── onboarding/
      │   ├── auth/
      │   ├── user/
      │   ├── admin/
      │   └── features/
      └── widgets/
```

## Dependencies

- provider: State management
- shared_preferences: Local storage
- flutter_svg: SVG support
- go_router: Navigation

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

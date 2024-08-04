# cosmocloud

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

## How to run Locally

1. Clone the repository into your system

```
git clone "https://github.com/dibyanshu-mohanty/cosmo.git"
```

2. Setup your Cosmocloud account and connect it to the Mongo Cluster (Refer Documentation)

3. Replace the credentials in the `.env` file as per this

```
PROJECT_ID = "${PROJECT_ID}",
ENVIRONMENT_ID = "${ENV_ID}",
```

4. Install the dependencies

```
pub get
```

5. Replace the `baseUrl` with your Base Url from Cosmocloud in the `services/network_service.dart` file.

6. Run the application on Virtual or Physical Device

```
flutter run lib/main.dart
```

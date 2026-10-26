# Simple Banking App

A small Flutter practice app. It displays a sample balance and lets you deposit or withdraw $50. The balance is not saved and resets when the app restarts.

## What you need

- Flutter installed
- Visual Studio Code, Android Studio, or another code editor
- An Android emulator, iOS simulator, or connected phone to run the app

To check that Flutter is ready, open a terminal and run:

```powershell
flutter doctor
```

## Create the app manually

### 1. Create a Flutter project

In a terminal, go to the folder where you want the project, then run:

```powershell
flutter create simple_banking_app
cd simple_banking_app
code .
```

If the `code .` command is not available, open Visual Studio Code and choose **File > Open Folder**, then select the `simple_banking_app` folder.

### 2. Get the project packages

Open the VS Code terminal (**Terminal > New Terminal**) and run:

```powershell
flutter pub get
```

### 3. Create the account screen file

In VS Code, create a file named `account_page.dart` inside the `lib` folder. Its path should be `lib/account_page.dart`.

Paste this code into the file:

```dart
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  // This sample balance resets when the app restarts.
  double balance = 1250.00;

  void changeBalance(double amount) {
    setState(() {
      balance += amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bank'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Available balance'),
            Text(
              '\$${balance.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => changeBalance(50),
              child: const Text('Deposit \$50'),
            ),
            ElevatedButton(
              onPressed: balance >= 50 ? () => changeBalance(-50) : null,
              child: const Text('Withdraw \$50'),
            ),
          ],
        ),
      ),
    );
  }
}
```

### 4. Set up the app entry point

Open `lib/main.dart`, delete its existing contents, and paste:

```dart
import 'package:flutter/material.dart';
import 'account_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AccountPage(),
    );
  }
}
```

### 5. Run the app

Start an emulator or connect a device, then run this in the terminal:

```powershell
flutter run
```

You should see **My Bank**, a starting balance of **$1,250.00**, and buttons to deposit or withdraw $50. The withdrawal button is disabled if the balance is less than $50.

## How the balance changes

- `balance` holds the current sample balance.
- `changeBalance(50)` adds $50; `changeBalance(-50)` subtracts $50.
- `setState` tells Flutter to redraw the screen after the balance changes.
- `toStringAsFixed(2)` displays the balance with two decimal places.

## Optional: run the widget test

If you are using this repository, it includes a test for the deposit and withdrawal buttons. Run it with:

```powershell
flutter test
```

This is only a learning demo; it does not connect to a bank or save account data.

## Understand the Dart files

- [Flutter project structure guide](./PROJECT_STRUCTURE.md)
- [Detailed explanation of `main.dart`](./MAIN_DART_EXPLAINED.md)
- [Detailed explanation of `account_page.dart`](./ACCOUNT_PAGE_DART_EXPLAINED.md)

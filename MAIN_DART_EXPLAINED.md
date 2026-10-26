# `main.dart` — explained line by line

This file starts the Flutter application and tells Flutter which screen to show first. It does not contain the banking screen itself; that screen is in `lib/account_page.dart`.

## The complete file

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

## Line-by-line explanation

### Imports

```dart
import 'package:flutter/material.dart';
```

- `import` makes code from another library available in this file.
- `package:flutter/material.dart` is Flutter's Material Design library.
- It provides `StatelessWidget`, `Widget`, `BuildContext`, and `MaterialApp`, among many other things.
- This app uses Material widgets, which are the standard ready-made building blocks for a Flutter interface.

```dart
import 'account_page.dart';
```

- This imports the Dart file that contains the `AccountPage` class.
- The file is in the same `lib` folder as `main.dart`, so the short relative path is enough.
- Without this import, this file would not know what `AccountPage` means.

### The app's starting function

```dart
void main() {
```

- `main` is the starting function of a Dart application.
- Flutter calls it when the app starts.
- `void` means the function does not return a value.
- `{` begins the function body. The matching `}` ends it.

```dart
  runApp(const MyApp());
```

- `runApp` is a Flutter function that starts drawing the app.
- `MyApp()` creates the root widget, meaning the first widget at the top of this app's widget tree.
- `const` says this widget can be created as a compile-time constant because its initial configuration does not change.
- The root widget creates the overall app setup and chooses the first screen.

```dart
}
```

- Ends the `main` function.

### The root app class

```dart
class MyApp extends StatelessWidget {
```

- `class MyApp` defines a class named `MyApp`. A class describes the structure and behavior of objects created from it.
- `extends StatelessWidget` means `MyApp` is a kind of Flutter `StatelessWidget`.
- A widget is Flutter's description of part of the user interface.
- `StatelessWidget` is the right parent here because the app setup in this class does not need to change while the app is running. It only selects a home screen and sets an app option.
- Flutter provides the parent class. By extending it, `MyApp` follows Flutter's rules for a widget and supplies the required `build` method.
- `{` begins the class body.

```dart
  const MyApp({super.key});
```

- This is the constructor: it creates a `MyApp` widget.
- `const` allows Flutter to treat this widget as constant when its inputs are constant.
- `{super.key}` accepts an optional named `key` argument and passes it to the parent `StatelessWidget`.
- A `Key` can help Flutter identify a widget when widgets are added, removed, or reordered. This simple app does not set a key explicitly, but passing it through is a standard widget pattern.
- `;` ends this short constructor.

```dart
  @override
```

- `@override` tells Dart that the next method replaces a method provided by the parent class.
- Here, `MyApp` supplies its own `build` method, as required for a `StatelessWidget`.
- Dart can warn if a method marked this way does not actually match a parent method.

```dart
  Widget build(BuildContext context) {
```

- `Widget` is the type of value this method returns: a description of a user-interface element.
- `build` is the method Flutter calls when it needs this widget's interface.
- `BuildContext context` describes where this widget sits in the widget tree. Flutter uses it to find surrounding app information, themes, and other inherited settings.
- This simple method does not need to read anything from `context`, but Flutter's `build` method signature includes it.
- `{` begins the method body.

```dart
    return const MaterialApp(
```

- `return` gives the result of this build method back to Flutter.
- `MaterialApp` is a Flutter widget that sets up common app-level Material features, including navigation, theme support, and the initial route.
- `const` is possible because the values provided to this `MaterialApp` are constant widgets and settings.
- `(` starts the list of named settings passed to `MaterialApp`.

```dart
      debugShowCheckedModeBanner: false,
```

- This sets a `MaterialApp` option.
- The option controls the small “DEBUG” banner Flutter can show in debug builds.
- `false` hides that banner.
- The comma separates this setting from the next one.

```dart
      home: AccountPage(),
```

- `home` tells `MaterialApp` which widget to show as the app's first screen.
- `AccountPage()` creates the banking screen defined in `account_page.dart`.
- `AccountPage` is stateful, so it must be created as an actual widget instance; it is not written as `const` in this line.
- This is the connection between the app setup and the banking screen.

```dart
    );
```

- `)` closes the `MaterialApp` constructor's arguments.
- `;` ends the `return` statement.

```dart
  }
```

- Ends the `build` method.

```dart
}
```

- Ends the `MyApp` class.

## Why does `MyApp` extend `StatelessWidget`?

`MyApp` only sets up the app and selects `AccountPage` as the home screen. It does not store or change the account balance. Therefore, a `StatelessWidget` is a suitable parent.

The balance changes on the account screen, so that separate screen uses `StatefulWidget`. Keeping these roles separate makes the app easier to understand:

1. `main()` starts the app.
2. `MyApp` sets up the Material app.
3. `AccountPage` displays and updates the sample account balance.

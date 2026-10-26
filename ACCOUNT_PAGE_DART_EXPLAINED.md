# `account_page.dart` — explained line by line

This file builds the banking screen. It displays a sample balance and has buttons to deposit or withdraw $50. Because the balance changes when a button is tapped, this screen uses a `StatefulWidget`.

## The complete file

```dart
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  // This is a sample balance; it resets when the app restarts.
  double balance = 1250.00;

  void changeBalance(double amount) {
    setState(() {
      balance += amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Bank')),
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

## Line-by-line explanation

### Import

```dart
import 'package:flutter/material.dart';
```

- Imports Flutter's Material Design widgets.
- This file uses widgets and types such as `StatefulWidget`, `State`, `Widget`, `BuildContext`, `Scaffold`, `AppBar`, `Text`, and `ElevatedButton`.

### The screen widget

```dart
class AccountPage extends StatefulWidget {
```

- Defines a widget class named `AccountPage`.
- `extends StatefulWidget` means this widget can have data that changes while the app is running.
- The balance changes after a deposit or withdrawal, so this screen needs state.
- `StatefulWidget` itself holds the widget's configuration. Flutter pairs it with a separate `State` object that holds the changing data.
- `{` starts the class body.

```dart
  const AccountPage({super.key});
```

- Defines the constructor used to create the screen.
- `const` allows the widget configuration to be constant.
- `{super.key}` accepts an optional widget key and passes it to the parent `StatefulWidget`.
- The changing balance is not stored in this constructor; it lives in the state class below.

```dart
  @override
```

- Marks the next method as an implementation of a method declared by `StatefulWidget`.

```dart
  State<AccountPage> createState() => _AccountPageState();
```

- `createState` is how a `StatefulWidget` creates the object that holds its changing data.
- `State<AccountPage>` means the returned object is a state object associated with an `AccountPage`.
- `=>` is Dart's short syntax for a method that returns one expression.
- `_AccountPageState()` creates the state object used by this screen.
- The underscore at the start of `_AccountPageState` makes that class private to this Dart file.
- The state object is created and managed by Flutter; you normally do not create it yourself.

```dart
}
```

- Ends the `AccountPage` class.

### The screen's state

```dart
class _AccountPageState extends State<AccountPage> {
```

- Defines the private state class for `AccountPage`.
- `extends State<AccountPage>` means it is Flutter state specifically associated with the `AccountPage` widget.
- The parent `State` class provides lifecycle behavior and methods needed to update the interface, including `setState`.
- The leading underscore means other Dart files cannot directly access this class.
- `{` starts the state class body.

```dart
  // This is a sample balance; it resets when the app restarts.
```

- A comment for people reading the code; Dart ignores it when running the app.
- It explains that the balance is temporary and is not written to a database or file.

```dart
  double balance = 1250.00;
```

- Creates the `balance` variable and gives it the starting value `1250.00`.
- `double` represents a number that can have a fractional part, such as cents.
- The value is stored in the state object, so it remains available while this screen is running.
- This is only a practice value; it is not a real bank balance.

### Changing the balance

```dart
  void changeBalance(double amount) {
```

- Defines a helper method named `changeBalance`.
- `void` means the method does not return a result.
- `double amount` is the number to add to the balance.
- A positive `amount`, such as `50`, deposits money. A negative `amount`, such as `-50`, withdraws money.
- `{` starts the method body.

```dart
    setState(() {
```

- `setState` is provided by the parent `State<AccountPage>` class.
- It tells Flutter that data used to build this screen is changing and that the screen should be rebuilt.
- The function inside `setState` contains the change to the state.
- If you changed `balance` without calling `setState`, the value could change in memory but Flutter would not know that it needs to redraw the displayed balance.

```dart
      balance += amount;
```

- Adds `amount` to the current balance.
- This is shorthand for `balance = balance + amount`.
- For a deposit, `1250 + 50` becomes `1300`.
- For a withdrawal, `1300 + (-50)` becomes `1250`.

```dart
    });
```

- `}` closes the function passed to `setState`.
- `);` ends the call to `setState`.
- Flutter can now rebuild this screen using the updated balance.

```dart
  }
```

- Ends the `changeBalance` method.

### Building the visible screen

```dart
  @override
```

- Marks the following `build` method as the implementation of a method provided by the parent `State` class.
- Flutter calls this method to get the current interface for the screen.

```dart
  Widget build(BuildContext context) {
```

- `Widget` is the type of interface description this method returns.
- `build` describes what should be visible on the screen.
- `BuildContext context` gives Flutter information about this widget's location in the app's widget tree.
- The method runs again when Flutter rebuilds this state after `setState`.
- `{` starts the build method body.

```dart
    return Scaffold(
```

- Returns a `Scaffold`, a standard Material Design page layout.
- `Scaffold` provides common screen areas, including the top app bar and the main body.
- `(` begins the list of settings for the scaffold.

```dart
      appBar: AppBar(title: const Text('My Bank')),
```

- Sets the screen's top bar using an `AppBar`.
- `title:` supplies the title widget to show in that bar.
- `Text('My Bank')` creates the visible title.
- `const` marks the text as constant because its contents do not change.

```dart
      body: Center(
```

- Sets the main content area of the scaffold.
- `Center` positions its child in the center of the available body area.
- Its child is the `Column` below.

```dart
        child: Column(
```

- `child` sets the single widget that `Center` will center.
- `Column` lays out its children vertically, one below another.

```dart
          mainAxisAlignment: MainAxisAlignment.center,
```

- Controls how a `Column` positions its children along its main axis.
- A `Column`'s main axis is vertical.
- `MainAxisAlignment.center` groups the children around the vertical center of the available space.

```dart
          children: [
```

- `children` is the list of widgets the column will place vertically.
- `[` begins the list.

```dart
            const Text('Available balance'),
```

- Displays the fixed label “Available balance”.
- `Text` is Flutter's basic widget for displaying words.
- `const` is used because the label never changes.

```dart
            Text(
```

- Starts the text widget that displays the current balance.
- This text is not `const`, because its contents depend on the changing `balance`.

```dart
              '\$${balance.toStringAsFixed(2)}',
```

- Builds the text shown to the user using Dart string interpolation.
- `\$` displays a literal dollar sign. The backslash prevents `$` from being interpreted as the start of interpolation.
- `${...}` inserts the result of a Dart expression into the string.
- `balance.toStringAsFixed(2)` converts the number to text with exactly two digits after the decimal point.
- For a balance of `1250`, the displayed text becomes `$1250.00`.

```dart
              style: const TextStyle(fontSize: 32),
```

- Sets the appearance of the balance text.
- `TextStyle` is used to configure text appearance.
- `fontSize: 32` makes the balance larger than normal text.
- `const` is valid because the style is fixed and does not depend on changing values.

```dart
            ),
```

- Closes the balance `Text` widget.

```dart
            const SizedBox(height: 24),
```

- Adds a fixed-height blank space of 24 logical pixels between the balance and the first button.
- `SizedBox` is a simple widget often used for spacing.
- `const` is possible because the height is fixed.

### Deposit button

```dart
            ElevatedButton(
```

- Starts a Material Design button with a raised/elevated appearance.
- An `ElevatedButton` accepts an `onPressed` action and a child widget for its label.

```dart
              onPressed: () => changeBalance(50),
```

- Sets what happens when the user taps the button.
- `() => ...` creates a short function with no arguments.
- `changeBalance(50)` adds 50 to the current balance.
- The function is passed to the button; it is not run while the screen is being built.

```dart
              child: const Text('Deposit \$50'),
```

- Sets the button's visible label.
- The `\$` shows a literal dollar symbol in the text.
- `const` is used because the label never changes.

```dart
            ),
```

- Closes the deposit button.

### Withdrawal button

```dart
            ElevatedButton(
```

- Starts a second elevated button, this one for withdrawing money.

```dart
              onPressed: balance >= 50 ? () => changeBalance(-50) : null,
```

- Determines whether the button can be pressed and what pressing it does.
- `balance >= 50` checks whether at least $50 is available.
- `?` and `:` form a conditional expression: `condition ? valueIfTrue : valueIfFalse`.
- If the balance is at least 50, the button gets a function that calls `changeBalance(-50)`.
- `-50` is negative, so adding it subtracts $50 from the balance.
- If the balance is below 50, `null` is supplied instead of a function. Flutter treats a button with `onPressed: null` as disabled.
- This check prevents the sample balance from going below zero through this button.

```dart
              child: const Text('Withdraw \$50'),
```

- Sets the withdrawal button's fixed text.
- The escaped dollar sign displays as a normal `$` character.

```dart
            ),
```

- Closes the withdrawal button.

### Closing the widget tree

```dart
          ],
```

- `]` ends the list of `Column` children.
- `,` separates the `children` argument from the end of the `Column` constructor.

```dart
        ),
```

- Closes the `Column`, which is the child of `Center`.

```dart
      ),
```

- Closes the `Center`, which is the `body` of `Scaffold`.

```dart
    );
```

- Closes the `Scaffold` constructor and ends the `return` statement.

```dart
  }
```

- Ends the `build` method.

```dart
}
```

- Ends the `_AccountPageState` class.

## Why are there two classes for one screen?

Flutter separates a stateful screen into two classes because the screen configuration and its changing data have different jobs:

1. **`AccountPage extends StatefulWidget`** describes the screen as a widget and lets Flutter know that the screen has changing state.
2. **`_AccountPageState extends State<AccountPage>`** holds the changing balance, responds to button taps, and builds the current interface.

When `changeBalance` calls `setState`, Flutter asks the state object to run `build` again. The new build reads the updated `balance` and displays the new amount.

## Important limitation

This is a learning example, not real banking software. The balance exists only in memory: it resets to `$1250.00` when the app restarts, and the buttons do not contact a bank or perform real transactions.

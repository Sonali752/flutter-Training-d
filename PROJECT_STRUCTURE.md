# Flutter Project Structure

This guide explains the folders and files in this project: what they are for, which ones you normally edit, and which ones Flutter or your editor creates.

## Project tree

The project currently looks like this:

```text
simple_banking_app/
├── .dart_tool/
├── .idea/
├── build/
├── lib/
│   ├── account_page.dart
│   └── main.dart
├── test/
│   └── widget_test.dart
├── web/
│   ├── icons/
│   ├── favicon.png
│   ├── index.html
│   └── manifest.json
├── .gitignore
├── .metadata
├── analysis_options.yaml
├── pubspec.lock
├── pubspec.yaml
└── simple_banking_app.iml
```

Folders and files that start with a dot, such as `.dart_tool`, are hidden in some file browsers. In VS Code, they may appear in the Explorer depending on your settings.

## The folders

### `lib/` — your app's Dart code

This is the main folder where you write the Dart code for your application. Flutter starts from `main.dart`, and the app's screens and other code can be split into additional Dart files here.

- `main.dart` starts the app and chooses its first screen.
- `account_page.dart` builds the account screen and handles its sample balance.

These are the files you will most often edit while learning to build the app.

### `test/` — automated tests

This folder contains tests that check whether parts of your app work as expected.

- `widget_test.dart` checks that the displayed balance changes when the deposit and withdrawal buttons are tapped.

Run the tests from a terminal opened in the project folder:

```powershell
flutter test
```

### `web/` — files used when building for the web

This folder contains the web-specific starting page and browser settings. Flutter uses these files when you run or build the app for a browser.

- `index.html` is the browser page that hosts the Flutter app.
- `manifest.json` provides web-app information, such as its name and icons.
- `favicon.png` is the small icon shown in the browser tab.
- `icons/` contains larger icons used by the web app.

Most app screens and behavior should still be written in `lib/`. You usually only edit files in `web/` when changing browser-specific details, app icons, or web metadata.

### `.dart_tool/` — generated Dart and Flutter files

This hidden folder is created and updated by Dart and Flutter tools. For example, `flutter pub get` writes package information here so the project can find its dependencies.

You normally **do not edit files in `.dart_tool/` by hand**. It is generated tooling data, not the place for app code.

### `build/` — generated build output

Flutter creates this folder when it builds or tests the app. It can contain compiled output, temporary build files, and copied assets.

You normally **do not edit files in `build/`**. The contents are generated from your source code and project settings.

### `.idea/` — IDE settings

This folder contains project configuration used by JetBrains IDEs, such as Android Studio or IntelliJ IDEA. It may contain editor settings or run configurations.

It is not where the Flutter app's screens are implemented. Whether you keep its settings depends on your IDE and how you share the project.

## Important files in the project root

### `pubspec.yaml` — project and dependency settings

This is the main Flutter project configuration file. It includes the project name, Dart SDK constraints, dependencies, and Flutter options such as Material Design support.

When you add a package or configure assets and fonts, this is usually where you declare them. YAML uses indentation to show which settings belong together, so preserve the indentation when editing it.

After changing dependencies, run:

```powershell
flutter pub get
```

### `pubspec.lock` — exact package versions

This file records the resolved versions of the project's dependencies. Flutter and Dart generate or update it when packages are resolved.

For an application, keep this file with the project so dependency versions can be reproduced more consistently. Do not usually edit it manually; change dependency declarations in `pubspec.yaml` instead.

### `analysis_options.yaml` — Dart analyzer rules

This file configures the Dart analyzer and linter. These tools inspect code and report problems, possible mistakes, and style suggestions in the editor or terminal.

You can change these rules as you learn, but the app can run without changing them.

### `.gitignore` — files Git should ignore

This file tells Git which generated files and local editor files should not normally be tracked as source. It includes entries such as `.dart_tool/` and `build/`.

These folders can be recreated by Flutter, so they usually do not need to be included in the shared source code.

### `.metadata` — Flutter project metadata

Flutter uses this file to keep project and platform metadata. It is maintained by Flutter tooling and is not part of the app's screen code.

### `simple_banking_app.iml` — IDE module file

This file is used by IntelliJ-based IDEs to describe the project module. It is editor configuration, not Dart source code.

## Why are there no `android/` or `ios/` folders here?

Flutter projects can include platform folders such as `android/`, `ios/`, `windows/`, or `macos/`. This project currently has a `web/` platform folder, but the other platform folders are not in its current tree.

The Dart code in `lib/` is where the shared app UI and behavior live. Platform folders contain the native project configuration needed to launch or package the app for a particular platform. They are typically created when that platform is included in the Flutter project.

## What should I edit?

For this sample app, focus on:

| Goal | File or folder |
| --- | --- |
| Change the startup or first screen | `lib/main.dart` |
| Change the account screen or balance behavior | `lib/account_page.dart` |
| Add or change a widget test | `test/widget_test.dart` |
| Change project settings or dependencies | `pubspec.yaml` |
| Change browser page details or web icons | `web/` |

Usually, do not hand-edit `.dart_tool/` or `build/`; the Flutter tools manage those folders.

## Related code explanations

- [Detailed explanation of `main.dart`](./MAIN_DART_EXPLAINED.md)
- [Detailed explanation of `account_page.dart`](./ACCOUNT_PAGE_DART_EXPLAINED.md)

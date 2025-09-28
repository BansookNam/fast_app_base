# fast_app_base

A new Flutter project.
## Use as a global template generator

This package can be installed as a global executable so you can generate a new project from this template with a single command.

### 1) Install (global)

```bash
dart pub global activate fast_app_base
```

If you previously installed it, the same command updates to the latest published version.

### 2) Create a new project from the template

```bash
fast_app_base my_new_app
```

This will:
- Copy the template into a new directory named `my_new_app`.
- Update `pubspec.yaml` to set `name: my_new_app`.
- Skip copying development artifacts like `.git`, `.dart_tool`, `build`, `pubspec.lock`, `bin`, `LICENSE`, and `README.md`.

### 3) Next steps

```bash
cd my_new_app
flutter pub get
flutter run
```

### 4) Uninstall (global)

```bash
dart pub global deactivate fast_app_base
```

### PATH setup (only if command is not found)

Make sure your global pub executables are on PATH. On macOS with zsh, add this to your `~/.zshrc`:

```bash
export PATH="$HOME/.pub-cache/bin:$PATH"
```

Then restart your terminal or run `source ~/.zshrc`.

### Local development (optional)

If you’re iterating on the template locally and want to test without publishing:

```bash
dart pub global activate --source path /absolute/path/to/fast_app_base
```

Then run:

```bash
fast_app_base test_app
```

### Requirements

- Dart SDK >= 3.0.0
- Flutter >= 3.0.0

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

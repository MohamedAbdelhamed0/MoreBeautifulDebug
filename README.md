
# MoreBeautifulDebug

MoreBeautifulDebug is a Dart extension that enhances your console output by adding colorful and emoji-based status messages. This package aims to make your debugging experience more enjoyable and visually appealing.

## Features

- Colorful console output with emojis for different statuses.
- Support for success, error, warning, info, and custom statuses.
- Optional boxed messages for better visibility.
- Stack trace inclusion for error messages.

## Getting Started

### Installation

Add `more_beautiful_debug` to your `pubspec.yaml`:

```yaml
dependencies:
  more_beautiful_debug:
    git:
      url: https://github.com/MohamedAbdelhamed0/morebeautifuldebug.git
```

Then, run `flutter pub get` to install the package.

### Usage

Import the package in your Dart file:

```dart
import 'package:more_beautiful_debug/more_beautiful_debug.dart';
```

Extend any string with the `StatusPrint` extension methods to print beautiful and informative messages.

### Examples

#### Success Message

```dart
'Operation completed successfully'.success();
```

**Output:**

```
✅ Operation completed successfully
```

#### Error Message

```dart
'An error occurred'.error(errorMessage: 'Null pointer exception');
```

**Output:**

```
❌ Null pointer exception
# Stack trace (first 4 lines)...
```

#### Warning Message

```dart
'This is a warning'.warning(warningMessage: 'Low disk space');
```

**Output:**

```
⚠️ Low disk space
```

#### Info Message

```dart
'Just some info'.info();
```

**Output:**

```
ℹ️ Just some info
```

#### Custom Status

```dart
'Custom message with custom1 status'.custom(Status.custom1);
```

**Output:**

```
💡 Custom message with custom1 status
```

#### Boxed Message

```dart
'This is a boxed success message'.success(inBox: true);
```

**Output:**

```
╔════════════════════════════════════════════╗
║  ✅ This is a boxed success message         ║
╚════════════════════════════════════════════╝
```

## Contribution

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.



<img src="https://github.com/user-attachments/assets/b06e9f6a-2bcc-4bc1-b93c-27950c9aa612" alt="test" style="border: 2px solid black; display: block; margin: 20px auto; max-width: 100%;">

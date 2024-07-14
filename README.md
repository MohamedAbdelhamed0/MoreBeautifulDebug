
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

```shell
[32m[1m✅ Operation completed successfully[0m
```

#### Error Message

```dart
'An error occurred'.error(errorMessage: 'Null pointer exception');
```

**Output:**

```shell
[38;5;88m[1m❌ Null pointer exception
# Stack trace (first 4 lines)...[0m
```

#### Warning Message

```dart
'This is a warning'.warning(warningMessage: 'Low disk space');
```

**Output:**

```shell
[38;5;214m[1m⚠️ Low disk space[0m
```

#### Info Message

```dart
'Just some info'.info();
```

**Output:**

```shell
[34m[1mℹ️ Just some info[0m
```

#### Custom Status

```dart
'Custom message with custom1 status'.custom(Status.custom1);
```

**Output:**

```shell
[35m[1m💡 Custom message with custom1 status[0m
```

#### Boxed Message

```dart
'This is a boxed success message'.success(inBox: true);
```

**Output:**

```shell
╔════════════════════════════════════════════╗
║  [32m[1m✅ This is a boxed success message[0m         ║
╚════════════════════════════════════════════╝
```

## Contribution

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

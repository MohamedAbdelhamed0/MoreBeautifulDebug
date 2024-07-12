import 'package:flutter/foundation.dart';

// Define color codes
const String green = '\u001b[32m';
const String darkRed = '\u001b[38;5;88m';
const String orange = '\u001b[38;5;214m';
const String blue = '\u001b[34m';
const String purple = '\u001b[35m';
const String cyan = '\u001b[36m';
const String reset = '\u001b[0m';

// Define bold code
const String bold = '\u001b[1m';

// Enum for statuses
enum Status {
  success,
  error,
  warning,
  info,
  custom1,
  custom2,
}

// Extension on String to print with different statuses
extension StatusPrint on String {
  /// Method to print success status
  void success({bool inBox = false}) {
    _printWithEmojiAndColor('✅', green, inBox: inBox);
  }

  /// Method to print error status with file path and line number
  void error({String? errorMessage, bool inBox = false}) {
    if (errorMessage == null || errorMessage.isEmpty) {
      throw ArgumentError('Error message is required for Status.error');
    }
    try {
      throw Exception();
    } catch (e, stackTrace) {
      _printWithEmojiAndColor('❌', darkRed,
          errorMessage: errorMessage, stackTrace: stackTrace, inBox: inBox);
    }
  }

  /// Method to print warning status with optional message
  void warning({String? warningMessage, bool inBox = false}) {
    if (warningMessage == null || warningMessage.isEmpty) {
      throw ArgumentError('Warning message is required for Status.warning');
    }
    _printWithEmojiAndColor('⚠️', orange,
        errorMessage: warningMessage, inBox: inBox);
  }

  /// Method to print info status
  void info({bool inBox = false}) {
    _printWithEmojiAndColor('ℹ️', blue, inBox: inBox);
  }

  /// Method to print a custom status with predefined color and emoji
  ///
  /// [status] - The status to print.
  /// [message] - The message to print (required for error and warning statuses).
  /// [stackTrace] - The stack trace to include for error statuses.
  void custom(Status status,
      {String? message, StackTrace? stackTrace, bool inBox = false}) {
    switch (status) {
      case Status.success:
        _printWithEmojiAndColor('✅', green, inBox: inBox);
        break;
      case Status.error:
        if (message == null || message.isEmpty) {
          throw ArgumentError('Error message is required for Status.error');
        }
        try {
          throw Exception();
        } catch (e, stackTrace) {
          _printWithEmojiAndColor('❌', darkRed,
              errorMessage: message, stackTrace: stackTrace, inBox: inBox);
        }
        break;
      case Status.warning:
        if (message == null || message.isEmpty) {
          throw ArgumentError('Warning message is required for Status.warning');
        }
        _printWithEmojiAndColor('⚠️', orange,
            errorMessage: message, inBox: inBox);
        break;
      case Status.info:
        _printWithEmojiAndColor('ℹ️', blue, inBox: inBox);
        break;
      case Status.custom1:
        _printWithEmojiAndColor('💡', purple, inBox: inBox);
        break;
      case Status.custom2:
        _printWithEmojiAndColor('🔔', cyan, inBox: inBox);
        break;
      default:
        if (kDebugMode) {
          print(this);
        }
    }
  }

  /// Private method to print with emoji, color, and optional error message and stack trace
  ///
  /// [emoji] - The emoji to print.
  /// [colorCode] - The color code to use for printing.
  /// [errorMessage] - The error message to print.
  /// [stackTrace] - The stack trace to include.
  /// [inBox] - Whether to print the message in a box.
  void _printWithEmojiAndColor(String emoji, String colorCode,
      {String? errorMessage, StackTrace? stackTrace, bool inBox = false}) {
    String message = errorMessage ?? this;
    String output;

    if (stackTrace != null) {
      var traceLines = stackTrace.toString().split('\n');
      var limitedStackTrace = traceLines.take(4).join('\n');
      output = '$colorCode$bold$emoji $message\n$limitedStackTrace$reset';
    } else {
      output = '$colorCode$bold$emoji $message$reset';
    }

    if (inBox) {
      output = _boxMessage(output);
    }

    if (kDebugMode) {
      print(output);
    }
  }

  /// Private method to create a box around the message
  String _boxMessage(String message) {
    var lines = message.split('\n');
    var maxLength =
        lines.map((line) => line.length).reduce((a, b) => a > b ? a : b);
    var border = '═' * (maxLength + 4);

    var boxedMessage = StringBuffer()
      ..writeln('╔$border╗')
      ..writeln(lines
          .map((line) => '║  $line${' ' * (maxLength - line.length)}  ║')
          .join('\n'))
      ..writeln('╚$border╝');

    return boxedMessage.toString();
  }
}

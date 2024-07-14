import 'package:flutter/material.dart';
import 'package:more_beautiful_debug/more_beautiful_debug.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      // Add try-catch block for print statements
      try {
        switch (_counter) {
          case 1:
            print('Before: Counter incremented to $_counter');
            'After Counter incremented to $_counter'.success();
            break;
          case 2:
            print('Before: This is an info message');
            'After This is an info message'.info();
            break;
          case 3:
            print('Before: This is a warning message: Low disk space');
            'After This is a warning message'
                .warning(warningMessage: 'Low disk space');
            break;
          case 4:
            print('Before: This is a custom1 message');
            ' After This is a custom1 message'.custom(Status.custom1);
            break;
          default:
            print('Before: Counter incremented to $_counter');
            ' After Counter incremented to $_counter'.success(inBox: true);
            print('Before: This is a general info message');
            'After This is a general info message'.info();
            print('Before: This is a general warning message: General warning');
            'This is a general warning message'
                .warning(warningMessage: 'General warning');
            print('Before: This is a general custom1 message');
            'After This is a general custom1 message'.custom(Status.custom1);
            break;
        }
      } catch (e, stackTrace) {
        print('Before: Error: $e');
        'After Error: $e'.error(errorMessage: e.toString());
        print('Before: Stack Trace:\n$stackTrace');
        'After Stack Trace:\n$stackTrace'
            .error(errorMessage: 'Stack trace details');
        print('Before: Failed to show success message');
        'After Failed to show success message'
            .error(errorMessage: 'Success message error');
        print('Before: Failed to show info message');
        'After Failed to show info message'
            .error(errorMessage: 'Info message error');
        print('Before: Failed to show warning message');
        'After Failed to show warning message'
            .error(errorMessage: 'Warning message error');
        print('Before: Failed to show custom1 message');
        'After Failed to show custom1 message'
            .error(errorMessage: 'Custom1 message error');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Add try-catch block for build method
    try {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );
    } catch (e) {
      'Error in build method: $e'.error(errorMessage: e.toString());
      return Scaffold(
        body: Center(
          child: Text(
            'An error occurred',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      );
    }
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp(counterSeed: 0));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.counterSeed});

  final int counterSeed;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        counterSeed: counterSeed,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.counterSeed});

  final String title;
  final int counterSeed;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? _counter;

  void _decrementCounter() {
    setState(() {
      _counter ??= widget.counterSeed;
      final previousCounter = _counter;
      _counter = _counter! + 1;
      print('Decrementing counter fom $previousCounter to $_counter');
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter ??= widget.counterSeed;
      final previousCounter = _counter;
      _counter = _counter! - 1;
      print('Decrementing counter fom $previousCounter to $_counter');
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build()');

    return Scaffold(
      appBar: AppBar(
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
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

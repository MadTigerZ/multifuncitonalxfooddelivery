import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Math & Conversions',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: MathPage(),
    );
  }
}

class MathPage extends StatefulWidget {
  @override
  _MathPageState createState() => _MathPageState();
}

class _MathPageState extends State<MathPage> {
  // Variable to track the current page
  int _currentTab = 0;

  // List of pages for the Bottom Navigation
  final List<Widget> _pages = [
    CalculatorPage(),
    TemperaturePage(),
    CurrencyPage(),
    WeightPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Math & Conversions'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: _pages[_currentTab], // Display the current selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (index) {
          setState(() {
            _currentTab = index;
          });
        },
        backgroundColor: Colors.grey, // Set the bottom nav bar color to gray
        selectedItemColor: Colors.teal, // Color for selected items
        unselectedItemColor: Colors.white, // Color for unselected items
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: "Calculator",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thermostat),
            label: "Temperature",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: "Currency",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.scale),
            label: "Weight",
          ),
        ],
      ),
    );
  }
}

// Calculator Page
class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController _controller = TextEditingController();
  String _result = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Expression (e.g., 2+3*4)",
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                try {
                  Parser parser = Parser();
                  Expression exp = parser.parse(_controller.text);
                  ContextModel cm = ContextModel();
                  _result = exp.evaluate(EvaluationType.REAL, cm).toString();
                } catch (e) {
                  _result = "Error";
                }
                setState(() {});
              },
              child: Text("Calculate"),
            ),
            const SizedBox(height: 16),
            Text(
              "Result: $_result",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

// Temperature Conversion Page
class TemperaturePage extends StatefulWidget {
  @override
  _TemperaturePageState createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  final TextEditingController _controller = TextEditingController();
  String _result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Temperature Conversion")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Celsius Temperature",
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final celsius = double.tryParse(_controller.text);
                setState(() {
                  _result = celsius != null ? "${(celsius * 9 / 5) + 32} °F" : "Error";
                });
              },
              child: Text("Convert to Fahrenheit"),
            ),
            Text("Result: $_result"),
          ],
        ),
      ),
    );
  }
}

// Currency Conversion Page
class CurrencyPage extends StatefulWidget {
  @override
  _CurrencyPageState createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  final TextEditingController _controller = TextEditingController();
  String _result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Currency Conversion")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Amount in USD",
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final usd = double.tryParse(_controller.text);
                setState(() {
                  _result = usd != null ? "${usd * 14000} IDR" : "Error";
                });
              },
              child: Text("Convert to IDR"),
            ),
            Text("Result: $_result"),
          ],
        ),
      ),
    );
  }
}

// Weight Conversion Page
class WeightPage extends StatefulWidget {
  @override
  _WeightPageState createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  final TextEditingController _controller = TextEditingController();
  String _result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weight Conversion")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Weight in Kilograms",
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final kg = double.tryParse(_controller.text);
                setState(() {
                  _result = kg != null ? "${kg * 2.20462} lbs" : "Error";
                });
              },
              child: Text("Convert to Pounds"),
            ),
            Text("Result: $_result"),
          ],
        ),
      ),
    );
  }
}

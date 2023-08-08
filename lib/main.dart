import 'package:flutter/material.dart';
import 'creditos_page.dart';

void main() => runApp(CalculadoraApp());


class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculadora(),
      routes: {
        '/creditos': (context) => CreditosPage(),
      },
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String _output = "0";
  double _num1 = 0;
  double _num2 = 0;
  String _operator = "";
  bool _shouldReset = false;

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _clear();
      } else if (buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/") {
        _operator = buttonText;
        _num1 = double.parse(_output);
        _shouldReset = true;
      } else if (buttonText == "=") {
        _num2 = double.parse(_output);
        _shouldReset = true;
        _performCalculation();
      } else {
        if (_shouldReset) {
          _output = buttonText;
          _shouldReset = false;
        } else {
          _output = _output == "0" ? buttonText : _output + buttonText;
        }
      }
    });
  }

  void _performCalculation() {
    switch (_operator) {
      case "+":
        _output = (_num1 + _num2).toString();
        break;
      case "-":
        _output = (_num1 - _num2).toString();
        break;
      case "*":
        _output = (_num1 * _num2).toString();
        break;
      case "/":
        _output = (_num1 / _num2).toString();
        break;
      default:
        _output = "0";
    }
  }

  void _clear() {
    _output = "0";
    _num1 = 0;
    _num2 = 0;
    _operator = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora Flutter"),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.pushNamed(context, '/creditos');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: const TextStyle(fontSize: 70.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            children: [
              _buildButton("7"),
              _buildButton("8"),
              _buildButton("9"),
              _buildButton("/"),
            ],
          ),
          Row(
            children: [
              _buildButton("4"),
              _buildButton("5"),
              _buildButton("6"),
              _buildButton("*"),
            ],
          ),
          Row(
            children: [
              _buildButton("1"),
              _buildButton("2"),
              _buildButton("3"),
              _buildButton("-"),
            ],
          ),
          Row(
            children: [
              _buildButton("C"),
              _buildButton("0"),
              _buildButton("="),
              _buildButton("+"),
            ],
          ),
        ],
      ),
    );
  }

   Widget _buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0), // Added padding for spacing
        child: ElevatedButton(
          onPressed: () => _onButtonPressed(buttonText),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(50.0), // Adjust button size here
          ),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 32.0), // Adjust text size here
          ),
        ),
      ),
    );
  }
}
import 'package:calculadora_2/main.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  String _output = '0';
  double num1 = 0;
  double num2 = 0;
  String operand = '';


  void _buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      _clear();
    } else if (buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/') {
      num1 = double.parse(_output);
      operand = buttonText;
      _output = '0';
    } else if (buttonText == '=') {
      num2 = double.parse(_output);
      if (operand == '+') {
        _output = (num1 + num2).toString();
      }
      if (operand == '-') {
        _output = (num1 - num2).toString();
      }
      if (operand == '*') {
        _output = (num1 * num2).toString();
      }
      if (operand == '/') {
        _output = (num1 / num2).toString();
      }
      num1 = 0;
      num2 = 0;
      operand = '';
    } else {
      if (_output == '0') {
        _output = buttonText;
      } else {
        _output = _output + buttonText;
      }
    }

    setState(() {});
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(24.0),
        decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.black.withOpacity(0.2),
        ),
        ),
        child: InkWell(
          onTap: ()  => _buttonPressed(buttonText),
          focusColor: Colors.indigoAccent,
          borderRadius: BorderRadius.zero,
          radius: double.maxFinite,
          autofocus: false,
          child: Text(
            textAlign: TextAlign.center,
            buttonText,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  void _clear() {
    _output = '0';
    num1 = 0;
    num2 = 0;
    operand = '';
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(widget.title),
      ),
      backgroundColor: Colors.white54.withOpacity(0.9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
              child: Text(
                _output,
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              color: Colors.black12,
            ),
                Row(
                      children: [
                        _buildButton('7'),
                        _buildButton('8'),
                        _buildButton('9'),
                        _buildButton('/'),
                      ],
                    ),
                Row(
                  children: [
                    _buildButton('4'),
                    _buildButton('5'),
                    _buildButton('6'),
                    _buildButton('*'),
                  ],
                ),
                Row(
                  children: [
                    _buildButton('1'),
                    _buildButton('2'),
                    _buildButton('3'),
                    _buildButton('-'),
                  ],
                ),
                Row(
                  children: [
                    _buildButton('.'),
                    _buildButton('0'),
                    _buildButton('C'),
                    _buildButton('+'),
                  ],
                ),
            Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 50.0,
                      width:   MediaQuery.of(context).size.width/ 1.15,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(56)),
                        shape: BoxShape.rectangle,
                        color: Colors.blueAccent,
                      ),
                    ),
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        _buildButton('='),
                    ],
                    ),
                  ],

                ),
              ],
            ),
        ),
      );
  }
}

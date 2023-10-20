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

  Widget _buildNumberButton(String buttonText) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(width: 1, color: Colors.black,
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

  Widget _buildOperationButton(String buttonText) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: Colors.deepOrangeAccent.withOpacity(0.8),
          border: Border.all(width: 1, color: Colors.black,),
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
      backgroundColor: Colors.black,
      bottomNavigationBar: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
            child: Text(
              _output,
              style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Row(
            children: [
              _buildNumberButton('7'),
              _buildNumberButton('8'),
              _buildNumberButton('9'),
              _buildOperationButton('/'),                      ],
          ),
          Row(
            children: [
              _buildNumberButton('4'),
              _buildNumberButton('5'),
              _buildNumberButton('6'),
              _buildOperationButton('*'),
            ],
          ),
          Row(
            children: [
              _buildNumberButton('1'),
              _buildNumberButton('2'),
              _buildNumberButton('3'),
              _buildOperationButton('-'),
            ],
          ),
          Row(
            children: [
              _buildNumberButton('.'),
              _buildNumberButton('0'),
              _buildNumberButton('C'),
              _buildOperationButton('+'),
            ],
          ),
          Flex(
            direction: Axis.horizontal,
            children: [
              _buildNumberButton('='),
            ],
          ),
        ],
      ),
        );
  }
}

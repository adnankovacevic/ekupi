import 'package:flutter/material.dart';
import 'package:kupro/res/app_colors.dart';
import 'package:kupro/res/app_text_style.dart';

class AmountActionButton extends StatefulWidget {
  const AmountActionButton({super.key});

  @override
  State<AmountActionButton> createState() => _AmountActionButtonState();
}

class _AmountActionButtonState extends State<AmountActionButton> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey[300],
      ),
      width: MediaQuery.of(context).size.width / 3,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: _decrementCounter,
          ),
          SizedBox(
            width: 30,
            child: Center(
              child: Text(
                '$_counter',
                style: AppTextStyle().poppins20Black400,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _incrementCounter,
          ),
        ],
      ),
    );
  }
}

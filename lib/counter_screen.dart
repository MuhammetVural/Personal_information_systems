import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Text('_textController  $_textController')),
    );
  }
}

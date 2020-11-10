import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'second_screen.dart';

class HomeScreen extends StatelessWidget {
  void _goToSecondScreen(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (_) => SecondScreen()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CupertinoWillPopScope Demo')),
      body: Center(
        child: RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: Text('Go to second screen'),
          onPressed: () => _goToSecondScreen(context),
        ),
      ),
    );
  }
}

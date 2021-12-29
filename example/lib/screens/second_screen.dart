import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final Color _color = Colors.pink;

  /// Holds the state of the screen.
  bool _hasChanges = true;

  /// Shows an alert and returns `false` when `_hasChanges` is `true`.
  /// This prevents the navigator from popping this route.
  Future<bool> _onWillPop() async {
    if (_hasChanges) {
      // Show an alert before returning `false`.
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text('Back navigation is disabled.'),
        ),
      );

      // Return `false` to prevent the route from popping.
      return false;
    }

    return true;
  }

  /// Updates `_hasChanges` with the provided value.
  void _updateChanges(bool value) => setState(() => _hasChanges = value);

  @override
  Widget build(BuildContext context) {
    return ConditionalWillPopScope(
      onWillPop: _onWillPop,
      shouldAddCallback: _hasChanges,
      child: Scaffold(
        appBar: AppBar(title: Text('Second Screen'), backgroundColor: _color),
        body: Center(
          child: Container(
            child: SwitchListTile(
              activeColor: _color,
              onChanged: _updateChanges,
              title: Text('Disable back navigation'),
              value: _hasChanges,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: _color),
              borderRadius: BorderRadius.circular(6.0),
            ),
            margin: EdgeInsets.symmetric(horizontal: 12.0),
          ),
        ),
      ),
    );
  }
}

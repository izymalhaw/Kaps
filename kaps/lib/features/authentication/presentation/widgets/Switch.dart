import 'package:flutter/material.dart';

typedef OnSwitchChanged = void Function(bool);

class SwitchWidget extends StatefulWidget {
  final bool isSwitched;
  final OnSwitchChanged onSwitchChanged;

  const SwitchWidget({
    Key? key,
    required this.isSwitched,
    required this.onSwitchChanged,
  }) : super(key: key);

  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  late bool _isSwitched;

  @override
  void initState() {
    super.initState();
    _isSwitched = widget.isSwitched;
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _isSwitched,
      onChanged: (value) {
        setState(() {
          _isSwitched = value;
          widget.onSwitchChanged(value);
        });
      },
      activeTrackColor: Colors.yellow,
      activeColor: Colors.white,
      inactiveThumbColor: Colors.white,
      inactiveTrackColor: Colors.yellow,
    );
  }
}

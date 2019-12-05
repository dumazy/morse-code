import 'package:flutter/material.dart';

class MorseInputForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          key: Key("input"),
        )
      ],
    );
  }
}

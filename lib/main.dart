import 'package:flutter/material.dart';
import 'package:morse_code/domain/symbols.dart';
import 'package:morse_code/domain/translator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Morse code translator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String text = "";
  @override
  Widget build(BuildContext context) {
    final result = translate(text);
    return Scaffold(
      appBar: AppBar(title: Text("Morse code translator")),
      body: Column(
        children: <Widget>[
          Text("Write some text and see the translation"),
          TextField(
            onChanged: (newText) {
              setState(() {
                this.text = newText;
              });
            },
          ),
          Text("Result: $result"),
        ],
      ),
    );
  }
}

String translate(String text) {
  final symbols = translateSentence(text);
  return symbols.map<String>((MorseSymbol symbol) {
    switch (symbol) {
      case MorseSymbol.DOT:
        return ".";
      case MorseSymbol.DASH:
        return "-";
      case MorseSymbol.LETTER_SPACE:
        return " ";
      case MorseSymbol.WORD_SPACE:
        return "   ";
      default:
        return "";
    }
  }).join();
}

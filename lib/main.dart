import 'package:flutter/material.dart';
import 'package:morse_code/domain/symbols.dart';
import 'package:morse_code/domain/translator.dart';
import 'package:morse_code/ui/morse_screen.dart';
import 'package:morse_code/ui/morse_view.dart';

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
    // final result = translate(text);
    Function onTranslate = text.isEmpty
        ? null
        : () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MorseScreen(text: text)));
          };
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Write some text and see the translation"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextField(
                onChanged: (newText) {
                  setState(() {
                    this.text = newText;
                  });
                },
              ),
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: Text("Translate to morse"),
              onPressed: onTranslate,
            ),
          ],
        ),
      ),
    );
  }
}

// String translate(String text) {
//   final symbols = translateText(text);
//   return symbols.map<String>((MorseSymbol symbol) {
//     switch (symbol) {
//       case MorseSymbol.DOT:
//         return ".";
//       case MorseSymbol.DASH:
//         return "-";
//       case MorseSymbol.LETTER_SPACE:
//         return " ";
//       case MorseSymbol.WORD_SPACE:
//         return "   ";
//       default:
//         return "";
//     }
//   }).join();
// }

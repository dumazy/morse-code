import 'package:morse_code/morse/symbols.dart';

final dot = MorseSymbol.DOT;
final dash = MorseSymbol.DASH;

Map<String, List<MorseSymbol>> dictionary = {
  'a': [dot, dash],
  'b': [dash, dot, dot, dot],
  'c': [dash, dot, dash, dot],
};
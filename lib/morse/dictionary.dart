import 'package:morse_code/morse/symbols.dart';

const dot = MorseSymbol.DOT;
const dash = MorseSymbol.DASH;
const symbol_space = MorseSymbol.SYMBOL_SPACE;

Map<String, List<MorseSymbol>> dictionary = {
  'a': [dot, symbol_space, dash],
  'b': [dash, symbol_space, dot, symbol_space, dot, symbol_space, dot],
  'c': [dash, symbol_space, dot, symbol_space, dash, symbol_space, dot],
};
import 'package:morse_code/domain/symbols.dart';

const dot = MorseSymbol.DOT;
const dash = MorseSymbol.DASH;
const symbol_space = MorseSymbol.SYMBOL_SPACE;

Map<String, List<MorseSymbol>> dictionary = {
  'a': [dot, symbol_space, dash],
  'b': [dash, symbol_space, dot, symbol_space, dot, symbol_space, dot],
  'c': [dash, symbol_space, dot, symbol_space, dash, symbol_space, dot],
  'd': [dash, symbol_space, dot, symbol_space, dot],
  'e': [dot],
  'f': [dot, symbol_space, dot, symbol_space, dash, symbol_space, dot],
  'g': [dash, symbol_space, dash, symbol_space, dot],
  'h': [dot, symbol_space, dot, symbol_space, dot, symbol_space, dot],
  'i': [dot, symbol_space, dot],
  'j': [dot, symbol_space, dash, symbol_space, dash, symbol_space, dash],
  'k': [dash, symbol_space, dot, symbol_space, dash],
  'l': [dot, symbol_space, dash, symbol_space, dot, symbol_space, dot],
  'm': [dash, symbol_space, dash],
  'n': [dash, symbol_space, dot],
  'o': [dash, symbol_space, dash, symbol_space, dash],
  'p': [dot, symbol_space, dash, symbol_space, dash, symbol_space, dot],
  'q': [dash, symbol_space, dash, symbol_space, dot, symbol_space, dash],
  'r': [dot, symbol_space, dash, symbol_space, dot],
  's': [dot, symbol_space, dot, symbol_space, dot],
  't': [dash],
  'u': [dot, symbol_space, dot, symbol_space, dash],
  'v': [dot, symbol_space, dot, symbol_space, dot, symbol_space, dash],
  'w': [dot, symbol_space, dash, symbol_space, dash],
  'x': [dash, symbol_space, dot, symbol_space, dot, symbol_space, dash],
  'y': [dash, symbol_space, dot, symbol_space, dash, symbol_space, dash],
  'z': [dash, symbol_space, dash, symbol_space, dot, symbol_space, dot],

};
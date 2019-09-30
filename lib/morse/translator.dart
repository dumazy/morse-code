import 'package:morse_code/morse/dictionary.dart';
import 'package:morse_code/morse/symbols.dart';

List<MorseSymbol> translateLetter(String letter) {
  return dictionary[letter.toLowerCase()];
}

List<MorseSymbol> translateWord(String word) {
  
}
import 'package:morse_code/morse/dictionary.dart';
import 'package:morse_code/morse/symbols.dart';

List<MorseSymbol> translateLetter(String letter) {
  return dictionary[letter.toLowerCase()];
}

List<MorseSymbol> translateWord(String word) {
  
  return word.split('') // split every letter
  .map<List<MorseSymbol>>((String letter) => translateLetter(letter)) // create a list of symbol lists
  .reduce((list, symbols) {
    return [...list, MorseSymbol.SYMBOL_SPACE, ...symbols]; // add a symbol space in between
  });
}
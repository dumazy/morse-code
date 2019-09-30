import 'package:morse_code/morse/dictionary.dart';
import 'package:morse_code/morse/symbols.dart';

List<MorseSymbol> translateLetter(String letter) {
  return dictionary[letter.toLowerCase()];
}

List<MorseSymbol> translateWord(String word) {
  return word.split('') // split every letter
  .map<List<MorseSymbol>>((String letter) => translateLetter(letter)) // create a list of symbol lists
  .reduce((list, symbols) {
    return [...list, MorseSymbol.LETTER_SPACE, ...symbols]; // add a symbol space in between
  });
}

List<MorseSymbol> translateSentence(String sentence) {
  return sentence.split(' ')
    .map((String word) => translateWord(word))
    .reduce((list, symbols) {
      return [...list, MorseSymbol.WORD_SPACE, ...symbols];
    });
}
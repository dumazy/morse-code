import 'package:morse_code/domain/dictionary.dart';
import 'package:morse_code/domain/symbols.dart';

// List<MorseSymbol> translateLetter(String letter) {
//   if(dictionary.containsKey(letter.toLowerCase())) {
//     return dictionary[letter.toLowerCase()];
//   }
//   return [];
// }

Letter translateLetter(String letter) {
  return Letter(letter: letter, symbols: dictionary[letter.toLowerCase()]);
}

// List<MorseSymbol> translateWord(String word) {
//   return word.split('') // split every letter
//   .where((String letter) => dictionary.keys.contains(letter.toLowerCase()))
//   .map<List<MorseSymbol>>((String letter) => translateLetter(letter)) // create a list of symbol lists
//   .reduce((list, symbols) {
//     return [...list, MorseSymbol.LETTER_SPACE, ...symbols]; // add a symbol space in between
//   });
// }

Word translateWord(String word) {
  List<Letter> letters = word.split('') // split every letter
  .where((String letter) => dictionary.keys.contains(letter.toLowerCase()))
  .map<Letter>((String letter) => translateLetter(letter)).toList(); // create a list of letters
  return Word(word: word, letters: letters);
}

// List<MorseSymbol> translateText(String sentence) {
//   final wordSymbols = sentence.trim().split(' ')
//     .where((String word) => word.isNotEmpty)
//     .map((String word) => translateWord(word));
//   if(wordSymbols.isNotEmpty) {
//     return wordSymbols.reduce((list, symbols) {
//       return [...list, MorseSymbol.WORD_SPACE, ...symbols];
//     });
//   }
//   return [];
    
// }

Sentence translateText(String sentence) {
  final words = sentence.trim().split(' ')
    .where((String word) => word.isNotEmpty)
    .map((String word) => translateWord(word)).toList();
  return Sentence(sentence: sentence, words: words);
    
}


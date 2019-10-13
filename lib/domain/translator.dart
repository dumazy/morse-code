import 'package:morse_code/domain/dictionary.dart' as morse_dictionary;
import 'package:morse_code/domain/symbols.dart';

class MorseTranslator {
  final Map<String, List<MorseSymbol>> dictionary;

  MorseTranslator({this.dictionary = morse_dictionary.dictionary});

  Letter translateLetter(String letter) {
    // seems like this fold function could be better
    List<MorseSymbol> symbolList = dictionary[letter.toLowerCase()].fold(
        null,
        (list, item) =>
            list == null ? [item] : [...list, MorseSymbol.SYMBOL_SPACE, item]);

    return Letter(letter: letter, symbols: symbolList);
  }

  Word translateWord(String word) {
    List<Letter> letters = word
        .split('') // split every letter
        .where(
            (String letter) => dictionary.keys.contains(letter.toLowerCase()))
        .map<Letter>((String letter) => translateLetter(letter))
        .toList(); // create a list of letters
    return Word(word: word, letters: letters);
  }

  Sentence translateText(String sentence) {
    final words = sentence
        .trim()
        .split(' ')
        .where((String word) => word.isNotEmpty)
        .map((String word) => translateWord(word))
        .toList();
    return Sentence(sentence: sentence, words: words);
  }
}

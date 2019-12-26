import 'package:morse_code/domain/dictionary.dart' as morse_dictionary;
import 'package:morse_code/domain/symbols.dart';

class MorseTranslator {
  final Map<String, List<MorseSymbolType>> dictionary;

  MorseTranslator({this.dictionary = morse_dictionary.dictionary});

  MorseSymbol _createSymbol(MorseSymbolType type) {
    switch (type) {
      case MorseSymbolType.DOT:
        return Dot();
      case MorseSymbolType.DASH:
        return Dash();
      case MorseSymbolType.SYMBOL_SPACE:
        return SymbolSpace();
      case MorseSymbolType.LETTER_SPACE:
        return LetterSpace();
      case MorseSymbolType.WORD_SPACE:
        return WordSpace();
      default:
        return null;
    }
  }

  Letter translateLetter(String letter) {
    // seems like this fold function could be better
    List<MorseSymbol> symbolList = dictionary[letter.toLowerCase()].fold(
        null,
        (list, item) => list == null
            ? [_createSymbol(item)]
            : [...list, SymbolSpace(), _createSymbol(item)]);

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

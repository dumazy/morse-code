enum MorseSymbolType {
  DOT,
  DASH,
  SYMBOL_SPACE,
  LETTER_SPACE,
  WORD_SPACE,
} 



class Letter {
  final List<MorseSymbolType> symbols;
  final String letter;

  Letter({this.symbols, this.letter});
}

class Word {
  final String word;
  final List<Letter> letters;

  Word({this.word, this.letters});

  List<MorseSymbolType> get symbols => letters.fold([], (list, letter) {
    if(list.isEmpty) {
      list.addAll(letter.symbols);
    } else {
      list.add(MorseSymbolType.LETTER_SPACE);
      list.addAll(letter.symbols);
    }
    return list;
  });
}

class Sentence {
  final String sentence;
  final List<Word> words;

  Sentence({this.sentence, this.words});

  List<MorseSymbolType> get symbols => words.fold([], (list, word) {
    if(list.isEmpty) {
      list.addAll(word.symbols);
    } else {
      list.add(MorseSymbolType.WORD_SPACE);
      list.addAll(word.symbols);
    }
    return list;
  });
}


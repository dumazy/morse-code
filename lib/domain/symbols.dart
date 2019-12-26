enum MorseSymbolType {
  DOT,
  DASH,
  SYMBOL_SPACE,
  LETTER_SPACE,
  WORD_SPACE,
}

abstract class MorseSymbol {
  MorseSymbolType get type;
}

class Dot extends MorseSymbol {
  @override
  MorseSymbolType get type => MorseSymbolType.DOT;
}

class Dash extends MorseSymbol {
  @override
  MorseSymbolType get type => MorseSymbolType.DASH;
}

class SymbolSpace extends MorseSymbol {
  @override
  MorseSymbolType get type => MorseSymbolType.SYMBOL_SPACE;
}

class LetterSpace extends MorseSymbol {
  @override
  MorseSymbolType get type => MorseSymbolType.LETTER_SPACE;
}

class WordSpace extends MorseSymbol {
  @override
  MorseSymbolType get type => MorseSymbolType.WORD_SPACE;
}

class Letter {
  final List<MorseSymbol> symbols;
  final String letter;

  Letter({this.symbols, this.letter});
}

class Word {
  final String word;
  final List<Letter> letters;

  Word({this.word, this.letters});

  List<MorseSymbol> get symbols => letters.fold([], (list, letter) {
        if (list.isEmpty) {
          list.addAll(letter.symbols);
        } else {
          list.add(LetterSpace());
          list.addAll(letter.symbols);
        }
        return list;
      });
}

class Sentence {
  final String sentence;
  final List<Word> words;

  Sentence({this.sentence, this.words});

  List<MorseSymbol> get symbols => words.fold([], (list, word) {
        if (list.isEmpty) {
          list.addAll(word.symbols);
        } else {
          list.add(WordSpace());
          list.addAll(word.symbols);
        }
        return list;
      });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:morse_code/morse/symbols.dart';
import 'package:morse_code/morse/translator.dart';

main() {
  group('translator', () {
    group('translate letter', () {
      test("should translate letter a", () {

        final symbols = translateLetter('a');

        expect(symbols, [MorseSymbol.DOT, MorseSymbol.SYMBOL_SPACE, MorseSymbol.DASH]);
      });

      test("should translate letter A", () {
        final symbols = translateLetter('A');

        expect(symbols, [MorseSymbol.DOT, MorseSymbol.SYMBOL_SPACE, MorseSymbol.DASH]);
      });
    });

    group("translate word", () {
      test("should translate word", () {
        final symbols = translateWord("abc");
        
        expect(symbols, [
          MorseSymbol.DOT,
          MorseSymbol.SYMBOL_SPACE,
          MorseSymbol.DASH, // a
          MorseSymbol.LETTER_SPACE, 
          MorseSymbol.DASH,
          MorseSymbol.SYMBOL_SPACE,
          MorseSymbol.DOT,
          MorseSymbol.SYMBOL_SPACE,
          MorseSymbol.DOT,
          MorseSymbol.SYMBOL_SPACE,
          MorseSymbol.DOT, // b
          MorseSymbol.LETTER_SPACE,
          MorseSymbol.DASH,
          MorseSymbol.SYMBOL_SPACE,
          MorseSymbol.DOT,
          MorseSymbol.SYMBOL_SPACE,
          MorseSymbol.DASH,
          MorseSymbol.SYMBOL_SPACE,
          MorseSymbol.DOT, // c
        ]);
      });

      test("should be case insensitive", () {
        final symbols = translateWord("aBc");
        
        expect(symbols, [
          MorseSymbol.DOT,
          MorseSymbol.SYMBOL_SPACE,
          MorseSymbol.DASH, // a
          MorseSymbol.LETTER_SPACE, 
          MorseSymbol.DASH,
          MorseSymbol.SYMBOL_SPACE,
          MorseSymbol.DOT,
          MorseSymbol.SYMBOL_SPACE,
          MorseSymbol.DOT,
          MorseSymbol.SYMBOL_SPACE,
          MorseSymbol.DOT, // b
          MorseSymbol.LETTER_SPACE,
          MorseSymbol.DASH,
          MorseSymbol.SYMBOL_SPACE,
          MorseSymbol.DOT,
          MorseSymbol.SYMBOL_SPACE,
          MorseSymbol.DASH,
          MorseSymbol.SYMBOL_SPACE,
          MorseSymbol.DOT, // c
        ]);
      });

    });

    group("translate sentence", () {
      test("should translate sentence", () {
        final symbols = translateSentence("ab ac");

        expect(symbols, [
          MorseSymbol.DOT,
          MorseSymbol.SYMBOL_SPACE,
          MorseSymbol.DASH, // a
          MorseSymbol.LETTER_SPACE, 
          MorseSymbol.DASH,
          MorseSymbol.SYMBOL_SPACE,
          MorseSymbol.DOT,
          MorseSymbol.SYMBOL_SPACE,
          MorseSymbol.DOT,
          MorseSymbol.SYMBOL_SPACE,
          MorseSymbol.DOT, // b
          MorseSymbol.WORD_SPACE,
          MorseSymbol.DOT,
          MorseSymbol.SYMBOL_SPACE,
          MorseSymbol.DASH, // a
          MorseSymbol.LETTER_SPACE, 
          MorseSymbol.DASH,
          MorseSymbol.SYMBOL_SPACE,
          MorseSymbol.DOT,
          MorseSymbol.SYMBOL_SPACE,
          MorseSymbol.DASH,
          MorseSymbol.SYMBOL_SPACE,
          MorseSymbol.DOT, // c
        ]);
      });
    });
  });
}
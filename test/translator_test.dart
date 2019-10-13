import 'package:flutter_test/flutter_test.dart';
import 'package:morse_code/domain/symbols.dart';
import 'package:morse_code/domain/translator.dart';

const dot = MorseSymbol.DOT;
const dash = MorseSymbol.DASH;

main() {
  group('translator', () {
    final dictionary = {
      'a': [dot, dash],
      'b': [dash, dot, dot, dot],
      'c': [dash, dot, dash, dot],
      'e': [dot],
      'i': [dot, dot],
      't': [dash],
    };
    final translator = MorseTranslator(dictionary: dictionary);
    group('translate letter', () {
      test("should translate letter a", () {

        final letter = translator.translateLetter('a');

        expect(letter.symbols, [MorseSymbol.DOT, MorseSymbol.SYMBOL_SPACE, MorseSymbol.DASH]);
      });

      test("should translate symbol letter", () {
        final letter = translator.translateLetter('e');

        expect(letter.symbols, [MorseSymbol.DOT]);
      });

      test("should translate letter A", () {
        final letter = translator.translateLetter('A');

        expect(letter.symbols, [MorseSymbol.DOT, MorseSymbol.SYMBOL_SPACE, MorseSymbol.DASH]);
      });
    });

    group("translate word", () {
      test("should translate word", () {
        final word = translator.translateWord("abc");
        
        expect(word.symbols, [
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
        final word = translator.translateWord("aBc");
        
        expect(word.symbols, [
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

      test("should translate word with single symbol letter", () {
        final word = translator.translateWord("it");

        expect(word.symbols, [
          MorseSymbol.DOT,
          MorseSymbol.SYMBOL_SPACE,
          MorseSymbol.DOT,
          MorseSymbol.LETTER_SPACE,
          MorseSymbol.DASH,
        ]);
      });

      test("should trim spaces", () {
        final word = translator.translateWord("it ");

        expect(word.symbols, [
          MorseSymbol.DOT,
          MorseSymbol.SYMBOL_SPACE,
          MorseSymbol.DOT,
          MorseSymbol.LETTER_SPACE,
          MorseSymbol.DASH,
        ]);
      });

    });

    group("translate sentence", () {
      test("should translate sentence", () {
        final sentence = translator.translateText("ab ac");

        expect(sentence.symbols, [
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
      test("should trim double spaces", () {
        final sentence = translator.translateText("ab  ac");

        expect(sentence.symbols, [
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
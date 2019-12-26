import 'package:flutter_test/flutter_test.dart';
import 'package:morse_code/domain/symbols.dart';
import 'package:morse_code/domain/translator.dart';

const dot = MorseSymbolType.DOT;
const dash = MorseSymbolType.DASH;

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

        expect(letter.symbols.map((symbol) => symbol.type), [
          MorseSymbolType.DOT,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DASH
        ]);
      });

      test("should translate symbol letter", () {
        final letter = translator.translateLetter('e');

        expect(
            letter.symbols.map((symbol) => symbol.type), [MorseSymbolType.DOT]);
      });

      test("should translate letter A", () {
        final letter = translator.translateLetter('A');

        expect(letter.symbols.map((symbol) => symbol.type), [
          MorseSymbolType.DOT,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DASH
        ]);
      });
    });

    group("translate word", () {
      test("should translate word", () {
        final word = translator.translateWord("abc");

        expect(word.symbols.map((symbol) => symbol.type), [
          MorseSymbolType.DOT,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DASH, // a
          MorseSymbolType.LETTER_SPACE,
          MorseSymbolType.DASH,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DOT,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DOT,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DOT, // b
          MorseSymbolType.LETTER_SPACE,
          MorseSymbolType.DASH,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DOT,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DASH,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DOT, // c
        ]);
      });

      test("should be case insensitive", () {
        final word = translator.translateWord("aBc");

        expect(word.symbols.map((symbol) => symbol.type), [
          MorseSymbolType.DOT,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DASH, // a
          MorseSymbolType.LETTER_SPACE,
          MorseSymbolType.DASH,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DOT,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DOT,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DOT, // b
          MorseSymbolType.LETTER_SPACE,
          MorseSymbolType.DASH,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DOT,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DASH,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DOT, // c
        ]);
      });

      test("should translate word with single symbol letter", () {
        final word = translator.translateWord("it");

        expect(word.symbols.map((symbol) => symbol.type), [
          MorseSymbolType.DOT,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DOT,
          MorseSymbolType.LETTER_SPACE,
          MorseSymbolType.DASH,
        ]);
      });

      test("should trim spaces", () {
        final word = translator.translateWord("it ");

        expect(word.symbols.map((symbol) => symbol.type), [
          MorseSymbolType.DOT,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DOT,
          MorseSymbolType.LETTER_SPACE,
          MorseSymbolType.DASH,
        ]);
      });
    });

    group("translate sentence", () {
      test("should translate sentence", () {
        final sentence = translator.translateText("ab ac");

        expect(sentence.symbols.map((symbol) => symbol.type), [
          MorseSymbolType.DOT,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DASH, // a
          MorseSymbolType.LETTER_SPACE,
          MorseSymbolType.DASH,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DOT,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DOT,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DOT, // b
          MorseSymbolType.WORD_SPACE,
          MorseSymbolType.DOT,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DASH, // a
          MorseSymbolType.LETTER_SPACE,
          MorseSymbolType.DASH,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DOT,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DASH,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DOT, // c
        ]);
      });
      test("should trim double spaces", () {
        final sentence = translator.translateText("ab  ac");

        expect(sentence.symbols.map((symbol) => symbol.type), [
          MorseSymbolType.DOT,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DASH, // a
          MorseSymbolType.LETTER_SPACE,
          MorseSymbolType.DASH,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DOT,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DOT,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DOT, // b
          MorseSymbolType.WORD_SPACE,
          MorseSymbolType.DOT,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DASH, // a
          MorseSymbolType.LETTER_SPACE,
          MorseSymbolType.DASH,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DOT,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DASH,
          MorseSymbolType.SYMBOL_SPACE,
          MorseSymbolType.DOT, // c
        ]);
      });
    });
  });
}

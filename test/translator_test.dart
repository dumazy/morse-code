import 'package:flutter_test/flutter_test.dart';
import 'package:morse_code/morse/symbols.dart';
import 'package:morse_code/morse/translator.dart';

main() {
  group('translator', () {
    group('translate letter', () {
      test("should translate letter a", () {

        final symbols = translateLetter('a');

        expect(symbols.length, 2);
        expect(symbols[0], MorseSymbol.DOT);
        expect(symbols[1], MorseSymbol.DASH);
      });

      test("should translate letter A", () {
        final symbols = translateLetter('A');

        expect(symbols.length, 2);
        expect(symbols[0], MorseSymbol.DOT);
        expect(symbols[1], MorseSymbol.DASH);
      });
    });

    group("translate word", () {
      test("should translate word", () {
        final symbols = translateWord("abc");
        
        expect(symbols, [
          MorseSymbol.DOT,
          MorseSymbol.DASH, // a
          MorseSymbol.SYMBOL_SPACE, 
          MorseSymbol.DASH,
          MorseSymbol.DOT,
          MorseSymbol.DOT,
          MorseSymbol.DOT, // b
          MorseSymbol.SYMBOL_SPACE,
          MorseSymbol.DASH,
          MorseSymbol.DOT,
          MorseSymbol.DASH,
          MorseSymbol.DOT, // c
        ]);
      });

      test("should be case insensitive", () {
        final symbols = translateWord("aBc");
        
        expect(symbols, [
          MorseSymbol.DOT,
          MorseSymbol.DASH, // a
          MorseSymbol.SYMBOL_SPACE, 
          MorseSymbol.DASH,
          MorseSymbol.DOT,
          MorseSymbol.DOT,
          MorseSymbol.DOT, // b
          MorseSymbol.SYMBOL_SPACE,
          MorseSymbol.DASH,
          MorseSymbol.DOT,
          MorseSymbol.DASH,
          MorseSymbol.DOT, // c
        ]);
      });

    });
  });
}
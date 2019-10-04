import 'package:morse_code/domain/symbols.dart';

abstract class Broadcaster {
  final List<MorseSymbol> symbols;
  final int wordSpeed;

  Broadcaster(this.symbols, this.wordSpeed);

  void play() {
    int dotSpeed = (1200 / wordSpeed).ceil();
    Future.forEach(symbols, (MorseSymbol symbol) async {
      switch(symbol) {
        case MorseSymbol.DOT:
          await broadcastSignal(dotSpeed);
          break;
        case MorseSymbol.DASH:
          await broadcastSignal(dotSpeed * 3);
          break;
        case MorseSymbol.SYMBOL_SPACE:
          await pause(dotSpeed);
          break;
        case MorseSymbol.LETTER_SPACE:
          await pause(dotSpeed * 3);
          break;
        case MorseSymbol.WORD_SPACE:
          await pause(dotSpeed * 7);
          break;
      }
    });
  }
  
  Future broadcastSignal(int milliseconds);

  Future pause(int milliseconds) async {
    print("pause for $milliseconds ms");
    await Future.delayed(Duration(milliseconds: milliseconds), () {});
  }
}
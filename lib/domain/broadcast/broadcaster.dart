import 'package:morse_code/domain/broadcast/signal.dart';
import 'package:morse_code/domain/symbols.dart';

class Broadcaster {
  final List<MorseSymbol> symbols;
  final int wordSpeed;
  final Signal signal;

  Broadcaster({this.symbols, this.wordSpeed, this.signal});

  void play() {
    int dotSpeed = (1200 / wordSpeed).ceil();
    Future.forEach(symbols, (MorseSymbol symbol) async {
      switch(symbol) {
        case MorseSymbol.DOT:
          await signal.broadcast(dotSpeed);
          break;
        case MorseSymbol.DASH:
          await signal.broadcast(dotSpeed * 3);
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

  Future pause(int milliseconds) async {
    print("pause for $milliseconds ms");
    await Future.delayed(Duration(milliseconds: milliseconds), () {});
  }
}
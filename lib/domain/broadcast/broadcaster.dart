import 'package:morse_code/domain/broadcast/signal.dart';
import 'package:morse_code/domain/symbols.dart';

class Broadcaster {
  final List<MorseSymbol> symbols;
  final int wordSpeed;
  final Signal signal;
  bool isPlaying;

  Broadcaster({this.symbols, this.wordSpeed, this.signal});

  Future play() async {
    int dotDuration = (1200 / wordSpeed).ceil();
    await Future.forEach(symbols, (MorseSymbol symbol) async {
      switch(symbol) {
        case MorseSymbol.DOT:
          await signal.broadcast(dotDuration);
          break;
        case MorseSymbol.DASH:
          await signal.broadcast(dotDuration * 3);
          break;
        case MorseSymbol.SYMBOL_SPACE:
          await pause(dotDuration);
          break;
        case MorseSymbol.LETTER_SPACE:
          await pause(dotDuration * 3);
          break;
        case MorseSymbol.WORD_SPACE:
          await pause(dotDuration * 7);
          break;
      }
    });
  }

  Future pause(int milliseconds) async {
    print("pause for $milliseconds ms");
    await Future.delayed(Duration(milliseconds: milliseconds), () {});
  }
}

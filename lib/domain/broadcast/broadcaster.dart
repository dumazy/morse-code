import 'dart:async';

import 'package:morse_code/domain/broadcast/signal.dart';
import 'package:morse_code/domain/symbols.dart';

class Broadcaster {
  final List<MorseSymbol> symbols;
  final Signal signal;

  BroadcastState _broadcastState = BroadcastState.IDLE;
  StreamController<BroadcastState> _broadcastStateController =
      StreamController.broadcast();
  Stream<BroadcastState> get broadcastStateStream =>
      _broadcastStateController.stream;
  BroadcastState get currentBroadcastState => _broadcastState;

  double _wordSpeed = 5;
  int _dotDuration = (1200 / 5).ceil();

  StreamController<double> _wordSpeedController = StreamController.broadcast();
  Stream<double> get wordSpeedStream => _wordSpeedController.stream;
  double get currentWordSpeed => _wordSpeed;

  StreamController<MorseSymbol> _broadcastedSymbolController =
      StreamController.broadcast();
  Stream<MorseSymbol> get broadcastedSymbolStream =>
      _broadcastedSymbolController.stream;

  Broadcaster({this.symbols, this.signal});

  Future play() async {
    _updateBroadcastState(BroadcastState.PLAYING);
    await Future.forEach(symbols, (MorseSymbol symbol) async {
      _broadcastedSymbolController.add(symbol);
      switch (symbol.type) {
        case MorseSymbolType.DOT:
          await signal.broadcast(_dotDuration);
          break;
        case MorseSymbolType.DASH:
          await signal.broadcast(_dotDuration * 3);
          break;
        case MorseSymbolType.SYMBOL_SPACE:
          await signal.pause(_dotDuration);
          break;
        case MorseSymbolType.LETTER_SPACE:
          await signal.pause(_dotDuration * 3);
          break;
        case MorseSymbolType.WORD_SPACE:
          await signal.pause(_dotDuration * 7);
          break;
      }
    });
    _broadcastedSymbolController.add(null);
    _updateBroadcastState(BroadcastState.FINISHED);
  }

  void _updateBroadcastState(BroadcastState state) {
    _broadcastState = state;
    _broadcastStateController.add(state);
  }

  void setWordSpeed(double wordSpeed) {
    this._wordSpeed = wordSpeed;
    _wordSpeedController.add(wordSpeed);
    _dotDuration = (1200 / _wordSpeed).ceil();
  }

  stop() {
    print("Received stop command");
  }
}

enum BroadcastState { IDLE, PLAYING, PAUSED, FINISHED }

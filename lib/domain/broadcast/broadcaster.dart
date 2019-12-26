import 'dart:async';

import 'package:morse_code/domain/broadcast/signal.dart';
import 'package:morse_code/domain/symbols.dart';

class Broadcaster {
  final List<MorseSymbolType> symbols;
  final Signal signal;

  BroadcastState _broadcastState = BroadcastState.IDLE;
  StreamController<BroadcastState> _broadcastStateController =
      StreamController.broadcast();
  Stream<BroadcastState> get broadcastStateStream =>
      _broadcastStateController.stream;
  BroadcastState get currentBroadcastState => _broadcastState;

  double _wordSpeed = 5;
  StreamController<double> _wordSpeedController = StreamController.broadcast();
  Stream<double> get wordSpeedStream => _wordSpeedController.stream;
  double get currentWordSpeed => _wordSpeed;

  Broadcaster({this.symbols, this.signal});

  Future play() async {
    _updateBroadcastState(BroadcastState.PLAYING);
    int dotDuration = (1200 / _wordSpeed).ceil();
    await Future.forEach(symbols, (MorseSymbolType symbol) async {
      switch (symbol) {
        case MorseSymbolType.DOT:
          await signal.broadcast(dotDuration);
          break;
        case MorseSymbolType.DASH:
          await signal.broadcast(dotDuration * 3);
          break;
        case MorseSymbolType.SYMBOL_SPACE:
          await signal.pause(dotDuration);
          break;
        case MorseSymbolType.LETTER_SPACE:
          await signal.pause(dotDuration * 3);
          break;
        case MorseSymbolType.WORD_SPACE:
          await signal.pause(dotDuration * 7);
          break;
      }
    });
    _updateBroadcastState(BroadcastState.FINISHED);
  }

  void _updateBroadcastState(BroadcastState state) {
    _broadcastState = state;
    _broadcastStateController.add(state);
  }

  void setWordSpeed(double wordSpeed) {
    this._wordSpeed = wordSpeed;
    _wordSpeedController.add(wordSpeed);
  }

  stop() {
    print("Received stop command");
  }
}

enum BroadcastState { IDLE, PLAYING, PAUSED, FINISHED }

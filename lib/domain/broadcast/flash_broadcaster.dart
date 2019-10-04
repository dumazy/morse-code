import 'package:morse_code/domain/broadcast/broadcaster.dart';
import 'package:morse_code/domain/symbols.dart';
import 'package:torch/torch.dart';

class FlashBroadcaster extends Broadcaster {

  FlashBroadcaster(List<MorseSymbol> symbols, int wordSpeed) : super(symbols, wordSpeed);

  @override
  Future broadcastSignal(int milliseconds) async {
    await Torch.flash(Duration(milliseconds: milliseconds));
  }


}
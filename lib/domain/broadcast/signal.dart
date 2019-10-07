import 'package:torch/torch.dart';

abstract class Signal {
  Future broadcast(int milliseconds);
}

class FlashSignal implements Signal {
  @override
  broadcast(int milliseconds) async {
    await Torch.flash(Duration(milliseconds: milliseconds));
  }

}

class LogSignal implements Signal {
  @override
  broadcast(int milliseconds) async {
    print("Broadcast signal");
    await Future.delayed(Duration(milliseconds: milliseconds), () {});
  }

}
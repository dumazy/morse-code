import 'package:torch/torch.dart';

abstract class Signal {
  Future broadcast(int milliseconds);
  Future pause(int milliseconds) async =>
      await Future.delayed(Duration(milliseconds: milliseconds), () {});
}

class FlashSignal extends Signal {
  @override
  broadcast(int milliseconds) async {
    await Torch.flash(Duration(milliseconds: milliseconds));
  }
}

class LogSignal extends Signal {
  @override
  broadcast(int milliseconds) async {
    print("Broadcast signal for $milliseconds");
    await Future.delayed(Duration(milliseconds: milliseconds), () {});
  }

  @override
  pause(int milliseconds) async {
    print("Pause signal for $milliseconds");
    super.pause(milliseconds);
  }
}

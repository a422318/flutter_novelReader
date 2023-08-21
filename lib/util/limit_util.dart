import 'dart:async';

class LimitUtil {
  static const deFaultDurationTime = 300;
  static Timer? timer;

// 防抖函数
  static debounce(Function doSomething, {durationTime = deFaultDurationTime}) {
    timer?.cancel();
    timer = Timer(Duration(milliseconds: durationTime), () {
      doSomething;
    });
  }

// 节流函数
  static const String deFaultThrottleId = 'DeFaultThrottleId';
  static Map<String, int> startTimeMap = {deFaultThrottleId: 0};
  static throttle(Function doSomething, {String throttleId = deFaultThrottleId, durationTime = deFaultDurationTime, Function? continueClick}) {
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    if (currentTime - (startTimeMap[throttleId] ?? 0) > durationTime) {
      doSomething.call();
      startTimeMap[throttleId] = DateTime.now().millisecondsSinceEpoch;
    } else {
      continueClick?.call();
    }
  }
}

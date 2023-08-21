import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';

class Toast {

  /// 吐司
  static void toast({String toast = "加载中...", Duration? duration}) {
    EasyLoading.showToast(toast, duration: duration);
  }

  /// 长吐司
  static void toastL({String toast = "加载中..."}) {
    EasyLoading.show(status: toast, maskType: EasyLoadingMaskType.clear);
  }

  /// 长吐司
  static void toastLWithDismiss(Future Function() executor, {String toast = "加载中..."}) async{
    EasyLoading.show(status: toast, maskType: EasyLoadingMaskType.clear);
    executor().then((value) => cancel()).catchError((_) => cancel());
  }

  /// 取消吐司
  static void cancel() {
    EasyLoading.dismiss();
  }
}
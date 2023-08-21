import 'package:flutter/material.dart';

/// 字体工具
class FontUtil {
  /// 字符转全角
  static String alphanumericToFullLength(str) {
    if (str == null) {
      return "";
    }
    var temp = str.codeUnits;
    //a-zA-Z0-9!,.@#$%^&*()@?;\u0022\u0027}{
    final regex = RegExp(r"^[\u0021-\u007E]+$");
    final string = temp.map<String>((rune) {
      final char = String.fromCharCode(rune);
      if (char == " ") {
        return "\u3000";
      }
      return regex.hasMatch(char) ? String.fromCharCode(rune + 65248) : char;
    });
    return string.join();
  }

  /// 字符转半角
  static String alphanumericToHalfLength(String str) {
    var runes = str.codeUnits;
    final regex = RegExp(r'^[\uFF01-\uFF5E]+$');
    final string = runes.map<String>((rune) {
      final char = String.fromCharCode(rune);
      return regex.hasMatch(char) ? String.fromCharCode(rune - 65248) : char;
    });
    return string.join();
  }

  static String formatContent(String content) {
    if (content.isEmpty) {
      return content;
    }
    content = content
        .replaceAll(" ", "")
        .replaceAll("\u3000", "");
    content = "\u3000\u3000" + content;
    List<String> list = [];
    List<int> codes = content.codeUnits;
    for (int i = 0; i < codes.length; i++) {
      final char = String.fromCharCode(codes[i]);
      if (char != "\n") {
        list.add(char);
      } else {
        if (list.isNotEmpty) {
          if (list[list.length - 1].contains("\n")) {
            continue;
          }
        }
        list.add("\n\u3000\u3000");
      }
    }
    return list.join();
  }

  static String? getFontFamily() {
    return null;
  }

  static String toDBC(String input) {
    var c = input.codeUnits;
    var s = '';
    for (var i = 0; i < c.length; i++) {
      if (c[i] == 32) {
        // 半角空格
        s = s + String.fromCharCode(12288);
      } else if (c[i] < 127) {
        // 半角英文字符
        //如果前后为换行符，则不转换
        if (c[i] == 10) {
          s = s + String.fromCharCode(c[i]);
        } else {
          s = s + String.fromCharCode(c[i] + 65248);
        }
      } else {
        // 非半角字符
        s = s + String.fromCharCode(c[i]);
      }
    }
    return s;
  }

  static FontWeight intToFontWeight(int weight) {
    switch(weight) {
      case 0:
        return FontWeight.w100;
      case 1:
        return FontWeight.w200;
      case 2:
        return FontWeight.w300;
      case 3:
        return FontWeight.w400;
      case 4:
        return FontWeight.w500;
      case 5:
        return FontWeight.w600;
      case 6:
        return FontWeight.w700;
      case 7:
        return FontWeight.w800;
      case 8:
        return FontWeight.w900;
      default:
        return FontWeight.w400;
    }
  }
}

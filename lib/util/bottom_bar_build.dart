import 'package:book_app/theme/color.dart';
import 'package:book_app/util/bar_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BottomBarBuild extends StatelessWidget {
  final String title;
  Color? backgroundColor;
  Color? titleColor;
  final List<BottomBarBuildItem> items;
  BottomBarBuild(this.title, this.items, {Key? key, this.backgroundColor, this.titleColor}) : super(key: key){
    backgroundColor = backgroundColor ?? (Get.isPlatformDarkMode ? Colors.black : Colors.white);
    titleColor = titleColor ?? (Get.isPlatformDarkMode ? hexToColor("#a9a9a9") : Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    transparentBar();
    return Card(
      color: backgroundColor,
      child: SizedBox(
        height: (items.length + 1) * 50 + items.length * 1 + MediaQuery.of(context).padding.bottom,
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          cacheExtent: (items.length + 1) * 50 + items.length * 1,
          itemCount: items.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                height: 50,
                alignment: Alignment.center,
                child: Text(title, style: TextStyle(height: 1, fontSize: 14, color: titleColor),),
              );
            }
            return InkWell(
              child: Container(
                height: 50,
                alignment: Alignment.center,
                child: items[index - 1].useWidget ? items[index - 1].titleWidget : Text(items[index - 1].title, style: TextStyle(height: 1, fontSize: 14, color: titleColor),),
              ),
              onTap: () {
                items[index - 1].function();
              },
              onLongPress: () {
                if (items[index - 1].longFunction != null) {
                  items[index - 1].longFunction!();
                }
              },
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 1,
              color: Colors.grey[200],
            );
          },
        ),
      ),
    );
  }

}
class BottomBarBuildItem {
  final String title;
  final Function function;
  final Function? longFunction;
  final Widget? titleWidget;
  bool _useWidget = false;
  BottomBarBuildItem(this.title, this.function, {this.titleWidget, this.longFunction}) {
    if (titleWidget != null) {
      _useWidget = true;
    }
  }

  bool get useWidget => _useWidget;
}
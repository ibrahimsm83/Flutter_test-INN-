import 'package:flutter/material.dart';
import 'package:innovative/utils/assets_manager.dart';
import 'package:innovative/utils/color_manager.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CustomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  String? title;
  Widget? leading;
  bool isLeading;
  final List<Widget>? actions;
  CustomeAppBar(
      {Key? key, this.title, this.actions, this.leading, this.isLeading = true})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize; //default is 56.0
  @override
  State<CustomeAppBar> createState() => _CustomeAppBarState();
}

class _CustomeAppBarState extends State<CustomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          widget.title!,
          style: TextStyle(color: ColorManager.black, fontSize: 15.sp),
        ),
        leading: widget.isLeading
            ? InkWell(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      ImageAssets.backicon,
                      color: ColorManager.black,
                      height: 15,
                      width: 15,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              )
            : widget.leading,
        actions: widget.actions);
  }
}

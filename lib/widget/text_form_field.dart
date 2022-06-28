
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:innovative/utils/color_manager.dart';
import 'package:innovative/utils/values_manager.dart';

// ignore: must_be_immutable
class CustomeTextFormField extends StatefulWidget {
  String? hintText;
  bool obscureText;
  double horizontalMergin;
  int maxLines;
  TextInputType? keyboardType;
  Widget? suffixIcon;
  Function(String)? onChanged;
  String? Function(String?)? validator;
  TextEditingController? controller;
  CustomeTextFormField({
    Key? key,
    this.hintText,
    this.validator,
    this.keyboardType,
    this.maxLines = 1,
    this.suffixIcon,
    this.horizontalMergin = 0.06,
    this.obscureText = false,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomeTextFormField> createState() => _CustomeTextFormFieldState();
}

class _CustomeTextFormFieldState extends State<CustomeTextFormField> {
  late bool _pwShow;
  @override
  void initState() {
    _pwShow = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context) * widget.horizontalMergin),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        controller: widget.controller,
        obscureText: _pwShow,
        maxLines: widget.maxLines,
        onChanged:widget.onChanged,
        decoration: InputDecoration(
          filled: true,
          isCollapsed: true,
          fillColor: ColorManager.white,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: ColorManager.grey),
          contentPadding: const EdgeInsets.fromLTRB(14, 14.0, 14.0, 14.0),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: ColorManager.black, width: 1.5)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  color: ColorManager.black.withOpacity(0.2), width: 1.5)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: ColorManager.primary, width: 1.5)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: ColorManager.primary, width: 1.5)),
          suffixIcon: widget.suffixIcon ??
              Visibility(
                visible: widget.obscureText,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _pwShow = !_pwShow;
                    });
                  },
                  child: _pwShow
                      ? Icon(
                          Icons.visibility_off,
                          color: ColorManager.red,
                        )
                      : Icon(
                          Icons.visibility,
                          color: ColorManager.darkGrey,
                        ),
                ),
              ),
        ),
      ),
    );
  }
}

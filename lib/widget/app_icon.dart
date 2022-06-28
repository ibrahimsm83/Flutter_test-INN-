import 'package:flutter/material.dart';
import 'package:innovative/utils/assets_manager.dart';
import 'package:innovative/utils/values_manager.dart';

class AppLogoIcon extends StatelessWidget {
  const AppLogoIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Image.asset(
        ImageAssets.appIconImage,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

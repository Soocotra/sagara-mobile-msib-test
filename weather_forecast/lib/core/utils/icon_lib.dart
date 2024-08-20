import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../enum/icons_enum.dart';

// ignore: must_be_immutable
class IconsLib extends StatelessWidget {
  IconsLib(
      {super.key, required this.icon, this.width, this.height, this.color});

  final AppIcons icon;
  double? width;
  double? height;
  Color? color;
  final _dir = 'assets/icons/';

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      _dir + icon.label,
      width: width,
      height: height,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}

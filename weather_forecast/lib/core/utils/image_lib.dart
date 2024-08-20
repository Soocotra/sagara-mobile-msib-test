// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../enum/image_enum.dart';

class ImagesLib extends StatelessWidget {
  const ImagesLib(
      {super.key,
      required this.image,
      this.width,
      this.height,
      this.opacity,
      this.fit});

  final AppImages image;
  final double? width;
  final double? height;
  final Animation<double>? opacity;
  final BoxFit? fit;
  final _dir = 'assets/images/';

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _dir + image.label,
      width: width,
      height: height,
      opacity: opacity,
      fit: fit,
    );
  }
}

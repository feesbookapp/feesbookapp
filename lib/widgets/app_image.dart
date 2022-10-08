import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgAssetImage extends StatelessWidget {
  const SvgAssetImage({
    Key? key,
    required this.imagePath,
    this.color,
    this.height,
    this.width,
  }) : super(key: key);

  final String imagePath;
  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imagePath,
      color: color,
      width: width,
      height: height,
    );
  }
}

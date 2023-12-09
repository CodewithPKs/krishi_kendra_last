import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class KrishiRoundedImage extends StatelessWidget {
  const KrishiRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage= false,
    this.onPressed,
    this.borderRadius = KrishiSizes.md,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(border: border,borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(
            borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
            child: Image(fit: fit, image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider )),
      ),
    );
  }
}

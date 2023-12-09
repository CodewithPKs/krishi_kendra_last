
import 'package:flutter/cupertino.dart';
import 'package:flutter_krishi_app/utils/constants/colors.dart';
import 'package:flutter_krishi_app/utils/constants/sizes.dart';

class KrishiRoundedContainer extends StatelessWidget {
  const KrishiRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius=   KrishiSizes.cardRadiusLg,
    this.child,
    this.showBorder  =false,
    this.borderColor=KrishiColors.borderPrimary,
    this.margin,
    this.padding
  });

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: KrishiColors.lightGrey,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: borderColor)
      ),
      child: child,
    );
  }
}

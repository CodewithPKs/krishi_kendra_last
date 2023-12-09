import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class KrishiProductTitleText extends StatelessWidget {
  const KrishiProductTitleText({
    super.key,
    required this.title,
    this.smallSize = false,
    this.maxLines= 2,
    this.textAlign,
  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize ? Theme.of(context).textTheme.labelLarge : Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}

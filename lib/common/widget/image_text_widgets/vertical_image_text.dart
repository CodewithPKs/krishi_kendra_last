import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class KrishiVerticalImageText extends StatelessWidget {
  const KrishiVerticalImageText({
    super.key, required this.image, required this.title, this.textColor=KrishiColors.white, this.onTap,
  });

  final String image,title;
  final Color textColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
            right: KrishiSizes.spaceBtwItems),
        child: Column(
          children: [
            /// Circular Icon
            Container(
              width: 70,
              height: 70,
              padding: const EdgeInsets.all(
                  KrishiSizes.sm),
              decoration: BoxDecoration(
                color: KrishiColors.white,
                borderRadius:
                BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Texts
            const SizedBox(
              height: KrishiSizes.spaceBtwItems / 2,
            ),
            SizedBox(
                width: 55,
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(
                      color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_krishi_app/common/style/shadows.dart';
import 'package:flutter_krishi_app/common/widget/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_krishi_app/common/widget/images/krishi_rounded_images.dart';
import 'package:flutter_krishi_app/common/widget/texts/product_title_text.dart';
import 'package:flutter_krishi_app/utils/constants/image_strings.dart';
import 'package:flutter_krishi_app/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../icons/krishi_circular_icon.dart';
import '../../texts/product_price_text.dart';

class KrishiProductCardVertical extends StatelessWidget {
  const KrishiProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [KrishiShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(KrishiSizes.productImageRadius),
          color: KrishiColors.white,
        ),

        child: Column(
          children: [
            /// Thumbnail, Wishlist Button, Discount Tag
            KrishiRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(KrishiSizes.sm),
              child: Stack(
                children: [
                  // -- Thumbnail Image
                  const KrishiRoundedImage(imageUrl: KrishiImages.productImage1, applyImageRadius: true,),

                  // -- Sales Tag
                  Positioned(
                    top: 12,
                    child: KrishiRoundedContainer(
                      radius: KrishiSizes.sm,
                      padding: const EdgeInsets.symmetric(horizontal: KrishiSizes.sm,vertical: KrishiSizes.xs),
                      child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: KrishiColors.black),),
                    ),
                  ),

                  /// -- Favourite Icon Button
                  const Positioned
                    (
                    top: 0,
                      right: 0,
                      child: KrishiCircularIcon(icon: Iconsax.heart5, color: Colors.red,),
                  ),
                ],
              ),
            ),
            const SizedBox(height: KrishiSizes.spaceBtwItems/2,),
            /// -- Details
            Padding(
              padding: const EdgeInsets.only(left: KrishiSizes.sm),
              child: Column(
                children: [
                  const KrishiProductTitleText(title: 'Katyayani Products', smallSize: false,),
                  const SizedBox(height: KrishiSizes.spaceBtwItems/2,),
                  Row(
                    children: [
                      Text('Katyayani', overflow: TextOverflow.ellipsis, maxLines: 1, style: Theme.of(context).textTheme.labelMedium,),
                      const SizedBox(width: KrishiSizes.xs,),
                      const Icon(Iconsax.verify5, color: KrishiColors.primary, size: KrishiSizes.iconXs,),
                    ],
                  ),
                ],
              ),
            ),
            // Todo : Add Spacer() here to keep the height of each Box same in case 1 and 2 lines of Heading
            Spacer(),
            /// -- Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Prices
                const KrishiProductPriceText(price: '128', ),
                // Add to Cart Button
                Container(
                  decoration: const BoxDecoration(
                    color: KrishiColors.dark,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(KrishiSizes.cardRadiusMd),
                        bottomRight: Radius.circular(KrishiSizes.productImageRadius)
                    ),
                  ),
                  child: const SizedBox(
                    width: KrishiSizes.iconLg*1.2,
                    height: KrishiSizes.iconLg*1.2,
                    child: Icon(Iconsax.add, color: KrishiColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}





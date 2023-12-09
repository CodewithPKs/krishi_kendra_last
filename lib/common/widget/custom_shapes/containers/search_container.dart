import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';

class KrishiSearchContainer extends StatelessWidget {
  const KrishiSearchContainer({
    super.key, required this.text, this.icon=Iconsax.search_normal, this.showBorder=true,
  });

  final String text;
  final IconData? icon;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: KrishiSizes.defaultSpace),
      child: Container(
        width: KrishiDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(KrishiSizes.md),
        decoration: BoxDecoration(
          color: KrishiColors.white,
          borderRadius: BorderRadius.circular(KrishiSizes.cardRadiusLg),
          border: showBorder ? Border.all(color: KrishiColors.grey):null,
        ),
        child: Row(
          children: [
            Icon(icon, color: KrishiColors.darkerGrey,),
            const SizedBox(width: KrishiSizes.spaceBtwItems,),
            Text(text, style: Theme.of(context).textTheme.bodySmall,)
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../extensions/extensions.dart';

class SvgButton extends StatelessWidget {
  const SvgButton(
    this.assetName, {
    super.key,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 8),
    this.color,
    this.size,
  });

  final Function()? onTap;
  final String assetName;
  final EdgeInsets padding;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return onTap != null
        ? IconButton(
            onPressed: () => onTap?.call(),
            icon: SvgPicture.asset(
              assetName,
              height: size ?? 24,
              width: size ?? 24,
              colorFilter: ColorFilter.mode(
                color ?? context.theme.colorScheme.primary,
                BlendMode.srcIn,
              ),
            ),
            iconSize: size ?? 24,
          )
        : Padding(
            padding: padding,
            child: SvgPicture.asset(
              assetName,
              colorFilter: color == null
                  ? null
                  : ColorFilter.mode(
                      color ?? context.theme.colorScheme.primary,
                      BlendMode.srcIn,
                    ),
              height: size ?? 24,
              width: size ?? 24,
            ),
          );
  }
}

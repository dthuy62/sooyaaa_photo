import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/extensions/context.dart';
import '../../../common/widgets/svg_button.dart';

class AlbumCreateInfoType extends StatelessWidget {
  const AlbumCreateInfoType({
    super.key,
    required this.iconName,
    required this.iconSize,
    required this.name,
    required this.desc,
    this.onTap,
  });

  final String iconName;
  final double iconSize;
  final String name;
  final String desc;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgButton(
                iconName,
                size: iconSize,
                padding: const EdgeInsets.only(left: 0, right: 8),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: context.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    desc,
                    style: context.textTheme.bodySmall,
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

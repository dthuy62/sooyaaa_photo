import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../common/extensions/context.dart';
import '../../../common/widgets/svg_button.dart';
import '../../new_album/new_album.dart';

class AlbumCreateInfoType extends StatelessWidget {
  const AlbumCreateInfoType({
    super.key,
    required this.iconName,
    required this.iconSize,
    required this.name,
    required this.desc,
  });

  final String iconName;
  final double iconSize;
  final String name;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CupertinoScaffold.showCupertinoModalBottomSheet(
            context: context,
            builder: (_) {
              return NewAlbumScreen();
            });
      },
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

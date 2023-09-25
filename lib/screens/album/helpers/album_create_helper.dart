import 'package:flutter/material.dart';

import '../../../common/assets/app_icons.dart';
import '../../../l10n/l10n.dart';

class AlbumCreateType {
  final String name;
  final String desc;
  final String icon;
  final double iconSize;

  AlbumCreateType({
    required this.name,
    required this.icon,
    required this.desc,
    this.iconSize = 24,
  });
}

class AlbumCreateHelper {
  static List<AlbumCreateType> types(BuildContext context) => [
        AlbumCreateType(
            name: context.l10n.text_album,
            desc: context.l10n.text_desc_new_album,
            icon: AppIcons.albumAdd),
        AlbumCreateType(
          name: context.l10n.text_folder,
          desc: context.l10n.text_desc_new_folder,
          icon: AppIcons.folderAdd,
          iconSize: 18,
        ),
      ];
}

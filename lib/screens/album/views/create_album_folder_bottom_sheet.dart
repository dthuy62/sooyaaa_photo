import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/extensions/extensions.dart';
import '../../../l10n/l10n.dart';
import '../helpers/album_create_helper.dart';
import 'album_create_info_type.dart';

class CreateAlbumFolderBottomSheet extends StatelessWidget {
  const CreateAlbumFolderBottomSheet({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            Text(
              context.l10n.text_create,
              style: context.textTheme.titleSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Column(
              children: AlbumCreateHelper.types(context)
                  .map((type) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: AlbumCreateInfoType(
                          iconSize: type.iconSize,
                          onTap: onTap,
                          name: type.name,
                          desc: type.desc,
                          iconName: type.icon,
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

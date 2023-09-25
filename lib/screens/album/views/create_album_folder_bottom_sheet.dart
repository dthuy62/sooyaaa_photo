import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../common/extensions/extensions.dart';
import '../../../l10n/l10n.dart';
import '../helpers/album_create_helper.dart';
import 'album_create_info_type.dart';

class CreateAlbumFolderBottomSheet extends StatelessWidget {
  const CreateAlbumFolderBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoScaffold(
        body: Builder(
          builder: (context) => CupertinoPageScaffold(
            child: FractionallySizedBox(
                heightFactor: 1,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: AlbumCreateInfoType(
                                    iconSize: type.iconSize,
                                    name: type.name,
                                    desc: type.desc,
                                    iconName: type.icon,
                                  ),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}

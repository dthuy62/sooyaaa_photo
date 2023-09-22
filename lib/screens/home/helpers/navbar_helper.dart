import 'package:flutter/cupertino.dart';

import '../../../common/assets/app_icons.dart';
import '../../../l10n/l10n.dart';
import '../../album/album.dart';
import '../../for_you/for_you.dart';
import '../../gallery/gallery.dart';
import '../../search/search.dart';

class MenuItem {
  const MenuItem(
    this.iconName,
    this.text,
  );

  final String iconName;
  final String text;
}

abstract interface class NavbarHelper {
  NavbarHelper._();

  static const index = 0;

  static const buildBody = [
    GalleryScreen(),
    ForYouScreen(),
    AlbumScreen(),
    SearchScreen(),
  ];

  static List<MenuItem> buildMenuItems(BuildContext context) => [
        MenuItem(AppIcons.gallery, context.l10n.text_gallery),
        MenuItem(AppIcons.forYou, context.l10n.text_for_you),
        MenuItem(AppIcons.albums, context.l10n.text_album),
        MenuItem(AppIcons.search, context.l10n.text_search),
      ];
}

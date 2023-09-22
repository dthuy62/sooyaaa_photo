import 'package:flutter/material.dart';

import '../screens/album/album.dart';
import '../screens/for_you/for_you.dart';
import '../screens/gallery/gallery.dart';
import '../screens/home/home.dart';
import '../screens/search/search.dart';

abstract class AppRoutes {
  static const gallery = 'gallery';
  static const forYou = 'forYou';
  static const home = 'home';
  static const album = 'album';
  static const search = 'search';
}

abstract class AppNavigation {
  static Route<dynamic>? onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.gallery:
        return AppPageRoute((_) => const GalleryScreen(), settings);
      case AppRoutes.home:
        return AppPageRoute((_) => const HomeScreen(), settings);
      case AppRoutes.forYou:
        return AppPageRoute((_) => const ForYouScreen(), settings);
      case AppRoutes.album:
        return AppPageRoute(
          (_) => const AlbumScreen(),
          settings,
        );
      case AppRoutes.search:
        return AppPageRoute((_) => const SearchScreen(), settings);
      default:
        throw 'Cannot find destination route';
    }
  }
}

/// This function ensures the RouteSettings parameter will be pass into a destination route
/// to make sure every destination has a settings
// ignore: non_constant_identifier_names
MaterialPageRoute<T> AppPageRoute<T>(
  Widget Function(BuildContext context) builder,
  RouteSettings settings, {
  bool maintainState = true,
  bool fullscreenDialog = false,
}) =>
    MaterialPageRoute(
      builder: builder,
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
    );

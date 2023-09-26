import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../common/extensions/extensions.dart';

class GalleryPhotoGridView extends StatelessWidget {
  const GalleryPhotoGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final safePadding = context.mediaQuery.padding.top;
    return GridView.builder(
      shrinkWrap: true,
      padding:
          EdgeInsets.only(top: AppBar().preferredHeight + safePadding + 30),
      itemCount: List.generate(200, (index) => index).length,
      itemBuilder: (context, index) {
        return Container(
          // decoration: const BoxDecoration(
          //   gradient: LinearGradient(
          //     colors: [Color(0xba3f51b5), Color(0x9ee91e63)],
          //     stops: [0.1, 1],
          //     begin: Alignment.bottomCenter,
          //     end: Alignment.topCenter,
          //   ),
          // ),
          child: CachedNetworkImage(imageUrl: 'https://s.net.vn/y4c7', fit: BoxFit.cover,),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 3, mainAxisSpacing: 3),
    );
  }
}

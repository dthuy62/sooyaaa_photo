import 'package:flutter/material.dart';

import '../../common/extensions/extensions.dart';
import '../../l10n/l10n.dart';

class NewAlbumScreen extends StatelessWidget {
  const NewAlbumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.l10n.text_new_album_name,
              style: context.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: TextField(
                  textAlign: TextAlign.center,
                  controller: TextEditingController(
                      text: 'Danh sách phát thứ 4 của tôi')),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: context.theme.colorScheme.primary,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                minimumSize: const Size(50, 30),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(context.l10n.text_create,
                  style: context.textTheme.titleSmall),
            )
          ],
        ),
      ),
    );
  }
}

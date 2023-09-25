import 'package:flutter/material.dart';

import '../../common/assets/app_icons.dart';
import '../../common/extensions/extensions.dart';
import '../../common/widgets/svg_button.dart';
import '../../l10n/l10n.dart';

class AlbumScreen extends StatelessWidget {
  const AlbumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: const SvgButton(AppIcons.plus),
            surfaceTintColor: Colors.grey.shade400,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Album',
                style: context.textTheme.titleMedium
                    ?.copyWith(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Text(
                context.l10n.text_album,
                style: context.textTheme.titleLarge,
              ),
              const Text('mini')
            ]),
          ),
          Text('đâsddá'),
        ],
      ),
    );
  }
}

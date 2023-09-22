import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/assets/app_icons.dart';
import '../../../common/extensions/extensions.dart';
import '../../../cubits/gallery_screen_app_bar_cubit.dart';
import '../../../l10n/l10n.dart';
import '../../../widgets/sooyaaa_button/sooyaaa_button.dart';

class GalleryAppBarView extends StatelessWidget {
  const GalleryAppBarView({
    super.key,
    required this.isScrollToAppBar,
    required this.isSelectPhotos,
  });

  final bool isScrollToAppBar;
  final bool isSelectPhotos;

  Color get color => isScrollToAppBar ? Colors.white : Colors.black;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            height: AppBar().preferredHeight,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedDefaultTextStyle(
                      style: context.textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                      duration: const Duration(milliseconds: 300),
                      child: const Text(
                        '21 thg 9, 2023',
                      ),
                    ),
                    AnimatedDefaultTextStyle(
                      style: context.textTheme.titleSmall!
                          .copyWith(fontWeight: FontWeight.w500, color: color),
                      duration: const Duration(milliseconds: 300),
                      child: const Text(
                        'Đà Nẵng, P. Mỹ An',
                      ),
                    )
                  ],
                ),
                isSelectPhotos
                    ? SooyaaaButton(
                        content: context.l10n.text_cancel,
                        onPressed: () => context
                            .read<GalleryScreenAppBarCubit>()
                            .setUnSelectPhotos(),
                      )
                    : Row(
                        children: [
                          SooyaaaButton(
                            content: context.l10n.text_select,
                            onPressed: () => context
                                .read<GalleryScreenAppBarCubit>()
                                .setSelectPhotos(),
                          ),
                          const SooyaaaButton(
                            buttonType: ButtonType.circle,
                            content: AppIcons.moreHorizontal,
                          ),
                        ],
                      )
              ],
            )));
  }
}

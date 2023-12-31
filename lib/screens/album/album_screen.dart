import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../common/assets/app_icons.dart';
import '../../common/extensions/extensions.dart';
import '../../common/widgets/svg_button.dart';
import '../../l10n/l10n.dart';
import '../../navigation/navigation.dart';
import '../new_album/new_album_screen.dart';
import 'views/create_album_folder_bottom_sheet.dart';

class AlbumScreen extends StatelessWidget {
  const AlbumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoScaffold(
        body: Builder(builder: (context) {
          return CupertinoPageScaffold(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  actions: [
                    SvgButton(
                      AppIcons.plus,
                      size: 35,
                      onTap: () {
                        showBarModalBottomSheet(
                          context: context,
                          settings: const RouteSettings(
                            name: AppRoutes.newAlbumOptions,
                          ),
                          builder: (_) {
                            return CreateAlbumFolderBottomSheet(
                              onTap: () {
                                context.navigator.popUntil((route) =>
                                    route.settings.name == AppRoutes.home);
                                Future.delayed(
                                    const Duration(milliseconds: 500), () {
                                  CupertinoScaffold
                                      .showCupertinoModalBottomSheet(
                                          context: context,
                                          settings: const RouteSettings(
                                            name: AppRoutes.createNewAlbum,
                                          ),
                                          builder: (_) {
                                            return const NewAlbumScreen();
                                          });
                                });
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                  surfaceTintColor: Colors.grey.shade400,
                  pinned: true,
                  expandedHeight: 100,
                  flexibleSpace: LayoutBuilder(
                    builder: (context, constraints) {
                      return FlexibleSpaceBar(
                        centerTitle: false,
                        titlePadding: const EdgeInsetsDirectional.only(
                            start: 16, bottom: 16),
                        title: Text(
                          context.l10n.text_albums,
                          style: context.textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                context.l10n.text_my_albums,
                                style: context.textTheme.titleSmall
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  context.l10n.text_see_all,
                                  style: context.textTheme.bodySmall?.copyWith(
                                      color: context.theme.colorScheme.primary),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 450,
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 8,
                                childAspectRatio: 3 / 2,
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16)
                                      .copyWith(top: 12),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  List.generate(100, (index) => index).length,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: CachedNetworkImage(
                                        imageUrl: 'https://s.net.vn/muKI',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const Text('Gần đây'),
                                    const Text('1.023')
                                  ],
                                );
                              }),
                        )
                      ]),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}

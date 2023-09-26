import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/assets/app_icons.dart';
import '../../common/extensions/extensions.dart';
import '../../common/widgets/svg_button.dart';
import '../../cubits/gallery_screen_app_bar_cubit.dart';
import '../../l10n/l10n.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state =
        context.watch<GalleryScreenAppBarCubit>().state.isScrollToAppBar;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            surfaceTintColor: Colors.transparent,
            pinned: true,
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              titlePadding: const EdgeInsetsDirectional.only(
                  start: 16, bottom: 16, end: 16),
              title: SafeArea(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return constraints.biggest.height.floor() == 40
                        ? TextField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                hintText: 'Ảnh, Người, Địa điểm...',
                                hintStyle: context.textTheme.titleSmall
                                    ?.copyWith(color: Colors.grey),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: BorderSide.none),
                                prefixIconConstraints: const BoxConstraints(
                                    maxWidth: 35, maxHeight: 35),
                                prefixIcon: const SvgButton(
                                  AppIcons.search,
                                  size: 20,
                                ),
                                // suffixIcon: const SvgButton(
                                //   AppIcons.clear,
                                //   padding: EdgeInsets.symmetric(horizontal: 8),
                                // ),
                                suffixIconConstraints: const BoxConstraints(
                                    maxWidth: 35, maxHeight: 35),
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 6,
                                ),
                                fillColor: context.theme.colorScheme.primary
                                    .withOpacity(0.2),
                                filled: true),
                          )
                        : Text(
                            context.l10n.text_search,
                            style: context.textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    cursorColor: Colors.black,
                    readOnly: true,
                    onTap: () {
                      print('fsdff');
                    },
                    decoration: InputDecoration(
                        hintText: 'Ảnh, Người, Địa điểm...',
                        hintStyle: context.textTheme.titleSmall
                            ?.copyWith(color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide.none),
                        prefixIconConstraints:
                            const BoxConstraints(maxWidth: 35, maxHeight: 35),
                        prefixIcon: const SvgButton(
                          AppIcons.search,
                          size: 20,
                        ),
                        suffixIconConstraints:
                            const BoxConstraints(maxWidth: 35, maxHeight: 35),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 6,
                        ),
                        fillColor:
                            context.theme.colorScheme.primary.withOpacity(0.2),
                        filled: true),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16)
                      .copyWith(top: 24),
                  child: Text(
                    'Khoảnh khắc',
                    style: context.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1, childAspectRatio: 3 / 1.85),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: List.generate(30, (index) => index).length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: const EdgeInsets.all(8).copyWith(left: 0),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: CachedNetworkImage(
                                    imageUrl: 'https://s.net.vn/8LPc',
                                  ),
                                ),
                                Text('Mùa thu'),
                              ],
                            ));
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16)
                      .copyWith(top: 24),
                  child: Text(
                    'Người',
                    style: context.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, mainAxisSpacing: 10),
                    itemCount: 100,
                    itemBuilder: (BuildContext context, int index) {
                      return ClipOval(
                        child: SizedBox(
                          width: 120,
                          height: 120,
                          child: CachedNetworkImage(
                            imageUrl: 'https://s.net.vn/UdeW',
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16)
                      .copyWith(top: 24),
                  child: Text(
                    'Danh mục',
                    style: context.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1, childAspectRatio: 3 / 1.85),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: List.generate(30, (index) => index).length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: const EdgeInsets.all(8).copyWith(left: 0),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: CachedNetworkImage(
                                    imageUrl: 'https://s.net.vn/8LPc',
                                  ),
                                ),
                                Text('Mùa thu'),
                              ],
                            ));
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/home_tab/home_tab_cubit.dart';
import '../../common/assets/app_icons.dart';
import '../../common/extensions/context.dart';
import '../../common/widgets/svg_button.dart';
import '../../cubits/gallery_screen_app_bar_cubit.dart';
import 'helpers/navbar_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final menuItems = NavbarHelper.buildHomeMenuItems(context);
    final isSelectPhotos =
        context.watch<GalleryScreenAppBarCubit>().state.isSelectPhotos;
    return Scaffold(
      bottomNavigationBar: isSelectPhotos
          ? SizedBox(
              height: context.mediaQuery.padding.bottom +
                  kBottomNavigationBarHeight +
                  2,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgButton(AppIcons.share),
                  Text('Selecte Items'),
                  Row(
                    children: [
                      SvgButton(AppIcons.trash),
                      SvgButton(AppIcons.moreBorderCircle),
                    ],
                  )
                ],
              ),
            )
          : BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (index) => context.read<HomeTabCubit>().changeTab(index),
              currentIndex: context.watch<HomeTabCubit>().state,
              items: menuItems
                  .map(
                    (item) => BottomNavigationBarItem(
                        icon: SvgButton(
                          item.iconName,
                          padding: EdgeInsets.zero,
                        ),
                        label: item.text),
                  )
                  .toList(),
            ),
      body: BlocBuilder<HomeTabCubit, int>(
        builder: (context, state) {
          return IndexedStack(
            index: context.watch<HomeTabCubit>().state,
            children: NavbarHelper.mainScreens,
          );
        },
      ),
    );
  }
}

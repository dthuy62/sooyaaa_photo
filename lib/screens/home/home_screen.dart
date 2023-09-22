import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/home_tab/home_tab_cubit.dart';
import '../../common/widgets/svg_button.dart';
import 'helpers/navbar_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final menuItems = NavbarHelper.buildMenuItems(context);
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) => context.read<HomeTabCubit>().changeTab(index),
        currentIndex: context.watch<HomeTabCubit>().state,
        items: menuItems
            .map(
              (item) => BottomNavigationBarItem(
                  icon: SvgButton(item.iconName), label: item.text),
            )
            .toList(),
      ),
      body: BlocBuilder<HomeTabCubit, int>(
        builder: (context, state) {
          return IndexedStack(
            index: context.watch<HomeTabCubit>().state,
            children: NavbarHelper.buildBody,
          );
        },
      ),
    );
  }
}

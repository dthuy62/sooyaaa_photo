import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/extensions/context.dart';
import '../../cubits/gallery_screen_app_bar_cubit.dart';
import '../../cubits/gallery_screen_app_bar_state.dart';
import 'helpers/tab_bar_helper.dart';
import 'views/views.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 3);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = TabBarHelper.getTextTabsLocalized(context);
    return BlocBuilder<GalleryScreenAppBarCubit, GalleryScreenAppBarState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          body: Stack(
            children: [
              TabBarView(
                controller: _tabController,
                children: [
                  const Center(
                    child: Text('Năm'),
                  ),
                  const Center(
                    child: Text('Tháng'),
                  ),
                  const Center(
                    child: Text('Ngày'),
                  ),
                  NotificationListener<ScrollNotification>(
                    onNotification: (noti) {
                      if (noti.metrics.pixels.floor() >= 78) {
                        context
                            .read<GalleryScreenAppBarCubit>()
                            .setScrollToAppBar();
                      } else {
                        context
                            .read<GalleryScreenAppBarCubit>()
                            .setUnScrollToAppBar();
                      }
                      return true;
                    },
                    child: const GalleryPhotoGridView(),
                  ),
                ],
              ),
              GalleryAppBarView(
                isScrollToAppBar: state.isScrollToAppBar,
                isSelectPhotos: state.isSelectPhotos,
              ),
              state.isSelectPhotos
                  ? const SizedBox.shrink()
                  : Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 35,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: context.theme.scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TabBar(
                          controller: _tabController,
                          dividerColor: Colors.transparent,
                          indicatorColor: Colors.transparent,
                          indicatorPadding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 3),
                          indicatorSize: TabBarIndicatorSize.tab,
                          // give the indicator a decoration (color and border radius)
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: context.theme.colorScheme.primary,
                          ),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          tabs: tabs
                              .map((tab) => Tab(
                                    text: tab,
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}

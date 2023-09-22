import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/assets/app_icons.dart';
import '../../common/widgets/svg_button.dart';
import 'cubit/gallery_screen_app_bar_cubit.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = AppBar().preferredSize.height;
    final safePadding = MediaQuery.of(context).padding.top;
    return BlocProvider(
      create: (context) => GalleryScreenAppBarCubit(),
      child: BlocBuilder<GalleryScreenAppBarCubit, bool>(
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
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
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: height + safePadding + 30),
                    itemCount: List.generate(200, (index) => index).length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          colors: [Color(0xba3f51b5), Color(0x9ee91e63)],
                          stops: [0.1, 1],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        )),
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 3,
                            mainAxisSpacing: 3),
                  ),
                ),
                SafeArea(
                    child: Container(
                        height: height,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AnimatedDefaultTextStyle(
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color:
                                          state ? Colors.white : Colors.black),
                                  duration: const Duration(milliseconds: 300),
                                  child: Text(
                                    '21 thg 9, 2023',
                                  ),
                                ),
                                AnimatedDefaultTextStyle(
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color:
                                          state ? Colors.white : Colors.black),
                                  duration: const Duration(milliseconds: 300),
                                  child: Text(
                                    'Đà Nẵng, P. Mỹ An',
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.grey.shade200,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 5),
                                    minimumSize: const Size(50, 30),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: const Text('Chọn'),
                                ),
                                TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.grey.shade200,
                                      padding: const EdgeInsets.all(7),
                                      shape: const CircleBorder(),
                                      minimumSize: const Size(0, 0),
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    onPressed: () {},
                                    child: const SvgButton(
                                      AppIcons.moreHorizontal,
                                      size: 18,
                                    ))
                              ],
                            )
                          ],
                        ))),
              ],
            ),
          );
        },
      ),
    );
  }
}

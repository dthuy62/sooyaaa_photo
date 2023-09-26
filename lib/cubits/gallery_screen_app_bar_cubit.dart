import 'package:flutter_bloc/flutter_bloc.dart';

import 'gallery_screen_app_bar_state.dart';

class GalleryScreenAppBarCubit extends Cubit<GalleryScreenAppBarState> {
  GalleryScreenAppBarCubit() : super(const GalleryScreenAppBarInitial());

  void setScrollToAppBar() => emit(state.copyWith(
        isScrollToAppBar: true,
      ));

  void setUnScrollToAppBar() => emit(state.copyWith(
        isScrollToAppBar: false,
      ));

  void setSelectPhotos() => emit(state.copyWith(isSelectPhotos: true));
  void setUnSelectPhotos() => emit(state.copyWith(isSelectPhotos: false));
}

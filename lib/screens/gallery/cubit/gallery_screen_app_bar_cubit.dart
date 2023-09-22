import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryScreenAppBarCubit extends Cubit<bool> {
  GalleryScreenAppBarCubit() : super(false);

  void setScrollToAppBar() => emit(true);
  void setUnScrollToAppBar() => emit(false);

  // void setPositioned(double position) =>
  //     emit(GalleryScreenAppBarState(isScrolled: true, position: position));
  // void clearPositioned(double position) =>
  //     emit(GalleryScreenAppBarState(isScrolled: , position: position));
}

import 'package:equatable/equatable.dart';

abstract interface class GalleryScreenAppBarState extends Equatable {
  final bool isScrollToAppBar;
  final bool isSelectPhotos;

  const GalleryScreenAppBarState({
    this.isScrollToAppBar = false,
    this.isSelectPhotos = false,
  });

  GalleryScreenAppBarState copyWith({
    bool? isScrollToAppBar,
    bool? isSelectPhotos,
  });
}

final class GalleryScreenAppBarInitial extends GalleryScreenAppBarState {
  const GalleryScreenAppBarInitial({
    super.isScrollToAppBar,
    super.isSelectPhotos,
  });

  @override
  List<Object?> get props => [
        isScrollToAppBar,
        isSelectPhotos,
      ];

  @override
  GalleryScreenAppBarState copyWith(
      {bool? isScrollToAppBar, bool? isSelectPhotos}) {
    return GalleryScreenAppBarInitial(
      isScrollToAppBar: isScrollToAppBar ?? this.isScrollToAppBar,
      isSelectPhotos: isSelectPhotos ?? this.isSelectPhotos,
    );
  }
}

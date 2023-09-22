import 'package:equatable/equatable.dart';

class GalleryScreenAppBarState extends Equatable {
  final bool isScrolled;
  final double position;

  const GalleryScreenAppBarState(
      {this.isScrolled = false, this.position = 0.0});
  @override
  // TODO: implement props
  List<Object?> get props => [isScrolled, position];
}

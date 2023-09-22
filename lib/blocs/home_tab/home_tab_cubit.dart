import 'package:hydrated_bloc/hydrated_bloc.dart';

class HomeTabCubit extends HydratedCubit<int> {
  HomeTabCubit() : super(0);
  void changeTab(int index) => emit(index);

  static const _indexKey = 'index';

  @override
  int? fromJson(Map<String, dynamic> json) => json[_indexKey];

  @override
  Map<String, dynamic>? toJson(int state) => {_indexKey: state};
}

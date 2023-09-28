import 'dart:convert';

import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../data/local/local.dart';
import '../../data/local/local_storage_key.dart';
import '../../di/service_locator.dart';
import '../../models/domain/user.dart';

final class AppAuthCubit extends HydratedCubit<User?> {
  AppAuthCubit() : super(null);

  final localStorage = ServiceLocator.instance.inject<LocalStorage>();

  void setUserLogged(User? user) {
    final jsonString = jsonEncode(user?.toJson());
    localStorage.setString(LocalStorageKey.user, jsonString);
    emit(user);
  }

  void unsetUserLogged() {
    localStorage.remove(LocalStorageKey.user);
    clear();
    emit(null);
  }

  @override
  User? fromJson(Map<String, dynamic> json) => User.fromJson(json);

  @override
  Map<String, dynamic>? toJson(User? state) => state?.toJson();
}

import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app/app.dart';
import 'app/app_bloc_observer.dart';
import 'common/error_screen.dart';

const String authDioInstance = 'auth_dio';
const String noAuthDioInstance = 'no_auth_dio';

Future<void> initialize() async {
  FlutterError.onError = (FlutterErrorDetails details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  EquatableConfig.stringify = true;
  Bloc.observer = AppBlocObserver();

  ErrorWidget.builder = (details) => ErrorScreen(details: details);
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationSupportDirectory(),
  );

  runApp(const App());
}

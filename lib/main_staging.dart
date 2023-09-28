import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_flavor.dart';
import 'data/local/local_storage.dart';
import 'data/remote/remote.dart';
import 'di/service_locator.dart';
import 'firebase_options.dart';
import 'intialize.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final sharedPrefs = await SharedPreferences.getInstance();
  final serviceLocator = ServiceLocator.instance;
  serviceLocator.registerSingleton<LocalStorage>(LocalStorageImpl(sharedPrefs));
  serviceLocator
      .registerSingleton(AuthenticationInterceptor(serviceLocator.inject()));
  final dioClient = DioClient(
    baseUrl: AppFlavor.staging.baseUrl,
    authenticationInterceptor: serviceLocator.inject(),
  );

  serviceLocator.configureFirebaseAuthModule();
  serviceLocator.registerSingleton(dioClient);
  serviceLocator.configureNetworkModule(AppFlavor.staging);

  initialize();
}

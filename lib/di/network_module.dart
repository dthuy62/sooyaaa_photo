part of 'service_locator.dart';

extension ServiceLocatorX on ServiceLocator {
  void configureFirebaseAuthModule() {
    registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  }

  void configureNetworkModule(AppFlavor flavor) {
    // registerSingleton<MediumDataSource>(
    //     MediumAuthApi(inject<DioClient>().authDio, inject()));
    // registerSingleton<MediumRepository>(MediumRepositoryImpl(inject()));
    registerSingleton<FirebaseDataSource>(FirebaseAuthApi(
      inject<DioClient>().dio,
    ));
    registerSingleton<FirebaseRepository>(FirebaseRepositoryImpl(inject()));
  }
}

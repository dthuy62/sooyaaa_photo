import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/app_auth/app_auth_cubit.dart';
import '../blocs/home_tab/home_tab_cubit.dart';
import '../cubits/gallery_screen_app_bar_cubit.dart';
import '../di/service_locator.dart';
import '../domain/domain.dart';
import '../domain/repositories/firebase_repository.dart';
import '../l10n/l10n.dart';
import '../navigation/navigation.dart';
import '../theme/theme.dart';
import 'app_route_observer.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<MediumRepository>(
          create: (BuildContext context) =>
              ServiceLocator.instance.inject<MediumRepository>(),
        ),
        RepositoryProvider<FirebaseRepository>(
          create: (context) =>
              ServiceLocator.instance.inject<FirebaseRepository>(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AppAuthCubit()),
          BlocProvider(create: (_) => GalleryScreenAppBarCubit()),
          BlocProvider(create: (_) => HomeTabCubit()),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AppAuthCubit>().state;
    return MaterialApp(
      navigatorObservers: [
        AppRouteObserver(),
      ],
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateRoute: AppNavigation.onGeneratedRoute,
      initialRoute: auth != null ? AppRoutes.home : AppRoutes.login,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/home_tab/home_tab_cubit.dart';
import '../cubits/gallery_screen_app_bar_cubit.dart';
import '../di/service_locator.dart';
import '../domain/domain.dart';
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
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => GalleryScreenAppBarCubit()),
          BlocProvider(create: (_) => HomeTabCubit())
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
      initialRoute: AppRoutes.login,
    );
  }
}

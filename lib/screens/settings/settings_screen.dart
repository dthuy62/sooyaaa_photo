import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/app_auth/app_auth_cubit.dart';
import '../../common/extensions/extensions.dart';
import '../../models/domain/user.dart';
import '../../navigation/navigation.dart';
import '../../widgets/sooyaaa_button/sooyaaa_button.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AppAuthCubit, User?>(
        listener: (context, state) {
          state == null ? context.navigator.pushNamed(AppRoutes.login) : null;
        },
        builder: (context, state) {
          return Center(
            child: SooyaaaButton(
                onPressed: () {
                  context.read<AppAuthCubit>().unsetUserLogged();
                },
                content: 'Đăng xuất'),
          );
        },
      ),
    );
  }
}

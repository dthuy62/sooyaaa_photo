import 'package:flutter/material.dart';

import '../../common/assets/app_icons.dart';
import '../../common/extensions/extensions.dart';
import '../../common/widgets/svg_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 28),
                child: Text(
                  'Lưu giữ những khoảnh khắc miễn phí bằng Sooyaaa.',
                  textAlign: TextAlign.center,
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: context.theme.colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Đăng ký miễn phí',
                      style: context.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        const SvgButton(
                          AppIcons.phone,
                          color: null,
                          padding: EdgeInsets.zero,
                        ),
                        const Spacer(),
                        Text(
                          'Tiếp tục bằng số điện thoại',
                          style: context.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        const SvgButton(
                          AppIcons.google,
                          color: null,
                          padding: EdgeInsets.zero,
                        ),
                        const Spacer(),
                        Text(
                          'Tiếp tục bằng Google',
                          style: context.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        const SvgButton(
                          AppIcons.facebook,
                          color: null,
                          padding: EdgeInsets.zero,
                        ),
                        const Spacer(),
                        Text(
                          'Tiếp tục bằng Facebook',
                          style: context.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        const SvgButton(
                          AppIcons.apple,
                          color: null,
                          padding: EdgeInsets.zero,
                        ),
                        const Spacer(),
                        Text(
                          'Tiếp tục bằng Apple',
                          style: context.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../common/extensions/extensions.dart';
import '../../common/widgets/svg_button.dart';

enum ButtonType { oval, circle }

class SooyaaaButton extends StatelessWidget {
  const SooyaaaButton({
    super.key,
    this.onPressed,
    this.content = '',
    this.buttonType = ButtonType.oval,
  });

  final VoidCallback? onPressed;
  final String content;
  final ButtonType buttonType;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Colors.grey.shade200,
        shape: buttonType == ButtonType.oval ? null : const CircleBorder(),
        padding: buttonType == ButtonType.oval
            ? const EdgeInsets.symmetric(horizontal: 14, vertical: 5)
            : const EdgeInsets.all(7),
        minimumSize: const Size(50, 30),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: buttonType == ButtonType.oval
          ? Text(
              content,
              style: context.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.theme.colorScheme.primary),
            )
          : SvgButton(
              content,
              size: 18,
            ),
    );
  }
}

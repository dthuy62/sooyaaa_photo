import 'package:flutter/cupertino.dart';

import '../../../l10n/l10n.dart';

abstract interface class TabBarHelper {
  TabBarHelper._();

  static List<String> getTextTabsLocalized(BuildContext context) => [
        context.l10n.text_year,
        context.l10n.text_month,
        context.l10n.text_date,
        context.l10n.text_all,
      ];
}

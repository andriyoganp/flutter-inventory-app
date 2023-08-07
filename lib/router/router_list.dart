import 'package:flutter/widgets.dart';

import '../presentation/page/home_page.dart';

class RouterList {
  RouterList._();

  static const String initialRoute = HomePage.routeName;

  static Map<String, WidgetBuilder> list = <String, WidgetBuilder>{
    HomePage.routeName: (_) => const HomePage(),
  };
}

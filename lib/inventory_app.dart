import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/view_model/change_notifier_list.dart';
import 'router/router_list.dart';

class InventoryApp extends StatelessWidget {
  const InventoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ChangeNotifierList.list,
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true,
        ),
        title: 'Inventory App',
        initialRoute: RouterList.initialRoute,
        routes: RouterList.list,
      ),
    );
  }
}

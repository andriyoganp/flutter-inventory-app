import 'package:flutter/material.dart';

import 'di/injection.dart';
import 'inventory_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjection();
  runApp(const InventoryApp());
}

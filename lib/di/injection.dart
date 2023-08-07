import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'change_notifier_di.dart';
import 'database_di.dart';
import 'repository_di.dart';
import 'use_case_di.dart';

final GetIt getIt = GetIt.instance;

Future<void> initInjection() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);

  initDatabase(getIt);
  initRepository(getIt);
  initUseCase(getIt);
  initChangeNotifier(getIt);
}

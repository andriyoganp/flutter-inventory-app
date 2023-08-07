import 'package:get_it/get_it.dart';

import '../data/database/friend_dao.dart';
import '../data/database/inventory_database.dart';
import '../data/database/loan_tool_entry_dao.dart';
import '../data/database/tool_dao.dart';

void initDatabase(GetIt getIt) {
  final InventoryDatabase db = InventoryDatabase();
  getIt
    ..registerLazySingleton(() => db)
    ..registerLazySingleton<FriendDao>(() => FriendDao(getIt()))
    ..registerLazySingleton<ToolDao>(() => ToolDao(getIt()))
    ..registerLazySingleton<LoanToolEntryDao>(() => LoanToolEntryDao(getIt()));
}

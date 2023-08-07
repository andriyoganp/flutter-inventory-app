import 'package:shared_preferences/shared_preferences.dart';

import '../../data/database/inventory_database.dart';
import '../../data/preferences/preference_keys.dart';
import 'prepare_data_use_case.dart';

class PrepareDataUseCaseImpl extends PrepareDataUseCase {
  PrepareDataUseCaseImpl(this.prefs, this.database);

  final SharedPreferences prefs;
  final InventoryDatabase database;

  @override
  Future<void> invoke() async {
    if (prefs.getBool(PreferenceKeys.hasPrepareData) == null ||
        prefs.getBool(PreferenceKeys.hasPrepareData) == false) {
      await database.insertAll();
      await database.insertEntries();
      await prefs.setBool(PreferenceKeys.hasPrepareData, true);
    }
  }
}

import 'package:drift/drift.dart';

import 'friend_entity.dart';
import 'tool_entity.dart';

@DataClassName('LoanToolEntryEntity')
class LoanToolEntries extends Table {
  IntColumn get toolId => integer().references(Tools, #id)();

  IntColumn get friendId => integer().references(Friends, #id)();

  IntColumn get loanedCount => integer()();

  DateTimeColumn get loanedDate => dateTime()();
}

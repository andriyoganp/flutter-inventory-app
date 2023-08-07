import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../di/injection.dart';
import '../../domain/model/friend.dart';
import '../../domain/model/loaned_tool.dart';
import '../../domain/model/tool.dart';
import 'dashboard_change_notifier.dart';
import 'friend_list_change_notifier.dart';
import 'loan_tool_change_notifier.dart';
import 'tool_detail_change_notifier.dart';
import 'tool_list_change_notifier.dart';

class ChangeNotifierList {
  ChangeNotifierList._();

  static List<SingleChildWidget> get list => <SingleChildWidget>[
        ChangeNotifierProvider<DashboardChangeNotifier>(
            create: (_) => getIt<DashboardChangeNotifier>()),
        ChangeNotifierProvider<FriendListChangeNotifier>(
            create: (_) => getIt<FriendListChangeNotifier>()),
        ChangeNotifierProvider<ToolListChangeNotifier>(
            create: (_) => getIt<ToolListChangeNotifier>()),
        ChangeNotifierProvider<ToolDetailChangeNotifier>(
            create: (_) => getIt<ToolDetailChangeNotifier>()),
        ChangeNotifierProvider<LoanToolChangeNotifier>(
            create: (_) => getIt<LoanToolChangeNotifier>()),
        StreamProvider<List<Friend>>(
          create: (_) => getIt<FriendListChangeNotifier>().friends,
          initialData: const <Friend>[],
        ),
        StreamProvider<List<Tool>>(
          create: (_) => getIt<ToolListChangeNotifier>().tools,
          initialData: const <Tool>[],
        ),
        StreamProvider<List<LoanedTool>>(
          create: (_) => getIt<DashboardChangeNotifier>().loanedTools,
          initialData: const <LoanedTool>[],
        ),
      ];
}

import 'package:get_it/get_it.dart';

import '../presentation/view_model/dashboard_change_notifier.dart';
import '../presentation/view_model/friend_list_change_notifier.dart';
import '../presentation/view_model/loan_tool_change_notifier.dart';
import '../presentation/view_model/tool_detail_change_notifier.dart';
import '../presentation/view_model/tool_list_change_notifier.dart';

void initChangeNotifier(GetIt getIt) {
  getIt
    ..registerSingleton<DashboardChangeNotifier>(
        DashboardChangeNotifier(getIt(), getIt()))
    ..registerSingleton<FriendListChangeNotifier>(
        FriendListChangeNotifier(getIt()))
    ..registerSingleton<ToolListChangeNotifier>(ToolListChangeNotifier(getIt()))
    ..registerSingleton<ToolDetailChangeNotifier>(
        ToolDetailChangeNotifier(getIt()))
    ..registerSingleton<LoanToolChangeNotifier>(
        LoanToolChangeNotifier(getIt(), getIt()));
}

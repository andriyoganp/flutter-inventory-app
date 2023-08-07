import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../di/injection.dart';
import '../../domain/model/loaned_tool.dart';
import '../../domain/model/tool.dart';
import '../view_model/dashboard_change_notifier.dart';
import 'tool_detail_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DashboardChangeNotifier _provider = getIt<DashboardChangeNotifier>();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _provider.prepareData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Loaned Tools',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: Consumer<List<LoanedTool>>(
              builder: (_, List<LoanedTool> loanedTools, __) {
                return GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 24,
                    left: 12,
                    right: 12,
                  ),
                  children:
                      List<Widget>.generate(loanedTools.length, (int index) {
                    final LoanedTool loanedTool = loanedTools[index];
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () => _navigateToToolDetail(loanedTool.tool),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '${loanedTool.totalLoanedCount}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              loanedTool.tool.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                          // Image
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToToolDetail(Tool tool) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => ToolDetailPage(tool: tool),
      ),
    );
  }
}

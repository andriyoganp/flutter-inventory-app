import 'friend.dart';
import 'tool.dart';

class LoanedTool {
  LoanedTool({
    required this.tool,
    required this.totalLoanedCount,
    this.friends = const <Friend>[],
  });

  final List<Friend> friends;
  final Tool tool;
  final int totalLoanedCount;

  @override
  String toString() {
    return 'LoanedTool{friends: $friends, tool: $tool, totalLoanedCount: $totalLoanedCount}';
  }
}

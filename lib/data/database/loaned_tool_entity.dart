import 'inventory_database.dart';

class LoanedToolEntity {
  LoanedToolEntity(this.tool, this.totalLoanedCount, {this.friend});

  final ToolEntity tool;
  final int totalLoanedCount;
  final FriendEntity? friend;

  @override
  String toString() {
    return 'LoanedToolEntity{tool: $tool, totalLoanedCount: $totalLoanedCount, friend: $friend}';
  }
}

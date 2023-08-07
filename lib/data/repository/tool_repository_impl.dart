import '../../domain/model/friend.dart';
import '../../domain/model/loaned_tool.dart';
import '../../domain/model/tool.dart';
import '../database/inventory_database.dart';
import '../database/loan_tool_entry_dao.dart';
import '../database/loaned_tool_entity.dart';
import '../database/tool_dao.dart';
import 'tool_repository.dart';

class ToolRepositoryImpl extends ToolRepository {
  ToolRepositoryImpl(this._toolDao, this._loanToolEntryDao);

  final ToolDao _toolDao;

  final LoanToolEntryDao _loanToolEntryDao;

  @override
  Stream<List<Tool>> getAllTools() =>
      _toolDao.getAllTools().map((List<ToolEntity> list) => list
          .map((ToolEntity toolEntity) => Tool(
              id: toolEntity.id,
              name: toolEntity.name,
              imageUrl: toolEntity.imageUrl,
              totalItem: toolEntity.totalItem))
          .toList());

  @override
  Stream<List<LoanedTool>> getLoanedTools() => _loanToolEntryDao
      .getLoanedTools()
      .map((List<LoanedToolEntity> list) => list
          .map((LoanedToolEntity entity) => LoanedTool(
              tool: Tool(
                  id: entity.tool.id,
                  name: entity.tool.name,
                  imageUrl: entity.tool.imageUrl,
                  totalItem: entity.tool.totalItem),
              totalLoanedCount: entity.totalLoanedCount))
          .toList());

  @override
  Future<LoanedTool> getLoanedToolByFriend(int toolId) async {
    return _loanToolEntryDao
        .getLoanedToolByFriends(toolId)
        .then((List<LoanedToolEntity> list) {
      final List<Friend> friends = <Friend>[];
      Tool tool = Tool(id: -1, name: '', imageUrl: '', totalItem: 0);
      int sum = 0;
      for (final LoanedToolEntity entity in list) {
        if (tool.id != entity.tool.id) {
          tool = Tool(
            id: entity.tool.id,
            name: entity.tool.name,
            imageUrl: entity.tool.imageUrl,
            totalItem: entity.tool.totalItem,
          );
        }
        sum = sum + entity.totalLoanedCount;
        friends.add(
          Friend(
            id: entity.friend?.id ?? 0,
            name: entity.friend?.name ?? '',
            totalItemLoaned: entity.totalLoanedCount,
          ),
        );
      }
      return LoanedTool(tool: tool, totalLoanedCount: sum, friends: friends);
    });
  }
}

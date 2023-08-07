import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../di/injection.dart';
import '../../domain/model/friend.dart';
import '../../domain/model/tool.dart';
import '../component/friend_item_card.dart';
import '../view_model/tool_detail_change_notifier.dart';
import 'loan_tool_bottom_sheet.dart';

class ToolDetailPage extends StatefulWidget {
  const ToolDetailPage({super.key, required this.tool});

  final Tool tool;

  @override
  State<ToolDetailPage> createState() => _ToolDetailPageState();
}

class _ToolDetailPageState extends State<ToolDetailPage> {
  final ToolDetailChangeNotifier _provider = getIt<ToolDetailChangeNotifier>();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _provider.getLoanedToolByFriends(widget.tool.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tool Detail',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Consumer<ToolDetailChangeNotifier>(
        builder: (_, ToolDetailChangeNotifier changeNotifier, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      offset: const Offset(0, 1),
                      spreadRadius: 2,
                      blurRadius: 4,
                      color: Colors.black.withOpacity(
                        0.15,
                      ),
                    )
                  ],
                ),
                child: CachedNetworkImage(
                  imageUrl: widget.tool.imageUrl,
                  imageBuilder: (_, ImageProvider<Object> imageProvider) =>
                      Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (_, __) => Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.image_outlined,
                      size: 40,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  fadeOutDuration: const Duration(
                    milliseconds: 500,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Total of this item : ',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        '${widget.tool.totalItem}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                                color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Rest of this item : ',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        '${widget.tool.totalItem - changeNotifier.loanedTool.totalLoanedCount}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                                color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Text(
                  'Friends Borrowed The Item',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: changeNotifier.loanedTool.friends.isNotEmpty
                      ? ListView.separated(
                          itemBuilder: (_, int index) {
                            final Friend friend =
                                changeNotifier.loanedTool.friends[index];
                            return FriendCardItem(
                              friend: friend,
                              onPressed: () {
                                showModalBottomSheet<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return LoanToolBottomSheet(
                                        tool: widget.tool,
                                        friend: friend,
                                        currentLoaned: friend.totalItemLoaned,
                                        totalItemLoaned: changeNotifier
                                            .loanedTool.totalLoanedCount,
                                      );
                                    });
                              },
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 4);
                          },
                          itemCount: changeNotifier.loanedTool.friends.length,
                        )
                      : Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          child: const Text('No Friend Borrow This Item'),
                        ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 24,
                  top: 12,
                ),
                child: FilledButton.tonal(
                  onPressed: () {
                    showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return LoanToolBottomSheet(
                            tool: widget.tool,
                            totalItemLoaned:
                                changeNotifier.loanedTool.totalLoanedCount,
                          );
                        });
                  },
                  child: Text(
                    'Loan This Item'.toUpperCase(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              )
            ],
          );
        },
        child: const SizedBox.shrink(),
      ),
    );
  }
}

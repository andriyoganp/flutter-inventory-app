import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/model/friend.dart';
import '../../domain/model/tool.dart';

class LoanToolBottomSheet extends StatefulWidget {
  const LoanToolBottomSheet({super.key, this.tool, this.friend, this.currentLoaned, this.totalItemLoaned});

  final Tool? tool;
  final Friend? friend;
  final int? currentLoaned;
  final int? totalItemLoaned;

  @override
  State<LoanToolBottomSheet> createState() => _LoanToolBottomSheetState();
}

class _LoanToolBottomSheetState extends State<LoanToolBottomSheet> {
  Tool? _tool;
  Friend? _friend;
  bool _enableSelectTool = false;
  bool _enableSelectFriend = false;
  int _loanedCount = 0;
  int _maxLoanedCount = 0;

  @override
  void initState() {
    _tool = widget.tool;
    _enableSelectTool = widget.tool == null;
    _friend = widget.friend;
    _enableSelectFriend = widget.friend == null;
    _loanedCount = widget.currentLoaned ?? 0;
    _maxLoanedCount = (_tool?.totalItem ?? 0) - (widget.totalItemLoaned ?? 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.background),
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 12),
      child: Consumer2<List<Friend>, List<Tool>>(
        builder: (_, List<Friend> friends, List<Tool> tools, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Choose Tool and Friend',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    'Tool',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.grey.withOpacity(
                                      _enableSelectTool ? 0 : 0.2,
                                    ),
                                  ),
                                  child: DropdownButton<String>(
                                    value: _tool?.name,
                                    hint: Text(
                                      'Choose Tool',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    items: tools
                                        .map((Tool tool) => tool.name)
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        enabled: _enableSelectTool,
                                        value: value,
                                        child: Text(
                                          value,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: !_enableSelectTool
                                        ? null
                                        : (String? newValue) {
                                            setState(() {
                                              final int indexSelected = tools
                                                  .indexWhere((Tool element) =>
                                                      element.name == newValue);
                                              _tool = tools[indexSelected];
                                            });
                                          },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    'Friend',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.grey.withOpacity(
                                      _enableSelectFriend ? 0 : 0.2,
                                    ),
                                  ),
                                  child: DropdownButton<String>(
                                    value: _friend?.name,
                                    hint: Text(
                                      'Choose Friend',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                      textAlign: TextAlign.end,
                                    ),
                                    items: friends
                                        .map((Friend friend) => friend.name)
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        enabled: _enableSelectFriend,
                                        value: value,
                                        child: Text(
                                          value,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: !_enableSelectFriend
                                        ? null
                                        : (String? newValue) {
                                            setState(() {
                                              final int indexSelected = tools
                                                  .indexWhere((Tool element) =>
                                                      element.name == newValue);
                                              _tool = tools[indexSelected];
                                            });
                                          },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    'Loaned Item',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    IconButton.filledTonal(
                                      onPressed: _loanedCount == 0
                                          ? null
                                          : () {
                                              setState(() {
                                                _loanedCount--;
                                              });
                                            },
                                      icon: const Icon(
                                        Icons.remove,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                      ),
                                      child: Text('$_loanedCount'),
                                    ),
                                    IconButton.filledTonal(
                                      onPressed: _loanedCount == _maxLoanedCount
                                          ? null
                                          : () {
                                              setState(() {
                                                _loanedCount++;
                                              });
                                            },
                                      icon: const Icon(
                                        Icons.add,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton.tonal(
                          child: Text('Save'.toUpperCase()),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

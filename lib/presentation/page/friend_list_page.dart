import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/model/friend.dart';
import '../component/friend_item_card.dart';
import 'loan_tool_bottom_sheet.dart';

class FriendListPage extends StatefulWidget {
  const FriendListPage({super.key});

  @override
  State<FriendListPage> createState() => _FriendListPageState();
}

class _FriendListPageState extends State<FriendListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends'),
      ),
      body: Consumer<List<Friend>>(
        builder: (_, List<Friend> friends, __) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            itemBuilder: (_, int index) {
              final Friend friend = friends[index];
              return FriendCardItem(
                  friend: friend,
                  onPressed: () {
                    // showModalBottomSheet<void>(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return LoanToolBottomSheet(
                    //         friend: friend,
                    //       );
                    //     });
                  });
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 4);
            },
            itemCount: friends.length,
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../domain/model/friend.dart';

class FriendCardItem extends StatelessWidget {
  const FriendCardItem({
    super.key,
    required this.friend,
    this.onPressed,
  });

  final Friend friend;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: <Widget>[
              Expanded(child: Text(friend.name)),
              Column(
                children: <Widget>[
                  Text(
                    '${friend.totalItemLoaned}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Item Loaned',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

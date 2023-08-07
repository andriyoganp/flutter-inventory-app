class FriendLoanedToolCountEntity {
  FriendLoanedToolCountEntity({
    required this.id,
    required this.name,
    this.totalItemLoaned = 0,
  });

  final int id;
  final String name;
  final int totalItemLoaned;
}

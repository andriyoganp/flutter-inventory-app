class Friend {
  Friend({required this.id, required this.name, this.totalItemLoaned = 0});

  final int id;
  final String name;
  final int totalItemLoaned;

  @override
  String toString() {
    return 'Friend{id: $id, name: $name, totalItemLoaned: $totalItemLoaned}';
  }
}

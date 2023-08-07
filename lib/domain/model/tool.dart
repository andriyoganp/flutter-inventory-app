class Tool {
  Tool({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.totalItem,
  });

  final int id;
  final String name;
  final String imageUrl;
  final int totalItem;

  @override
  String toString() {
    return 'Tool{id: $id, name: $name, imageUrl: $imageUrl, totalItem: $totalItem}';
  }
}

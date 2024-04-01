class Post {
  String name;
  String description;
  int? stock = 0;
  DateTime? date = DateTime.now();
  Post({required this.name, required this.description, this.stock, this.date});
}

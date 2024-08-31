class TagItem {
  final String name;

  TagItem({required this.name});

  factory TagItem.fromJson(Map<String, dynamic> json) {
    return TagItem(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}

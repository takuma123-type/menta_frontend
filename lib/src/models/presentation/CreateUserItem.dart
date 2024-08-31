class CreateUserItem {
  final String first_name;
  final String last_name;

  CreateUserItem({required this.first_name, required this.last_name});

  factory CreateUserItem.fromJson(Map<String, dynamic> json) {
    return CreateUserItem(
      first_name: json['first_name'],
      last_name: json['last_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': first_name,
      'last_name': last_name,
    };
  }
}

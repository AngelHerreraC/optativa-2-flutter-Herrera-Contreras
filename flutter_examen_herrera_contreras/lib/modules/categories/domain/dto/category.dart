class category {
  final String name;
  final String url;
  final String slug;

  category({required this.name, required this.url, required this.slug});

  factory category.fromJson(Map<String, dynamic> json) {
    return category(
      name: json['name'],
      url: json['imageUrl'] ?? '',
      slug: json['slug']
    );
  }
}

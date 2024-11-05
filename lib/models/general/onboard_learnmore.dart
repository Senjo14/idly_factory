class Benefit {
  final String image;
  final String title;
  final String description;

  Benefit(
      {required this.image, required this.title, required this.description});

  factory Benefit.fromJson(Map<String, dynamic> json) {
    return Benefit(
      image: json['image'],
      title: json['title'],
      description: json['description'],
    );
  }
}

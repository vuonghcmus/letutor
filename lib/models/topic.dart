class Topic {
  String id;
  int numberOfPages;
  String key;
  String name;
  String nameFile;

  Topic({
    this.id = '',
    this.key = '',
    this.name = '',
    this.nameFile = '',
    this.numberOfPages = 0,
  });

  factory Topic.fromJson(json) {
    return Topic(
      id: json['id'] == null ? '' : json['id'].toString(),
      key: json['key'] ?? '',
      name: json['name'] ?? '',
      nameFile: json['nameFile'] ?? '',
      numberOfPages: json['numberOfPages'] ?? 0,
    );
  }
}
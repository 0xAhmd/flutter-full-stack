import 'package:hive/hive.dart';

part 'manga_model.g.dart';

@HiveType(typeId: 0)
class MangaModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String image;

  @HiveField(3)
  String author;

  @HiveField(4)
  String price;

  @HiveField(5)
  String rate;

  @HiveField(6)
  String description;

  @HiveField(7)
  String mainChar;

  @HiveField(8)
  String releaseDate;

  @HiveField(9)
  String? localImagePath;

  MangaModel({
    required this.id,
    required this.name,
    required this.image,
    required this.author,
    required this.price,
    required this.rate,
    required this.description,
    required this.mainChar,
    required this.releaseDate,
  });

  factory MangaModel.fromJson(Map<String, dynamic> json) {
    return MangaModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      author: json['author'],
      price: json['price'],
      rate: json['rate'],
      description: json['description'],
      mainChar: json['main_char'],
      releaseDate: json['release_date'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'author': author,
        'price': price,
        'rate': rate,
        'description': description,
        'main_char': mainChar,
        'release_date': releaseDate,
      };
}

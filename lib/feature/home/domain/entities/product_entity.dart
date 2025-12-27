import 'package:shopping_app/feature/home/domain/entities/category_entity.dart';

class Productentity {
  int id;
  String title;
  String slug;
  int price;
  String description;
  Catergoryentity category;
  List<String> images;

  Productentity({
    this.id = 0,
    this.title = '',
    this.slug = '',
    this.price = 0,
    this.description = '',
    this.category = const Catergoryentity(),
    this.images = const [],
  });
}

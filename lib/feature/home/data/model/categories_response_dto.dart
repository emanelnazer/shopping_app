import 'package:shopping_app/feature/home/domain/entities/category_entity.dart';

class CatergoriesResponseDto {
  int? id;
  String? name;
  String? slug;
  String? image;

  CatergoriesResponseDto({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  CatergoriesResponseDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
  Catergoryentity toEntity() => Catergoryentity(
        id: id ?? 0,
        name: name ?? '',
        slug: slug ?? '',
        image: image ?? '',
      );
}

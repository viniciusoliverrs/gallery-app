import '../../domain/entities/image_entity.dart';

class ImageAdapter {
  static ImageEntity fromJson(Map<String, dynamic> map) {
    return ImageEntity(
      id: map['id'] ?? 0,
      photographer: map['photographer'] ?? "",
      description: map['alt'] ?? "",
      imageMedium: map["src"]?['medium'] ?? "",
      imageOriginal: map["src"]?['original'] ?? "",
    );
  }
}

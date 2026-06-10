import '../../domain/model/photo.dart';
import '../dto/photo_dto.dart';

extension PhotoDtoToModel on PhotoDto {
  Photo toModel() {
    return Photo(
      id: id!.toInt(),
      imageUrl: previewURL ?? '',
      userName: user ?? '',
      tags: tags ?? '',
    );
  }
}

import 'package:image_search_app/core/result.dart';
import 'package:image_search_app/domain/repository/photo_repository.dart';

import '../model/photo.dart';

class GetPhotosUseCase {
  final PhotoRepository _photoRepository;

  GetPhotosUseCase({required PhotoRepository photoRepository})
    : _photoRepository = photoRepository;


  Future<Result<List<Photo>>> execute(String query) async {
    try {
      final photos = await _photoRepository.fetchPhotos(query);
      return Result.success(photos);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

}

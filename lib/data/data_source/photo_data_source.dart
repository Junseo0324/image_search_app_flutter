
import 'package:image_search_app/data/data_source/photo_response.dart';
import 'package:image_search_app/data/dto/photo_dto.dart';

abstract interface class PhotoDataSource {
  Future<PhotoResponse> fetchPhotos(String query);
}
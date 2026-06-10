import 'dart:convert';

import 'package:image_search_app/data/data_source/photo_data_source.dart';
import 'package:image_search_app/data/dto/photo_dto.dart';
import 'package:image_search_app/data/mapper/photo_mapper.dart';
import 'package:image_search_app/domain/model/photo.dart';
import 'package:image_search_app/domain/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _dataSource;

  PhotoRepositoryImpl(this._dataSource);

  @override
  Future<List<Photo>> fetchPhotos(String query) async {
    final response = await _dataSource.fetchPhotos(query);

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch photos');
    }
    final List<Photo> photos = (jsonDecode(response.body)['hits'] as List)
    .map((e)=> PhotoDto.fromJson(e).toModel()).toList();

    return photos;
  }
}

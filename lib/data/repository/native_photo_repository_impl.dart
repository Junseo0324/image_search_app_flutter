import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:image_search_app/data/dto/photo_dto.dart';
import 'package:image_search_app/data/mapper/photo_mapper.dart';
import 'package:image_search_app/domain/model/photo.dart';
import 'package:image_search_app/domain/repository/photo_repository.dart';

class NativePhotoRepositoryImpl implements PhotoRepository {
  static const platform = MethodChannel('devhjs.com/photos');

  @override
  Future<List<Photo>> fetchPhotos(String query) async {
    final results = await platform.invokeMethod<List<Object?>>('getPhotos');

    return results
            ?.map((e) => PhotoDto.fromJson(jsonDecode(e as String)).toModel())
            .toList() ??
        [];
  }
}
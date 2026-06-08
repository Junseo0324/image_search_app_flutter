import 'package:image_search_app/domain/model/photo.dart';

import '../../domain/repository/photo_repository.dart';

class MockPhotoRepositoryImpl implements PhotoRepository {
  @override
  Future<List<Photo>> fetchPhotos(String query) async {
    await Future.delayed(Duration(seconds: 1));


    return [
      Photo(id: 1, imageUrl: 'https://picsum.photos/200/300', userName: 'user1', tags: 'tag1'),
      Photo(id: 2, imageUrl: 'https://picsum.photos/200/300', userName: 'user1', tags: 'tag1'),
    ];
  }


}

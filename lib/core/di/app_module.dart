import 'package:get_it/get_it.dart';
import 'package:image_search_app/data/repository/mock_photo_repository_impl.dart';
import 'package:image_search_app/domain/repository/photo_repository.dart';
import 'package:image_search_app/domain/use_case/get_photos_use_case.dart';
import 'package:image_search_app/presentation/list/list_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<PhotoRepository>(MockPhotoRepositoryImpl());
  getIt.registerSingleton<GetPhotosUseCase>(
    GetPhotosUseCase(photoRepository: getIt()),
  );

  getIt.registerFactory(() => ListViewModel(getPhotoUseCase: getIt()));
}

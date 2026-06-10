import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:image_search_app/data/data_source/pixabay_photo_data_source_impl.dart';
import 'package:image_search_app/data/repository/mock_photo_repository_impl.dart';
import 'package:image_search_app/data/repository/photo_repository_impl.dart';
import 'package:image_search_app/domain/repository/photo_repository.dart';
import 'package:image_search_app/domain/use_case/get_photos_use_case.dart';
import 'package:image_search_app/presentation/list/list_view_model.dart';

final getIt = GetIt.instance;

Future<void> diSetup() async {
  await dotenv.load(fileName: ".env");

  final mockRepository = MockPhotoRepositoryImpl();
  final realRepository = PhotoRepositoryImpl(
      PixabayPhotoDataSourceImpl(apiKey: dotenv.env['API_KEY'] ?? '')
  );

  getIt.registerSingleton<PhotoRepository>(realRepository);
  getIt.registerSingleton<GetPhotosUseCase>(
    GetPhotosUseCase(photoRepository: getIt()),
  );

  getIt.registerFactory(() => ListViewModel(getPhotoUseCase: getIt()));
}

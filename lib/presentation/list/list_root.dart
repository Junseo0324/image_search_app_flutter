import 'package:flutter/material.dart';
import 'package:image_search_app/presentation/list/list_screen.dart';
import 'package:image_search_app/presentation/list/list_view_model.dart';
import '../../data/repository/mock_photo_repository_impl.dart';
import '../../domain/use_case/get_photos_use_case.dart';


void main() {
  runApp(
      MaterialApp(
        home: ListRoot(
          viewModel: ListViewModel(
            getPhotoUseCase: GetPhotosUseCase(
              photoRepository: MockPhotoRepositoryImpl(),
            ),
          ),
        ),
      )
  );
}

class ListRoot extends StatelessWidget {
  final ListViewModel viewModel;

  const ListRoot({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, widget) {
        final state = viewModel.state;
        return ListScreen(state: state, onAction: viewModel.onAction);
      },
    );
  }
}

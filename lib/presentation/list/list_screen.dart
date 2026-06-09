// Stateless 로 만드는게기본

import 'package:flutter/material.dart';
import 'package:image_search_app/data/repository/mock_photo_repository_impl.dart';
import 'package:image_search_app/presentation/list/list_action.dart';
import 'package:image_search_app/presentation/list/list_state.dart';
import '../components/photo_item.dart';

void main() async {
  final photos = await MockPhotoRepositoryImpl().fetchPhotos('query');
  runApp(
    MaterialApp(
      home: ListScreen(
        state: ListState(photos: photos),
        onAction: (ListAction action) {
          print(action);
        },
      ),
    ),
  );
}

class ListScreen extends StatelessWidget {
  final ListState state;
  final void Function(ListAction) onAction;

  const ListScreen({super.key, required this.state, required this.onAction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('이미지 검색')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                onAction(ListAction.onChangeQuery(value));
              },
              decoration: InputDecoration(
                hintText: '검색어를 입력하세요',
                suffixIcon: IconButton(
                  onPressed: () {
                    onAction(ListAction.onClickSearch());
                  },
                  icon: const Icon(Icons.search),
                ),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: state.photos.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                final photo = state.photos[index];
                return GestureDetector(
                  child: PhotoItem(photo: photo),
                  onTap: () {
                    onAction(ListAction.onClickPhotoItem(photo.id));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

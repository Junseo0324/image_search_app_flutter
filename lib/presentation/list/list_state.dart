import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_search_app/domain/model/photo.dart';

part 'list_state.freezed.dart';

@freezed
class ListState with _$ListState {
  final List<Photo> photos;
  final String query;
  final bool isLoading;

  const ListState({
    this.photos = const [],
    this.query = '',
    this.isLoading = false,
  });
}

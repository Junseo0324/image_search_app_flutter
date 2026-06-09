import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_action.freezed.dart';

@freezed
sealed class ListAction with _$ListAction {
  const factory ListAction.onChangeQuery(String query) = OnChangeQuery;
  const factory ListAction.onClickSearch() = OnClickSearchIcon;
  const factory ListAction.onClickPhotoItem(int id) = OnClickPhotoItem;
}
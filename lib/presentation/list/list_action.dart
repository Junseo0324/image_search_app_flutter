import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_action.freezed.dart';

@freezed
sealed class ListAction with _$ListAction {
  const factory ListAction.onChangeQuery() = OnChangeQuery;
  const factory ListAction.onClickSearch(String query) = OnClickSearchIcon;
  const factory ListAction.onClickPhotoItem() = OnClickPhotoItem;
}
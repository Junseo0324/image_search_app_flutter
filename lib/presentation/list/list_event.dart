import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_event.freezed.dart';

@freezed
sealed class ListEvent with _$ListEvent {
  const factory ListEvent.showSnackbar(String message) = ShowSnackbar;
}
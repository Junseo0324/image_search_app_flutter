import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_search_app/core/result.dart';
import 'package:image_search_app/domain/model/photo.dart';
import 'package:image_search_app/domain/use_case/get_photos_use_case.dart';
import 'package:image_search_app/presentation/list/list_action.dart';
import 'package:image_search_app/presentation/list/list_event.dart';
import 'package:image_search_app/presentation/list/list_state.dart';

class ListViewModel extends ChangeNotifier {
  final GetPhotosUseCase _getPhotosUseCase;

  ListState _state = const ListState();
  ListState get state => _state;

  final _eventController = StreamController<ListEvent>();
  Stream<ListEvent> get eventStream => _eventController.stream;


  ListViewModel({required GetPhotosUseCase getPhotoUseCase})
    : _getPhotosUseCase = getPhotoUseCase;

  Future<void> onAction(ListAction action) async {
    switch (action) {
      case OnChangeQuery():
        _state = state.copyWith(query: action.query);
        notifyListeners();
      case OnClickSearchIcon():
        _state = state.copyWith(isLoading: true);
        notifyListeners();

        final result = await _getPhotosUseCase.execute(state.query);
        switch (result) {
          case Success<List<Photo>>():
            _state = state.copyWith(photos: result.data, isLoading: false);
            notifyListeners();
          case Error<List<Photo>>():
            _eventController.add(ListEvent.showSnackbar('뭔가 에러'));
        }
      case OnClickPhotoItem():
        print(action.id);
    }
  }
}

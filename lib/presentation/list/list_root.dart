import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_search_app/presentation/list/list_action.dart';
import 'package:image_search_app/presentation/list/list_event.dart';
import 'package:image_search_app/presentation/list/list_screen.dart';
import 'package:image_search_app/presentation/list/list_view_model.dart';

class ListRoot extends StatefulWidget {
  final ListViewModel viewModel;
  final void Function(int id)? onClickPhotoItem;

  const ListRoot({
    super.key,
    required this.viewModel,
    required this.onClickPhotoItem,
  });

  @override
  State<ListRoot> createState() => _ListRootState();
}

class _ListRootState extends State<ListRoot> {
  StreamSubscription? _subscription;
  @override
  void initState() {
    super.initState();

    // 1번 실행
    _subscription = widget.viewModel.eventStream.listen((event) {
      switch (event) {
        case ShowSnackbar():
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(event.message),
                duration: Duration(seconds: 2),
              ),
            );
          }
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        final state = widget.viewModel.state;
        return ListScreen(
          state: state,
          onAction: (action) {
            if (action is OnClickPhotoItem) {
              widget.onClickPhotoItem?.call(action.id);
            }
            widget.viewModel.onAction(action);
          },
        );
      },
    );
  }
}

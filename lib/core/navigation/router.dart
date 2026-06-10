import 'package:go_router/go_router.dart';
import 'package:image_search_app/core/di/app_module.dart';
import 'package:image_search_app/presentation/detail/detail_screen.dart';
import 'package:image_search_app/presentation/list/list_root.dart';

final router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) =>
              ListRoot(
                  viewModel: getIt(),
                  onClickPhotoItem: (int id) {
                    context.push('/detail?id=$id');
                  },
              )
      ),
      GoRoute(
          path: '/detail',
          builder: (context, state) {
            return DetailScreen(id: int.parse(state.uri.queryParameters['id']!));
          },
      ),
    ]
);
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:repo_viewer/data/model/github_repository.dart';
import 'package:repo_viewer/ui/search_repositories/search_repositories_view.dart';
import 'package:repo_viewer/ui/settings/settings_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../search_repository_detail/search_repository_detail_view.dart';

part 'app_router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
      initialLocation: '/search_repositories',
      debugLogDiagnostics: true,
      routes: $appRoutes,
      errorPageBuilder: (context, state) {
        return const MaterialPage(
            child: Scaffold(
          body: Center(
            child: Text('Page not found'),
          ),
        ));
      });
}

@TypedGoRoute<SearchRepositoriesRoute>(
  path: '/search_repositories',
  routes: [
    TypedGoRoute<SearchRepositoryDetailRoute>(
      path: 'details',
    ),
  ],
)
class SearchRepositoriesRoute extends GoRouteData {
  const SearchRepositoriesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SearchRepositoriesView();
  }
}

class SearchRepositoryDetailRoute extends GoRouteData {
  const SearchRepositoryDetailRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SearchRepositoryDetailView(
        repository: state.extra as GithubRepository);
  }
}

@TypedGoRoute<SettingsRoute>(
  path: '/settings',
)
class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsView();
  }
}

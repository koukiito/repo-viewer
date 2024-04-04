import 'package:flutter/material.dart';
import 'package:repo_viewer/data/repository/github_repositories_result_repository.dart';
import 'package:repo_viewer/data/repository/github_repositories_result_repository_impl.dart';
import 'package:repo_viewer/ui/search_repositories/search_repositories_view_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/model/github_repositories_result.dart';

part 'search_repositories_view_model.g.dart';

@riverpod
class SearchRepositoriesViewModel extends _$SearchRepositoriesViewModel {
  late final GithubRepositoriesResultRepository _repository;

  @override
  SearchRepositoriesViewState build() {
    _repository = ref.watch(githubRepositoriesResultRepositoryProvider);

    return SearchRepositoriesViewState(
      githubRepositoriesResult: AsyncData(GithubRepositoriesResult(
        totalCount: 0,
        repositories: [],
      )),
      searchController: SearchController(),
    );
  }

  void search() {
    final query = state.searchController.text;
    debugPrint('Searching Repositories for $query');
    _repository.getRepositories(query: query).then((result) {
      result.when(
        success: (GithubRepositoriesResult data) {
          state = state.copyWith(
            githubRepositoriesResult: AsyncData(data),
          );
        },
        failure: (e, stackTrace) {
          AsyncError(e, stackTrace);
        },
      );
    });
  }
}

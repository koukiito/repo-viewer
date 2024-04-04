import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/data/model/github_repositories_result.dart';

part 'search_repositories_view_state.freezed.dart';

@freezed
class SearchRepositoriesViewState with _$SearchRepositoriesViewState {
  const factory SearchRepositoriesViewState({
    required AsyncValue<GithubRepositoriesResult> githubRepositoriesResult,
    required SearchController searchController,
    required List<String> querySuggestions,
  }) = _SearchRepositoriesViewState;
}

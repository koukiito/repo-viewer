import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'github_repository.dart';

part 'github_repositories_result.freezed.dart';
part 'github_repositories_result.g.dart';

@freezed
class GithubRepositoriesResult with _$GithubRepositoriesResult {
  factory GithubRepositoriesResult({
    @JsonSerializable(explicitToJson: true)
    @JsonKey(name: 'total_count')
    int? totalCount,
    @JsonKey(name: 'incomplete_results') bool? incompleteResults,
    @JsonKey(name: 'items') List<GithubRepository>? repositories,
  }) = _GithubRepositoriesResult;

  factory GithubRepositoriesResult.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoriesResultFromJson(json);
}

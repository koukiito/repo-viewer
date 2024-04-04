import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'github_repository_owner.dart';

part 'github_repository.freezed.dart';
part 'github_repository.g.dart';

@freezed
class GithubRepository with _$GithubRepository {
  factory GithubRepository({
    @JsonSerializable(explicitToJson: true) String? name,
    @JsonKey(name: 'full_name') String? fullName,
    String? language,
    @JsonKey(name: 'stargazers_count') int? stargazersCount,
    @JsonKey(name: 'forks') int? forksCount,
    @JsonKey(name: 'open_issues_count') int? openIssuesCount,
    @JsonKey(name: 'watchers_count') int? watchersCount,
    GithubRepositoryOwner? owner,
  }) = _GithubRepository;

  factory GithubRepository.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryFromJson(json);
}

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_repository_owner.freezed.dart';
part 'github_repository_owner.g.dart';

@freezed
class GithubRepositoryOwner with _$GithubRepositoryOwner {
  factory GithubRepositoryOwner({
    int? id,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
  }) = _GithubRepositoryOwner;

  factory GithubRepositoryOwner.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryOwnerFromJson(json);
}

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:repo_viewer/data/model/github_repositories_result.dart';
import 'package:repo_viewer/data/model/github_repository.dart';
import 'package:repo_viewer/data/model/github_repository_owner.dart';

void main() {
  test(
    'from Json',
    () {
      final expected = GithubRepositoriesResult(
        totalCount: 2,
        incompleteResults: false,
        repositories: [
          GithubRepository(
            name: 'repo-name',
            fullName: 'github/repo-name',
            owner: GithubRepositoryOwner(
              id: 9919,
              avatarUrl: 'https://avatars.githubusercontent.com/u/9919?v=4',
            ),
            stargazersCount: 777,
            watchersCount: 777,
            forksCount: 10,
            language: 'Dart',
            openIssuesCount: 100,
          ),
          GithubRepository(
            name: 'repo-name2',
            fullName: 'github/repo-name2',
            owner: GithubRepositoryOwner(
              id: 9919,
              avatarUrl: 'https://avatars.githubusercontent.com/u/9919?v=4',
            ),
            stargazersCount: 777,
            watchersCount: 777,
            forksCount: 10,
            language: 'Dart',
            openIssuesCount: 100,
          ),
        ],
      );

      final actual = GithubRepositoriesResult.fromJson(jsonDecode(_json));
      expect(actual, expected);
    },
  );
}

String _json = '''
{
  "total_count": 2,
  "incomplete_results": false,
  "items": [
    {
      "id": 9999999,
      "node_id": "Node ID",
      "name": "repo-name",
      "full_name": "github/repo-name",
      "private": false,
      "owner": {
            "login": "github",
            "id": 9919,
            "avatar_url": "https://avatars.githubusercontent.com/u/9919?v=4"
      },
      "stargazers_count": 777,
      "watchers_count": 777,
      "language": "Dart",
      "open_issues_count": 100,
      "visibility": "public",
      "forks": 10,
      "open_issues": 100,
      "watchers": 777,
      "default_branch": "main",
      "score": 1.0
    },
    {
      "id": 1111111,
      "node_id": "Node ID",
      "name": "repo-name2",
      "full_name": "github/repo-name2",
      "private": false,
      "owner": {
            "login": "github",
            "id": 9919,
            "avatar_url": "https://avatars.githubusercontent.com/u/9919?v=4"
      },
      "stargazers_count": 777,
      "watchers_count": 777,
      "language": "Dart",
      "open_issues_count": 100,
      "visibility": "public",
      "forks": 10,
      "open_issues": 100,
      "watchers": 777,
      "default_branch": "main",
      "score": 1.0
    }
  ]
}
''';

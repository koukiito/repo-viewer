import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:repo_viewer/data/model/github_repositories_result.dart';
import 'package:repo_viewer/data/model/result.dart';
import 'package:repo_viewer/data/remote/github_repositories_result_data_source_impl.dart';
import 'package:repo_viewer/data/repository/github_repositories_result_repository_impl.dart';

import 'github_repositories_result_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GithubRepositoriesResultDataSourceImpl>()])
void main() async {
  test(
    'repository test (status 200)',
    () async {
      final mockDataSource = MockGithubRepositoriesResultDataSourceImpl();
      final container = ProviderContainer(overrides: [
        githubRepositoriesResultDataSourceProvider.overrideWithValue(
          mockDataSource,
        ),
      ]);
      when(mockDataSource.getRepositories(any, 1)).thenAnswer(
        (_) async => GithubRepositoriesResult.fromJson(
          jsonDecode(_responseBody),
        ),
      );
      final actual = await container
          .read(githubRepositoriesResultRepositoryProvider)
          .getRepositories(query: 'tetris+language:assembly');
      final expected = Result.success(GithubRepositoriesResult.fromJson(
        jsonDecode(_responseBody),
      ));
      expect(actual, expected);
    },
  );
}

String _responseBody = '''
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

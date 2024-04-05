import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:repo_viewer/data/model/github_repositories_result.dart';
import 'package:repo_viewer/data/remote/github_repositories_result_data_source_impl.dart';

import 'github_repositories_result_data_source_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
void main() async {
  test(
    'api test (status 200)',
    () async {
      final mockClient = MockClient();
      final container = ProviderContainer(overrides: [
        httpProvider.overrideWithValue(
          mockClient,
        ),
      ]);
      when(mockClient.get(any)).thenAnswer(
        (_) async => http.Response(_responseBody, 200),
      );
      final actual = await container
          .read(githubRepositoriesResultDataSourceProvider)
          .getRepositories('tetris+language:assembly', 1);
      final expected = GithubRepositoriesResult.fromJson(
        jsonDecode(_responseBody),
      );
      expect(actual, expected);
    },
  );
  test('api test (status 500)', () async {
    final mockClient = MockClient();
    final container = ProviderContainer(overrides: [
      httpProvider.overrideWithValue(
        mockClient,
      ),
    ]);
    when(mockClient.get(any)).thenAnswer(
      (_) async => http.Response('Internal Server Error', 500),
    );
    expect(
      () async => await container
          .read(githubRepositoriesResultDataSourceProvider)
          .getRepositories('tetris+language:assembly', 1),
      throwsException,
    );
  });
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

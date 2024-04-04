import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:repo_viewer/data/model/github_repository_owner.dart';

void main() {
  test(
    'from Json',
    () {
      final expected = GithubRepositoryOwner(
        id: 9919,
        avatarUrl: 'https://avatars.githubusercontent.com/u/9919?v=4',
      );

      final actual = GithubRepositoryOwner.fromJson(jsonDecode(_json));
      expect(actual, expected);
    },
  );
}

String _json = '''
{
  "login": "github",
  "id": 9919,
  "avatar_url": "https://avatars.githubusercontent.com/u/9919?v=4"
}
''';

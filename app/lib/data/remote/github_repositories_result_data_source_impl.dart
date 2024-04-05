import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

import '../model/github_repositories_result.dart';
import 'github_repositories_result_data_source.dart';

final githubRepositoriesResultDataSourceProvider =
    Provider((ref) => GithubRepositoriesResultDataSourceImpl(ref));

final httpProvider = Provider((ref) => http.Client());

class GithubRepositoriesResultDataSourceImpl
    implements GithubRepositoriesResultDataSource {
  final Ref ref;
  static const String _endpoint = 'https://api.github.com/search/repositories';
  late final http.Client client = ref.watch(httpProvider);

  GithubRepositoriesResultDataSourceImpl(this.ref);

  @override
  Future<GithubRepositoriesResult> getRepositories(
      String query, int page) async {
    final http.Client client = ref.watch(httpProvider);
    final response = await client.get(
      Uri.parse('$_endpoint?q=$query&page=$page'),
    );

    switch (response.statusCode) {
      case 200:
        return GithubRepositoriesResult.fromJson(
          jsonDecode(response.body),
        );
      default:
        throw Exception(
            'Invalid HTTP Status Code (${response.statusCode}). Failed to fetch repositories from Github API.');
    }
  }
}

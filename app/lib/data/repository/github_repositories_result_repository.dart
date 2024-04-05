import 'package:repo_viewer/data/model/result.dart';

import '../model/github_repositories_result.dart';

abstract class GithubRepositoriesResultRepository {
  Future<Result<GithubRepositoriesResult>> getRepositories(
      {required String query, int page});
}

import '../model/github_repositories_result.dart';

abstract class GithubRepositoriesResultDataSource {
  GithubRepositoriesResultDataSource();
  Future<GithubRepositoriesResult> getRepositories(String query, int page);
}

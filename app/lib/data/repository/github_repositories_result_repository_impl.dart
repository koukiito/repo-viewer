import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/github_repositories_result.dart';
import '../model/result.dart';
import '../remote/github_repositories_result_data_source.dart';
import '../remote/github_repositories_result_data_source_impl.dart';
import 'github_repositories_result_repository.dart';

final githubRepositoriesResultRepositoryProvider =
    Provider<GithubRepositoriesResultRepository>((ref) {
  final dataSource = ref.watch(githubRepositoriesResultDataSourceProvider);
  return GithubRepositoriesResultRepositoryImpl(dataSource: dataSource);
});

class GithubRepositoriesResultRepositoryImpl
    implements GithubRepositoriesResultRepository {
  final GithubRepositoriesResultDataSource dataSource;

  GithubRepositoriesResultRepositoryImpl({required this.dataSource});

  @override
  Future<Result<GithubRepositoriesResult>> getRepositories(
      {required String query, int page = 1}) async {
    try {
      final result = await dataSource.getRepositories(query, page);
      return Result.success(result);
    } on Exception catch (exception, stackTrace) {
      return Result.failure(exception, stackTrace);
    }
  }
}

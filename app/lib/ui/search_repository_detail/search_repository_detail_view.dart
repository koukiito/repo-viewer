import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/model/github_repository.dart';

class SearchRepositoryDetailView extends HookConsumerWidget {
  final GithubRepository repository;
  const SearchRepositoryDetailView({required this.repository, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repoName = repository.fullName ?? 'No name';
    final language = repository.language ?? 'No language';
    final starCount = repository.stargazersCount ?? 0;
    final forkCount = repository.forksCount ?? 0;
    final issueCount = repository.openIssuesCount ?? 0;
    final watchersCount = repository.watchersCount ?? 0;
    final ownerUrl = repository.owner?.avatarUrl ?? 'No url';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Repository Detail'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                //circled owner avatar
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(ownerUrl),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(repoName),
                ),
                //language
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                  child: Text(language),
                ),
                //Counts Row
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text('Stars'),
                          Text(starCount.toString()),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('Watchers'),
                          Text(watchersCount.toString()),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('Forks'),
                          Text(forkCount.toString()),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('Issues'),
                          Text(issueCount.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

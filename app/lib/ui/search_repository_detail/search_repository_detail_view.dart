import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../data/model/github_repository.dart';

class SearchRepositoryDetailView extends HookConsumerWidget {
  final GithubRepository repository;
  const SearchRepositoryDetailView({required this.repository, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repoName = repository.fullName ?? L10n.of(context)!.repository_name_not_found;
    final language = repository.language ?? L10n.of(context)!.repository_language_not_found;
    final starCount = repository.stargazersCount ?? 0;
    final forkCount = repository.forksCount ?? 0;
    final issueCount = repository.openIssuesCount ?? 0;
    final watchersCount = repository.watchersCount ?? 0;
    final ownerUrl = repository.owner?.avatarUrl ?? L10n.of(context)!.repository_avatar_url_not_found;

    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context)!.search_repository_detail),
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
                          Text(L10n.of(context)!.repository_stars),
                          Text(starCount.toString()),
                        ],
                      ),
                      Column(
                        children: [
                          Text(L10n.of(context)!.repository_watchers),
                          Text(watchersCount.toString()),
                        ],
                      ),
                      Column(
                        children: [
                          Text(L10n.of(context)!.repository_forks),
                          Text(forkCount.toString()),
                        ],
                      ),
                      Column(
                        children: [
                          Text(L10n.of(context)!.repository_issues),
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

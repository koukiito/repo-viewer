import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/ui/search_repositories/search_repositories_view_model.dart';

class SearchRepositoriesView extends HookConsumerWidget {
  const SearchRepositoriesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchRepositoriesViewModelProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Search Repositories'),
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchAnchor(
                      searchController: state.searchController,
                      builder:
                          (BuildContext context, SearchController controller) {
                        return SearchBar(
                          controller: controller,
                          padding: const MaterialStatePropertyAll<EdgeInsets>(
                              EdgeInsets.symmetric(horizontal: 16.0)),
                          onSubmitted: (_) {
                            debugPrint('Submitted');
                            ref
                                .read(searchRepositoriesViewModelProvider
                                    .notifier)
                                .search();
                          },
                          onTap: () {
                            controller.openView();
                          },
                          trailing: [
                            IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: () {
                                // onSubmitted is not called when the search button is pressed
                                debugPrint('Submitted');
                                ref
                                    .read(searchRepositoriesViewModelProvider
                                        .notifier)
                                    .search();
                              },
                            )
                          ],
                        );
                      },
                      suggestionsBuilder:
                          (BuildContext context, SearchController controller) {
                        return List<ListTile>.generate(
                            state.querySuggestions.length, (int index) {
                          final String item = state.querySuggestions[index];
                          return ListTile(
                            title: Text(item),
                            onTap: () {
                              debugPrint('Tapped on $item');
                            },
                          );
                        });
                      }),
                ),
                Expanded(
                  child: state.githubRepositoriesResult.when(
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (error, stackTrace) => Center(
                      child: Text('Error: $error'),
                    ),
                    data: (data) {
                      return ListView.builder(
                        itemCount: data.repositories?.length ?? 0,
                        itemBuilder: (context, index) {
                          final item = data.repositories?[index];
                          return ListTile(
                            title: Text(item?.fullName ?? ''),
                            subtitle: Text(item?.language ?? ''),
                            onTap: () {
                              context.push(
                                '/search_repositories/details',
                                extra: item,
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

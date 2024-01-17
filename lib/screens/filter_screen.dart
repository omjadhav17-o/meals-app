import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/filter_provider.dart';

class FilteredScreen extends ConsumerWidget {
  const FilteredScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //we use watch so that the when the (state) is changed the build function is (reexcutted)
    final ActiveFilters = ref.watch(filtersmealsprovider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: ActiveFilters[Filter.glutinefree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersmealsprovider.notifier)
                  .setfilter(Filter.glutinefree, isChecked);
            },
            title: Text(
              'glutine free',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'only glutine free meals',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
          SwitchListTile(
            value: ActiveFilters[Filter.lactosefree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersmealsprovider.notifier)
                  .setfilter(Filter.lactosefree, isChecked);
            },
            title: Text(
              'lactose free',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'only lactose free meals',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
          SwitchListTile(
            value: ActiveFilters[Filter.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersmealsprovider.notifier)
                  .setfilter(Filter.vegan, isChecked);
            },
            title: Text(
              'vegan only',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'only vegan  meals',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
          SwitchListTile(
            value: ActiveFilters[Filter.vegetarin]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersmealsprovider.notifier)
                  .setfilter(Filter.vegetarin, isChecked);
            },
            title: Text(
              'vegetarin food',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'include meals for vegetarin',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

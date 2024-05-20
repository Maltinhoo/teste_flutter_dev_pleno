import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:teste_dev_pleno/core/locator/service_locator.dart';
import 'package:teste_dev_pleno/core/storage/app_storage.dart';
import 'package:teste_dev_pleno/modules/home/domain/entities/person_entity.dart';
import 'package:teste_dev_pleno/modules/home/presenter/cubit/home/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem vindo!'),
        centerTitle: true,
        leading: const SizedBox(),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.of(context).pop();
              ServiceLocator.locator<AppStorage>().clear();
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (_) => ServiceLocator.locator<HomeCubit>()..init(),
        child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              final cubit = BlocProvider.of<HomeCubit>(context);
              return RefreshIndicator(
                onRefresh: () => cubit.refresh(),
                child: PagedListView<int, PersonEntity>.separated(
                  pagingController: cubit.pagingController,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 24),
                  builderDelegate: PagedChildBuilderDelegate(
                    noItemsFoundIndicatorBuilder: (context) => const SizedBox(),
                    firstPageProgressIndicatorBuilder: (context) =>
                        const Center(child: CircularProgressIndicator()),
                    itemBuilder: (context, person, index) => Column(
                      children: [
                        Text('Nome: ${person.name}'),
                        Text('Gênero: ${person.gender}'),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/api/dio_consumer.dart';
import '../../data/repo.dart';
import '../breed_cubit/breed_cubit.dart';
import '../breed_cubit/breed_state.dart';

class CubitTest extends StatelessWidget {
  CubitTest({super.key});
  final dioConsumer = DioConsumer(dio: Dio());
  late final breedRepo = BreedRepository(dioConsumer);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cat Breeds')),
      body: BlocProvider(
        create: (_) => BreedCubit(breedRepo),
        child: BlocBuilder<BreedCubit, BreedState>(
          builder: (context, state) {
            if (state is BreedLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BreedLoaded) {
              return ListView.builder(
                itemCount: state.breeds.length,
                itemBuilder: (context, index) {
                  final breed = state.breeds[index];
                  return Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: breed.referenceImageId != null
                          ? Container(
                              width: 112,
                              height: 112,
                              decoration: BoxDecoration(
                                color: Color(0xffE1F8F9),
                              ),
                              child: Image.network(
                                'https://cdn2.thecatapi.com/images/${breed.referenceImageId}.jpg',
                                width: 112,
                                height: 112,
                                fit: BoxFit.fitHeight,
                              ),
                            )
                          : const Icon(Icons.pets),
                      title: Text(breed.name),
                      subtitle: Text(
                        '${breed.origin}\n${breed.temperament}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      isThreeLine: true,
                    ),
                  );
                },
              );
            } else if (state is BreedError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return Center(
              child: ElevatedButton(
                onPressed: () => context.read<BreedCubit>().fetchBreeds(),
                child: const Text('Load Breeds'),
              ),
            );
          },
        ),
      ),
    );
  }
}

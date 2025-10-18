import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/api/dio_consumer.dart';
import '../../data/repo.dart';
import '../breed_cubit/breed_cubit.dart';
import '../breed_cubit/breed_state.dart';
import '../widgets/breed_widget.dart';
import '../widgets/search_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchTextController = TextEditingController();
  late final DioConsumer dioConsumer;
  late final BreedRepository breedRepo;

  @override
  void initState() {
    super.initState();
    dioConsumer = DioConsumer(dio: Dio());
    breedRepo = BreedRepository(dioConsumer);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BreedCubit(breedRepo)..fetchBreeds(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Find Your Forever Pet',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          actions: const [
            IconButton(
              onPressed: null,
              icon: Icon(Icons.notifications_none_outlined, size: 24),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            searchSection(searchTextController: searchTextController),
            const SizedBox(height: 14),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Categories',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<BreedCubit, BreedState>(
                builder: (context, state) {
                  if (state is BreedLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is BreedLoaded) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: ListView.builder(
                        itemCount: state.breeds.length,
                        itemBuilder: (context, i) =>
                            BreedCard(breed: state.breeds[i]),
                      ),
                    );
                  } else if (state is BreedError) {
                    return Center(child: Text('Error: ${state.message}'));
                  }
                  // initial or fallback
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

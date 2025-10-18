import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo.dart';
import 'breed_state.dart';

class BreedCubit extends Cubit<BreedState> {
  final BreedRepository repository;

  BreedCubit(this.repository) : super(BreedInitial());

  Future<void> fetchBreeds() async {
    emit(BreedLoading());
    try {
      final breeds = await repository.getBreeds();
      emit(BreedLoaded(breeds));
    } catch (e) {
      emit(BreedError(e.toString()));
    }
  }
}

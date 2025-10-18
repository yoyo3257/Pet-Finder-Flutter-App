import '../../data/models/cat_breed.dart';

abstract class BreedState {}

class BreedInitial extends BreedState {}

class BreedLoading extends BreedState {}

class BreedLoaded extends BreedState {
  final List<CatBreed> breeds;
  BreedLoaded(this.breeds);
}

class BreedError extends BreedState {
  final String message;
  BreedError(this.message);
}

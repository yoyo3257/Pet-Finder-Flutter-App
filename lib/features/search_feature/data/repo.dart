import 'package:pet_finder_app/core/api/api_consumer.dart';
import 'package:pet_finder_app/core/api/endpoints.dart';
import 'models/cat_breed.dart';

class BreedRepository {
  final ApiConsumer api;

  BreedRepository(this.api);

  Future<List<CatBreed>> getBreeds({int limit = 10, int page = 0}) async {
    final data = await api.get(
      EndPoints.breeds,
      queryParameters: {'limit': limit, 'page': page},
    );

    return (data as List).map((e) => CatBreed.fromJson(e)).toList();
  }
}

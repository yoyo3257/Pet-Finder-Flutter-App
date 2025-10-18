import 'package:flutter/material.dart';
import '../../data/models/cat_breed.dart';

class BreedCard extends StatelessWidget {
  final CatBreed breed;

  const BreedCard({required this.breed, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: breed.referenceImageId != null
            ? Container(
                decoration: BoxDecoration(color: Color(0xffE1F8F9)),
                child: Image.network(
                  'https://cdn2.thecatapi.com/images/${breed.referenceImageId}.jpg',
                  width: 112,
                  height: 112,
                  fit: BoxFit.fitHeight,
                ),
              )
            : const Icon(Icons.pets),
        title: Text(breed.name),
        subtitle: Text('${breed.origin}\n${breed.temperament}'),
        trailing: Icon(Icons.favorite_border),
      ),
    );
  }
}

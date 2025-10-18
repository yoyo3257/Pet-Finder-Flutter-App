class CatBreed {
  final String name;
  final String description;
  final String temperament;
  final String origin;
  final String? referenceImageId;
  final String? wikipediaUrl;
  final String lifeSpan;

  CatBreed({
    required this.name,
    required this.description,
    required this.temperament,
    required this.origin,
    this.referenceImageId,
    this.wikipediaUrl,
    required this.lifeSpan,
  });

  factory CatBreed.fromJson(Map<String, dynamic> json) {
    return CatBreed(
      name: json['name'] ?? 'Unknown',
      description: json['description'] ?? 'No description available',
      temperament: json['temperament'] ?? 'Unknown',
      origin: json['origin'] ?? 'Unknown',
      referenceImageId: json['reference_image_id'],
      wikipediaUrl: json['wikipedia_url'],
      lifeSpan: json['life_span'] ?? 'N/A',
    );
  }

  @override
  String toString() => 'CatBreed($name)';
}

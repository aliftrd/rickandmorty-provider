class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  static Character placeholder() => Character(
    id: 0,
    name: 'Unknown',
    status: 'Unknown',
    species: 'Unknown',
    type: 'Unknown',
    gender: 'Unknown',
    image: 'https://via.placeholder.com/150',
    episode: [],
    url: 'https://via.placeholder.com/150',
    created: 'Unknown',
  );
}

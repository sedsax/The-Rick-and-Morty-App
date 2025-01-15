class CharachtersModel {
  CharacterInfo info;
  final List<CharacterModel> results;

  CharachtersModel({required this.info, required this.results});

  factory CharachtersModel.fromJson(Map<String, dynamic> json) { 
    final info = CharacterInfo.fromJson(json['info']);
    final results = (json['results'] as List)
        .map((characterJson) => CharacterModel.fromJson(characterJson))
        .toList();

    return CharachtersModel(info: info, results: results); 
  }
}

class CharacterInfo {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  CharacterInfo(
      {required this.count,
      required this.pages,
      required this.next,
      required this.prev});

  CharacterInfo.fromJson(Map<String, dynamic> json)
      : count = json['count'],
        pages = json['pages'],
        next = json['next'],
        prev = json['prev'];
}

class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String? image;
  final Location location;
  final Origin origin;
  final List<String> episodes;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    this.image,
    required this.origin,
    required this.location,
    required this.episodes,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      status: json['status'] ?? '',
      species: json['species'] ?? '',
      gender: json['gender'] ?? '',
      image: json['image'], // Varsayılan resim URL'si
      origin: Origin.fromJson(json['origin'] ?? {}),
      location: Location.fromJson(json['location'] ?? {}),
      episodes: List<String>.from(json['episode'] ?? []),
    );
  }
}

class Location {
  final String name;
  final String url;

  Location({required this.name, required this.url});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'] ?? '',
      url: json['url'] ?? '',
    );
  }
}

class Origin {
  final String name;
  final String url;

  Origin({required this.name, required this.url});

  factory Origin.fromJson(Map<String, dynamic> json) {
    return Origin(
      name: json['name'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
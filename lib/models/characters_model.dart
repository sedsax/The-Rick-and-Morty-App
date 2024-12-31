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

/*
  factory CharacterInfo.fromJson(Map<String, dynamic> json) {
    return CharacterInfo(
      count: json['count'],
      pages: json['pages'],
      next: json['next'],
      prev: json['prev'],
    );
  }
*/

class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;
  final Location location;
  final Origin origin;
  final List<String> episodes;

  CharacterModel(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.gender,
      required this.image,
      required this.origin,
      required this.location,
      required this.episodes});

  CharacterModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        status = json['status'],
        species = json['species'],
        gender = json['gender'],
        image = json['image'],
        origin = Origin(name: json['origin']['name'], url: json['origin']['url']),
        location = Location(
            name: json['location']['name'], url: json['location']['url']),
        episodes = List<String>.from(json['episode']);
}

class Location {
  final String name;
  final String url;

  Location({required this.name, required this.url});

  Location.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        url = json['url'];
}

class Origin {
  final String name;
  final String url;

  Origin({required this.name, required this.url});

  Origin.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        url = json['url'];
}

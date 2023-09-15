class FilmsDetailModel {
  String? sTypename;
  AllFilms? allFilms;

  FilmsDetailModel({this.sTypename, this.allFilms});

  FilmsDetailModel.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    allFilms = json['allFilms'] != null ? AllFilms.fromJson(json['allFilms']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['__typename'] = sTypename;
    if (allFilms != null) {
      data['allFilms'] = allFilms!.toJson();
    }
    return data;
  }
}

class AllFilms {
  String? sTypename;
  List<Films>? films;

  AllFilms({this.sTypename, this.films});

  AllFilms.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    if (json['films'] != null) {
      films = <Films>[];
      json['films'].forEach((v) {
        films!.add(Films.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['__typename'] = sTypename;
    if (films != null) {
      data['films'] = films!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Films {
  String? sTypename;
  String? title;
  String? director;
  String? releaseDate;
  SpeciesConnection? speciesConnection;

  Films({this.sTypename, this.title, this.director, this.releaseDate, this.speciesConnection});

  Films.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    title = json['title'];
    director = json['director'];
    releaseDate = json['releaseDate'];
    speciesConnection =
        json['speciesConnection'] != null ? SpeciesConnection.fromJson(json['speciesConnection']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['__typename'] = sTypename;
    data['title'] = title;
    data['director'] = director;
    data['releaseDate'] = releaseDate;
    if (speciesConnection != null) {
      data['speciesConnection'] = speciesConnection!.toJson();
    }
    return data;
  }
}

class SpeciesConnection {
  String? sTypename;
  List<Species>? species;

  SpeciesConnection({this.sTypename, this.species});

  SpeciesConnection.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    if (json['species'] != null) {
      species = <Species>[];
      json['species'].forEach((v) {
        species!.add(Species.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['__typename'] = sTypename;
    if (species != null) {
      data['species'] = species!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Species {
  String? sTypename;
  List<String>? eyeColors;
  String? name;

  Species({this.sTypename, this.eyeColors, this.name});

  Species.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    eyeColors = json['eyeColors'].cast<String>();
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['__typename'] = sTypename;
    data['eyeColors'] = eyeColors;
    data['name'] = name;
    return data;
  }
}

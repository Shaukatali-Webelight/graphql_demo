class FilmsDetailModel {
  String? sTypename;
  AllFilms? allFilms;

  FilmsDetailModel({this.sTypename, this.allFilms});

  FilmsDetailModel.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    allFilms = json['allFilms'] != null ? new AllFilms.fromJson(json['allFilms']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    if (this.allFilms != null) {
      data['allFilms'] = this.allFilms!.toJson();
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
        films!.add(new Films.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    if (this.films != null) {
      data['films'] = this.films!.map((v) => v.toJson()).toList();
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
        json['speciesConnection'] != null ? new SpeciesConnection.fromJson(json['speciesConnection']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    data['title'] = this.title;
    data['director'] = this.director;
    data['releaseDate'] = this.releaseDate;
    if (this.speciesConnection != null) {
      data['speciesConnection'] = this.speciesConnection!.toJson();
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
        species!.add(new Species.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    if (this.species != null) {
      data['species'] = this.species!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    data['eyeColors'] = this.eyeColors;
    data['name'] = this.name;
    return data;
  }
}

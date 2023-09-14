class GQLQuery {
  static String getFilms() {
    return r"""
       query Query {
  allFilms {
    films {
      title
      director
      releaseDate
      speciesConnection {
        species {
          eyeColors
          name
        }
      }
    }
  }
}
     """;
  }
}

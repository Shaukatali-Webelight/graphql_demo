import 'package:graphql_flutter/graphql_flutter.dart';

class GQLClient{

  static HttpLink _httplink = HttpLink('https://swapi-graphql.netlify.app/.netlify/functions/index');
     static GraphQLClient client = 
      GraphQLClient(
        link: _httplink,
        cache: GraphQLCache(),
      );
    
}


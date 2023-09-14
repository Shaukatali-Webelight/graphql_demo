import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MutationsClient {
  static HttpLink httplink = HttpLink('https://graphqlzero.almansi.me/api');
  static GraphQLClient client = GraphQLClient(
    link: httplink,
    cache: GraphQLCache(),
  );

  static ValueNotifier<GraphQLClient> clientNotifier = ValueNotifier<GraphQLClient>(client);
}

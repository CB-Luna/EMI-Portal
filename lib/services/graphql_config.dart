import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";

const serverLink = "http://strapi-emi.cbluna-dev.com:8082";

class GraphQLConfiguration {
  static HttpLink httpLink = HttpLink(
    serverLink + '/graphql',
  );

  static ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: GraphQLCache(),
      link: httpLink,
    ),
  );

  static ValueNotifier<GraphQLClient> clientToQuery() {
    return client;
  }
}

setPath(String? path) {
  if (path != null) {
    return serverLink + path;
  } else {
    return 'https://i.stack.imgur.com/GNhx0';
  }
}

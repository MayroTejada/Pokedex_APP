import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_app/core/network/app_cofig.dart';

@module
abstract class GraphProvider {
  @singleton
  GraphQLClient graphQL(IConfig config) {
    GraphQLClient graphQLClient =
        GraphQLClient(link: HttpLink(config.baseUrl), cache: GraphQLCache());
    return graphQLClient;
  }
}

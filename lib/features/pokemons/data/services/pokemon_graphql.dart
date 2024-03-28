import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class PokemonGraphQlService {
  final GraphQLClient client;

  PokemonGraphQlService({required this.client});
}

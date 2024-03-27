import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class PokemonGraphQlService {
  final GraphQLClient client;

  static String getPokemonsQuery = '''
   query GetPokemonsByRegionIQuery {
    pokemon_species :pokemon_v2_pokemonspecies(where: {generation_id: {_eq: 1}}) {
      id
      name
    }
  }

  ''';

  PokemonGraphQlService({required this.client});
}

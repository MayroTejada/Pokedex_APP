import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class PokemonGraphQlService {
  final GraphQLClient client;

  static String getPokemonsQuery = """
   query SamplePokeAPIQuery {
  pokemon_species: pokemon_v2_pokemonspecies(
    where: {
      _or: [   # Utilizamos _or para buscar en cualquiera de las dos condiciones
        { 
          _and: [
            { pokemon_v2_generation: { name: { _eq: "generation-i" } } },
          
          ]
        },
        { 
          _and: [
            { pokemon_v2_generation: { name: { _eq: "generation-ii" } } },
          
          ]
        }
      ]
    }, 
    order_by: { id: asc }
  ) {
    name
    id
  }
}

  """;

  PokemonGraphQlService({required this.client});
}

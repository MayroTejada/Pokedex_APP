import 'package:graphql_flutter/graphql_flutter.dart';

class PokemonGraphQlService {
  static final HttpLink _httpLink =
      HttpLink('https://beta.pokeapi.co/graphql/v1beta');

  static GraphQLClient client = GraphQLClient(
    link: _httpLink,
    cache: GraphQLCache(),
  );

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
}

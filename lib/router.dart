import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_app/core/constants.dart';
import 'package:pokedex_app/features/pokemons/presentation/views/pokedex_page.dart';
import 'package:pokedex_app/features/pokemons/presentation/views/pokemon_detail_page.dart';

class Routes {
  static final GoRouter _router = GoRouter(routes: <RouteBase>[
    GoRoute(
        path: pokedexPageRoute,
        pageBuilder: (BuildContext context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const PokedexPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(
                    Tween(begin: const Offset(0.0, 1.0), end: Offset.zero)
                        .chain(CurveTween(curve: Curves.easeInOut))),
                child: child,
              );
            },
          );
        }),
    GoRoute(
        path: pokemonDetailPageRoute,
        pageBuilder: (BuildContext context, state) {
          var extra = state.extra as Map<dynamic, dynamic>;
          return CustomTransitionPage(
            key: state.pageKey,
            child: PokemonDetailPage(pokemonId: extra['pokemon_id']),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(
                    Tween(begin: const Offset(0.0, 1.0), end: Offset.zero)
                        .chain(CurveTween(curve: Curves.easeInOut))),
                child: child,
              );
            },
          );
        })
  ]);
  static GoRouter get router => _router;
}

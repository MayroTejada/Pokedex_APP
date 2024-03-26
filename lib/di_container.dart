import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_app/di_container.config.dart';

final getIt = GetIt.instance;
//Dependency injection
@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();

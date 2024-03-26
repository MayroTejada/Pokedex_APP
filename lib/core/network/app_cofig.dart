import 'package:injectable/injectable.dart';

abstract class IConfig {
  String get baseUrl;

  Map<String, String> get headers;
}

@Injectable(as: IConfig)
class AppConfig extends IConfig {
  @override
  String get baseUrl => "https://beta.pokeapi.co/graphql/v1beta";

  @override
  Map<String, String> get headers => {};
}

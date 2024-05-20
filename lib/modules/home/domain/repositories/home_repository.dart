import 'package:teste_dev_pleno/modules/home/home_imports.dart';

abstract class IHomeRepository {
  Future<List<PersonEntity>> getCharacters({required int page});
}

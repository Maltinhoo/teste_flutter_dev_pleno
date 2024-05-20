import 'dart:convert';

import 'package:teste_dev_pleno/modules/home/home_imports.dart';

class HomeRepository implements IHomeRepository {
  final IHomeDatasource datasource;

  HomeRepository(this.datasource);

  @override
  Future<List<PersonEntity>> getCharacters({required int page}) async {
    try {
      final response = await datasource.getCharacters(page: page);
      final json = jsonDecode(response);
      final results = json['results'] as List;
      return results.map((e) => PersonMapper.fromMap(e)).toList();
    } catch (e) {
      throw Exception();
    }
  }
}

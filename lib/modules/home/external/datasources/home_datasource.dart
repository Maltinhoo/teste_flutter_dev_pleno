import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:teste_dev_pleno/modules/home/infra/datasources/home_datasource.dart';

class HomeDatasourceHttp implements IHomeDatasource {
  final Dio client;

  HomeDatasourceHttp(this.client);

  @override
  Future<String> getCharacters({required int page}) async {
    try {
      final response =
          await client.get('https://swapi.dev/api/people/?page=$page');
      return jsonEncode(response.data);
    } catch (e) {
      throw Exception();
    }
  }
}

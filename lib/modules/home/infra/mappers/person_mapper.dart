import 'package:teste_dev_pleno/modules/home/home_imports.dart';

class PersonMapper {
  static PersonEntity fromMap(Map<String, dynamic> map) {
    return PersonEntity(
      name: map['name'],
      gender: map['gender'],
    );
  }
}

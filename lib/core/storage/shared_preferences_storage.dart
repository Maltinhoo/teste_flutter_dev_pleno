import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_dev_pleno/core/core.dart';

class SharedPreferencesStorage implements AppStorage {
  final SharedPreferences _storage;

  SharedPreferencesStorage(this._storage);

  @override
  Future<void> clear() async {
    await _storage.clear();
  }

  @override
  bool getIsLogged() {
    return _storage.getBool('isLogged') ?? false;
  }

  @override
  Future<void> setIsLogged() async {
    await _storage.setBool('isLogged', true);
  }
}

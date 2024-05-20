abstract class AppStorage {
  Future<void> setIsLogged();
  bool getIsLogged();

  Future<void> clear();
}

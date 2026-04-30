class SESSION {
  static final SESSION instance = SESSION._internal();
  String? _db;

  SESSION._internal();

  String? getDB() => _db;

  void setDB(String db) => _db = db;


}
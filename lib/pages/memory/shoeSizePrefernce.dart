import 'package:shared_preferences/shared_preferences.dart';

class ShoeSizePreferences {
  static const _keyShoeSize = 'shoe_size';

  Future<bool> saveShoeSize(double size) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setDouble(_keyShoeSize, size);
  }

  Future<double?> getShoeSize() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_keyShoeSize);
  }

  Future<bool> updateShoeSize(double newSize) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setDouble(_keyShoeSize, newSize);
  }

  Future<bool> deleteShoeSize() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(_keyShoeSize);
  }

  Future<bool> hasShoeSize() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_keyShoeSize);
  }
}

abstract class StorageService {
  Future<void> save<T>(String key, T value);
  Future<T?> read<T>(String key, {T Function(Map<String, dynamic>)? fromJson});
  Future<bool> remove(String key);
  Future<bool> contains(String key);
}

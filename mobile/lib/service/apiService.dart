abstract class ApiService<T> {
  Future<List<T>> getAll();
  Future<T> getById(int id);
  Future<void> create(T data);
  Future<void> update(int id, T data);
  Future<void> delete(String id);
}

abstract class Resource<T> {}

class Loading extends Resource {}

class Sussces<T> extends Resource {
  final T data;

  Sussces({required this.data});
}

class ErrorData extends Resource {
  final String message;

  ErrorData({required this.message});
}

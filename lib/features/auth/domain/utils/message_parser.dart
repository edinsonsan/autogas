class MessageParser {
  /// Convierte un [dynamic] que puede ser un [String] o una [List<String>] en un solo [String].
  static String parseMessage(dynamic data) {
    if (data == null) return '';

    if (data is List) {
      return data.whereType<String>().join(', ');
    }

    if (data is String) {
      return data;
    }

    // Si es otro tipo inesperado, lo convertimos a string directamente
    return data.toString();
  }
}

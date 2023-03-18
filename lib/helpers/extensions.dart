extension MapExtension<T, T2> on Map<T, T2> {
  Map<T2, T> get inverse {
    return map((k, v) => MapEntry(v, k));
  }
}

extension ListClone<T> on List<T> {
  List<T> clone() {
    final copy = <T>[...this];
    final List<Object?> untypedCopy = copy;
    for (var i = 0; i < untypedCopy.length; i++) {
      final element = untypedCopy[i];
      if (element is List) {
        untypedCopy[i] = element.clone();
      }
    }
    return copy;
  }
}

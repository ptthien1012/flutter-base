extension ListClone<T> on List<T> {
  List<T> clone() {
    List<T> copy = <T>[...this];
    List<Object?> untypedCopy = copy;
    for (var i = 0; i < untypedCopy.length; i++) {
      var element = untypedCopy[i];
      if (element is List) {
        untypedCopy[i] = element.clone();
      }
    }
    return copy;
  }
}

extension ListExtension<E> on List<E?> {
  void addAllUnique(Iterable<E?> iterable) {
    for (var element in iterable) {
      if (!contains(element)) {
        add(element);
      }
    }
  }
}

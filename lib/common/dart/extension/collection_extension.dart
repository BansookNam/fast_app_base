extension ListExtension<T> on List<T> {
  void swap(int origin, int target) {
    final temp1 = this[target];
    this[target] = this[origin];
    this[origin] = temp1;
  }

  Stream<T> toStream() => Stream.fromIterable(this);
}

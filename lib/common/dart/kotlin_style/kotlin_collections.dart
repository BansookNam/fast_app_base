class IndexedValue<T> {
  int index;
  T value;

  IndexedValue(this.index, this.value);

  @override
  String toString() {
    return '[$index]{$value}';
  }
}

extension $KotlinCollection<E> on Iterable<E> {
  int get lastIndex => length - 1;

  Iterable<IndexedValue<E>> withIndex() =>
      toList().asMap().entries.map((entry) => IndexedValue(entry.key, entry.value));

  Iterable<E> whereNot(bool Function(E element) test) => where((element) => !test(element));

  Iterable<T> mapIsLast<T>(T Function(E e, bool isLast) f) {
    var i = -1;

    return map((e) {
      i++;
      return f(e, i == (length - 1));
    });
  }

  Iterable<int> indexes() => withIndex().indexes();

  E? elementAtOr(int index, [E? defaultValue]) =>
      length > index && index >= 0 ? toList()[index] : defaultValue;

  E? firstOr([E? defaultValue]) => elementAtOr(0, defaultValue);

  E? lastOr([E? defaultValue]) => elementAtOr(lastIndex, defaultValue);
}

extension $KotlinIndexedValueExtension<E> on Iterable<IndexedValue<E>> {
  Iterable<int> indexes() => map((iv) => iv.index);

  Iterable<E> values() => map((iv) => iv.value);
}

extension $KotlinStyleExtension<T> on T {
  T let(void Function(T) func) {
    func(this);
    return this;
  }

  T apply(void Function() func) {
    func();
    return this;
  }

  R also<R>(R Function(T) func) {
    return func(this);
  }

  R run<R>(R Function() func) {
    return func();
  }
}

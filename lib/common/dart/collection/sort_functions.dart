typedef Sort = int Function(dynamic a, dynamic b);
typedef SortF = Sort Function(String sortField);

SortF alphabetic = (String sortField) => (a, b) {
      return a[sortField].toLowerCase().compareTo(b[sortField].toLowerCase());
    };

SortF number = (String sortField) => (dynamic a, dynamic b) {
      return a[sortField].compareTo(b[sortField]);
    };

int Function(T, T) byStringField<T>(String Function(T func) fieldProvider) => (T a, T b) {
      final fieldA = fieldProvider(a);
      final fieldB = fieldProvider(b);

      return fieldB.toLowerCase().compareTo(fieldA.toLowerCase());
    };

int Function(T, T) byDateField<T>(DateTime Function(T func) fieldProvider,
        {bool reverse = false}) =>
    (T a, T b) {
      final fieldA = fieldProvider(a);
      final fieldB = fieldProvider(b);

      return reverse ? fieldA.compareTo(fieldB) : fieldB.compareTo(fieldA);
    };

int Function(A, B) byDateFieldWithDiffTypes<A, B>(
  DateTime Function(A func) fieldAProvider,
  DateTime Function(B func) fieldBProvider, {
  bool reverse = false,
}) =>
    (A a, B b) {
      final fieldA = fieldAProvider(a);
      final fieldB = fieldBProvider(b);
      return reverse ? fieldA.compareTo(fieldB) : fieldB.compareTo(fieldA);
    };

int Function(T, T) byIntField<T>(int Function(T func) fieldProvider, {bool reverse = false}) =>
    (T a, T b) {
      final fieldA = fieldProvider(a);
      final fieldB = fieldProvider(b);
      return reverse ? fieldA.compareTo(fieldB) : fieldB.compareTo(fieldA);
    };

int Function(T, T) byDoubleField<T>(double Function(T func) fieldProvider,
        {bool reverse = false}) =>
    (T a, T b) {
      final fieldA = fieldProvider(a);
      final fieldB = fieldProvider(b);
      return reverse ? fieldA.compareTo(fieldB) : fieldB.compareTo(fieldA);
    };

int Function(T, T) byBoolField<T>(bool Function(T func) fieldProvider, {bool reverse = false}) =>
    (T a, T b) {
      final fieldA = fieldProvider(a);
      final fieldB = fieldProvider(b);
      return fieldA == fieldB
          ? 0
          : !reverse && fieldA != fieldB
              ? 1
              : -1;
    };

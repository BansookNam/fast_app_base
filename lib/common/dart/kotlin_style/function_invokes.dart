extension $FunctionP0Extension<R> on R Function() {
  R invoke() => this();
}

extension $FunctionP1Extension<R, P1> on R Function(P1) {
  R invoke(P1 p1) => this(p1);
}

extension $FunctionP2Extension<R, P1, P2> on R Function(P1, P2) {
  R invoke(P1 p1, P2 p2) => this(p1, p2);
}

extension $FunctionP3Extension<R, P1, P2, P3> on R Function(P1, P2, P3) {
  R invoke(P1 p1, P2 p2, P3 p3) => this(p1, p2, p3);
}

extension $FunctionP4Extension<R, P1, P2, P3, P4> on R Function(P1, P2, P3, P4) {
  R invoke(P1 p1, P2 p2, P3 p3, P4 p4) => this(p1, p2, p3, p4);
}

extension $FunctionP5Extension<R, P1, P2, P3, P4, P5> on R Function(P1, P2, P3, P4, P5) {
  R invoke(P1 p1, P2 p2, P3 p3, P4 p4, P5 p5) => this(p1, p2, p3, p4, p5);
}

extension $FunctionP6Extension<R, P1, P2, P3, P4, P5, P6> on R Function(P1, P2, P3, P4, P5, P6) {
  R invoke(P1 p1, P2 p2, P3 p3, P4 p4, P5 p5, P6 p6) => this(p1, p2, p3, p4, p5, p6);
}

extension $FunctionP7Extension<R, P1, P2, P3, P4, P5, P6, P7> on R Function(
    P1, P2, P3, P4, P5, P6, P7) {
  R invoke(P1 p1, P2 p2, P3 p3, P4 p4, P5 p5, P6 p6, P7 p7) => this(p1, p2, p3, p4, p5, p6, p7);
}

extension $FunctionP8Extension<R, P1, P2, P3, P4, P5, P6, P7, P8> on R Function(
    P1, P2, P3, P4, P5, P6, P7, P8) {
  R invoke(P1 p1, P2 p2, P3 p3, P4 p4, P5 p5, P6 p6, P7 p7, P8 p8) =>
      this(p1, p2, p3, p4, p5, p6, p7, p8);
}

extension $FunctionP9Extension<R, P1, P2, P3, P4, P5, P6, P7, P8, P9> on R Function(
    P1, P2, P3, P4, P5, P6, P7, P8, P9) {
  R invoke(P1 p1, P2 p2, P3 p3, P4 p4, P5 p5, P6 p6, P7 p7, P8 p8, P9 p9) =>
      this(p1, p2, p3, p4, p5, p6, p7, p8, p9);
}

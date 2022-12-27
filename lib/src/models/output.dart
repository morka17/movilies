abstract class Output<T, E> {
  T unwrap();
  E error();
  T unwrapOrElse(Function g);
  bool hasError();
}

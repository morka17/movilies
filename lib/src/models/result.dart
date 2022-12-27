import 'output.dart';

class Result<T, E> extends Output {
  T? data;
  E? err;
  String desc;

  Result({
    this.data,
    this.err,
    this.desc = "",
  });

  @override
  bool hasError() {
    return err != null;
  }

  /// Program may panic if value of `data` is null
  /// so when using this function, ensure that value return will alway be nonnull
  ///
  @override
  T? unwrap() {
    return data;
  }

  /// if not sure of whether the return value will be noll
  @override
  unwrapOrElse(Function g) {
    g();
  }

  @override
  E? error() {
    return err;
  }
}

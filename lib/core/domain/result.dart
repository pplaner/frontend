sealed class Result<S, E> {
  const Result();

  W fold<W>(W Function(S success) onSuccess, W Function(E error) onFailure) {
    return switch (this) {
      Success(value: final s) => onSuccess(s),
      Failure(error: final e) => onFailure(e),
    };
  }

  Result<W, E> map<W>(W Function(S success) transform) {
    return switch (this) {
      Success(value: final s) => Success(transform(s)),
      Failure(error: final e) => Failure(e),
    };
  }

  S get unwrap => switch (this) {
    Success(value: final s) => s,
    Failure() => throw StateError('Attempted to unwrap a Failure.'),
  };
}

final class Success<S, E> extends Result<S, E> {
  const Success(this.value);

  final S value;
}

final class Failure<S, E> extends Result<S, E> {
  const Failure(this.error);

  final E error;
}

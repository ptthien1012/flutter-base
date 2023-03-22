enum Status {
  initial,
  loading,
  complete,
  empty,
  error;

  bool get isInitial => this == Status.initial;

  bool get isLoading => this == Status.loading;

  bool get isComplete => this == Status.complete;

  bool get isError => this == Status.error;

  bool get isEmpty => this == Status.empty;
}

class ClockStream {
  Stream<DateTime> get clockStream =>
      Stream.periodic(const Duration(seconds: 1), (_) => DateTime.now());
}
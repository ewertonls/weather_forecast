abstract class IAppException implements Exception {
  final String message;
  final StackTrace? stackTrace;
  const IAppException(this.message, [this.stackTrace]);
}

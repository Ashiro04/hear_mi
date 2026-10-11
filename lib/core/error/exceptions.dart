class MediaPermissionException implements Exception {
  final String message;
  const MediaPermissionException(this.message);

  @override
  String toString() => message;
}

import 'package:permission_handler/permission_handler.dart';

import '../error/exceptions.dart';

class MediaPermissionService {
  /// Android 13+ : Permission.audio. Android 12- : Permission.storage.
  /// On demande les deux et on accepte si l'une est accordée.
  Future<void> ensureAudioAccess() async {
    final results = await [Permission.audio, Permission.storage].request();
    final granted = results.values.any((s) => s.isGranted);
    if (granted) return;

    throw const MediaPermissionException(
      "Accès à la musique refusé. Autorise-le dans les paramètres de l'application.",
    );
  }
}

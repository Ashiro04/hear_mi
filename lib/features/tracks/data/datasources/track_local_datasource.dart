import 'package:on_audio_query/on_audio_query.dart';

import '../../../../core/permissions/media_permission_service.dart';
import '../models/track_model.dart';
import 'track_datasource.dart';

class TrackLocalDataSource implements TrackDataSource {
  final OnAudioQuery _query;
  final MediaPermissionService _permissions;
  List<TrackModel>? _cache;

  TrackLocalDataSource(this._query, this._permissions);

  @override
  Future<List<TrackModel>> getTracks() async {
    await _permissions.ensureAudioAccess();

    final songs = await _query.querySongs(
      sortType: SongSortType.TITLE,
      orderType: OrderType.ASC_OR_SMALLER,
      uriType: UriType.EXTERNAL,
      ignoreCase: true,
    );

    _cache = songs
        .where((s) => s.isMusic ?? true) // exclut sonneries, alarmes...
        .map(_toModel)
        .toList();
    return _cache!;
  }

  @override
  Future<List<TrackModel>> search(String query) async {
    final all = _cache ?? await getTracks();
    final q = query.toLowerCase();
    return all
        .where(
          (t) =>
              t.title.toLowerCase().contains(q) ||
              t.artistName.toLowerCase().contains(q),
        )
        .toList();
  }

  TrackModel _toModel(SongModel s) => TrackModel(
    id: s.id.toString(),
    title: s.title,
    artistName: _cleanArtist(s.artist),
    albumTitle: s.album,
    coverUrl: '', // pochettes locales : voir "Pour aller plus loin"
    audioUrl: s.uri ?? 'file://${s.data}',
    durationSeconds: (s.duration ?? 0) ~/ 1000,
  );

  // MediaStore renvoie "<unknown>" quand l'artiste est inconnu
  String _cleanArtist(String? artist) =>
      (artist == null || artist == '<unknown>') ? 'Artiste inconnu' : artist;
}

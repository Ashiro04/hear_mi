import '../models/track_model.dart';
import 'track_datasource.dart';

class TrackMockDataSource implements TrackDataSource {
  static const _titles = [
    'Aurora',
    'Midnight Drive',
    'Ocean Eyes',
    'Neon Lights',
    'Golden Hour',
    'Echoes',
    'Wildfire',
    'Paper Planes',
  ];

  final List<TrackModel> _tracks = List.generate(
    _titles.length,
    (i) => TrackModel(
      id: '${i + 1}',
      title: _titles[i],
      artistName: 'Artiste ${(i % 3) + 1}',
      albumTitle: 'Album démo ${(i % 2) + 1}',
      coverUrl: 'https://picsum.photos/seed/hearmi$i/300',
      audioUrl:
          'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-${i + 1}.mp3',
      durationSeconds: 200 + i * 15,
    ),
  );

  @override
  Future<List<TrackModel>> getTracks() async {
    await Future.delayed(const Duration(milliseconds: 500)); // simule le réseau
    return _tracks;
  }

  @override
  Future<List<TrackModel>> search(String query) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final q = query.toLowerCase();
    return _tracks
        .where(
          (t) =>
              t.title.toLowerCase().contains(q) ||
              t.artistName.toLowerCase().contains(q),
        )
        .toList();
  }
}

import '../../domain/entities/track.dart';

class TrackModel extends Track {
  const TrackModel({
    required super.id,
    required super.title,
    required super.artistName,
    super.albumTitle,
    required super.coverUrl,
    required super.audioUrl,
    required super.durationSeconds,
  });

  factory TrackModel.fromJson(Map<String, dynamic> json) => TrackModel(
    id: json['id'].toString(),
    title: json['title'] as String,
    artistName: json['artistName'] as String,
    albumTitle: json['albumTitle'] as String?,
    coverUrl: (json['coverUrl'] as String?) ?? '',
    audioUrl: json['audioUrl'] as String,
    durationSeconds: json['durationSeconds'] as int,
  );
}

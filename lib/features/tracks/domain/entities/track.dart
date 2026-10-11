import 'package:equatable/equatable.dart';

class Track extends Equatable {
  final String id;
  final String title;
  final String artistName;
  final String? albumTitle;
  final String coverUrl;
  final String audioUrl;
  final int durationSeconds;

  const Track({
    required this.id,
    required this.title,
    required this.artistName,
    this.albumTitle,
    required this.coverUrl,
    required this.audioUrl,
    required this.durationSeconds,
  });

  @override
  List<Object?> get props => [id];
}

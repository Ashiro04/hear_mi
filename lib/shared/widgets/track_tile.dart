import 'package:flutter/material.dart';

import '../../features/tracks/domain/entities/track.dart';
import 'cover_image.dart';

class TrackTile extends StatelessWidget {
  final Track track;
  final VoidCallback onTap;
  const TrackTile({super.key, required this.track, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CoverImage(url: track.coverUrl),
      title: Text(track.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(
        track.artistName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: onTap,
    );
  }
}

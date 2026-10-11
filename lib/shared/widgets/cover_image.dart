import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CoverImage extends StatelessWidget {
  final String url;
  final double size;
  final double radius;

  const CoverImage({
    super.key,
    required this.url,
    this.size = 48,
    this.radius = 6,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: SizedBox(
        width: size,
        height: size,
        child: url.isEmpty
            ? const ColoredBox(
                color: Colors.black12,
                child: Icon(Icons.music_note),
              )
            : CachedNetworkImage(
                imageUrl: url,
                fit: BoxFit.cover,
                errorWidget: (_, __, ___) => const Icon(Icons.broken_image),
              ),
      ),
    );
  }
}

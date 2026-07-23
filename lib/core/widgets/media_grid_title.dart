// lib/core/widgets/media_grid_tile.dart
import 'package:caza/features/messages/search/model/media_iteam_model.dart';
import 'package:flutter/material.dart';

class MediaGridTile extends StatelessWidget {
  final MediaItemModel item;
  final VoidCallback? onTap;

  const MediaGridTile({
    super.key,
    required this.item,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              item.imagePath,
              fit: BoxFit.cover,
            ),
            if (item.isVideo)
              const Center(
                child: Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 32,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
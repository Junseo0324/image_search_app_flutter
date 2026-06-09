import 'package:flutter/material.dart';

import '../../domain/model/photo.dart';

class PhotoItem extends StatelessWidget {
  final Photo photo;

  const PhotoItem({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Image.network(photo.imageUrl, fit: BoxFit.cover),
      ),
    );
  }
}

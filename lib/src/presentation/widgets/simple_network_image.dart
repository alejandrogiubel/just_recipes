import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_recipes/src/presentation/utils/extensions/widget_extension.dart';

class SimpleNetworkImage extends StatelessWidget {
  const SimpleNetworkImage({
    required this.imageUrl,
    super.key,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        errorWidget: (context, error, dynamic _) => const FaIcon(
          FontAwesomeIcons.image,
          size: 100,
          color: Colors.grey,
        ),
      ),
    ).withDominoAnimation;
  }
}

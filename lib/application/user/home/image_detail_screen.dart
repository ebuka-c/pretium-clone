import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageDetailScreen extends StatefulWidget {
  final List<String> images;
  final int initialIndex;
  const ImageDetailScreen({
    required this.images,
    required this.initialIndex,
    super.key,
  });

  @override
  State<ImageDetailScreen> createState() => _ImageDetailScreenState();
}

class _ImageDetailScreenState extends State<ImageDetailScreen> {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView.builder(
        controller: _controller,
        itemCount: widget.images.length,
        itemBuilder:
            (_, i) => Center(
              child: CachedNetworkImage(
                imageUrl: widget.images[i],
                placeholder: (_, __) => CircularProgressIndicator(),
                errorWidget: (_, __, ___) => Icon(Icons.error),
                fit: BoxFit.contain,
              ),
            ),
      ),
    );
  }
}

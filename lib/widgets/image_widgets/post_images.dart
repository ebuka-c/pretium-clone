import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretium_clone/constants/app_colors.dart';
import 'package:pretium_clone/constants/custom_textstyles.dart';

import '../../application/user/home/image_detail_screen.dart';

class PostImages extends StatelessWidget {
  const PostImages({super.key, required this.index, this.imagesList});
  final int index;
  final List<String>?
  imagesList; //postsData[index]['images'] as List<String>? ?? []

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 7.h),
        Container(
          height: 166.25.h,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: AppColors.divider2,
            border: Border.all(color: AppColors.divider2, width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: LayoutBuilder(
            builder: (ctx, constraints) {
              final images = imagesList;
              final count = images?.length;
              final spacing = 2.w;
              final maxW = constraints.maxWidth;
              final maxH = constraints.maxHeight;

              // helper to build a tappable thumbnail
              Widget buildTile({
                required String url,
                required double w,
                required double h,
                Widget? overlay,
                required VoidCallback onTap,
              }) {
                return GestureDetector(
                  onTap: onTap,
                  child: SizedBox(
                    width: w,
                    height: h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          CachedNetworkImage(imageUrl: url, fit: BoxFit.cover),
                          if (overlay != null) overlay,
                        ],
                      ),
                    ),
                  ),
                );
              }

              // single image → full size
              if (count == 1) {
                return buildTile(
                  url: images?[0] ?? '',
                  w: maxW,
                  h: maxH,
                  onTap:
                      () => Navigator.push(
                        ctx,
                        MaterialPageRoute(
                          builder:
                              (_) => ImageDetailScreen(
                                images: images ?? [],
                                initialIndex: 0,
                              ),
                        ),
                      ),
                );
              }

              if (count == 2) {
                final tileW = (maxW - spacing) / 2;
                return Row(
                  children: [
                    buildTile(
                      url: images?[0] ?? '',
                      w: tileW,
                      h: maxH,
                      onTap:
                          () => Navigator.push(
                            ctx,
                            MaterialPageRoute(
                              builder:
                                  (_) => ImageDetailScreen(
                                    images: images ?? [],
                                    initialIndex: 0,
                                  ),
                            ),
                          ),
                    ),
                    SizedBox(width: spacing),
                    buildTile(
                      url: images?[1] ?? '',
                      w: tileW,
                      h: maxH,
                      onTap:
                          () => Navigator.push(
                            ctx,
                            MaterialPageRoute(
                              builder:
                                  (_) => ImageDetailScreen(
                                    images: images ?? [],
                                    initialIndex: 1,
                                  ),
                            ),
                          ),
                    ),
                  ],
                );
              }

              if (count == 3) {
                final tileW = (maxW - spacing) / 2;
                final tileH = (maxH - spacing) / 2;
                return Column(
                  children: [
                    Row(
                      children: [
                        buildTile(
                          url: images?[0] ?? '',
                          w: tileW,
                          h: tileH,
                          onTap:
                              () => Navigator.push(
                                ctx,
                                MaterialPageRoute(
                                  builder:
                                      (_) => ImageDetailScreen(
                                        images: images ?? [],
                                        initialIndex: 0,
                                      ),
                                ),
                              ),
                        ),
                        SizedBox(width: spacing),
                        buildTile(
                          url: images?[1] ?? '',
                          w: tileW,
                          h: tileH,
                          onTap:
                              () => Navigator.push(
                                ctx,
                                MaterialPageRoute(
                                  builder:
                                      (_) => ImageDetailScreen(
                                        images: images ?? [],
                                        initialIndex: 1,
                                      ),
                                ),
                              ),
                        ),
                      ],
                    ),
                    SizedBox(height: spacing),
                    buildTile(
                      url: images?[2] ?? '',
                      w: maxW,
                      h: tileH,
                      onTap:
                          () => Navigator.push(
                            ctx,
                            MaterialPageRoute(
                              builder:
                                  (_) => ImageDetailScreen(
                                    images: images ?? [],
                                    initialIndex: 2,
                                  ),
                            ),
                          ),
                    ),
                  ],
                );
              }

              // 4+ images → first 3 images + a 4th “more” tile
              const cols = 2, rows = 2;
              final totalHSpacing = (cols - 1) * spacing;
              final totalVSpacing = (rows - 1) * spacing;
              final tileW = (maxW - totalHSpacing) / cols;
              final tileH = (maxH - totalVSpacing) / rows;

              final tileCount = (count ?? 0) > 4 ? 4 : count;

              final extra = (count ?? 0) - 4;
              final radius = Radius.circular(16);
              // for the inner corners you might want a smaller radius, or zero
              final innerRadius = Radius.zero;

              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: List.generate(tileCount ?? 0, (i) {
                  // compute a BorderRadius depending on `i`
                  BorderRadius tileRadius;
                  switch (i) {
                    case 0:
                      // top-left
                      tileRadius = BorderRadius.only(
                        topLeft: radius,
                        topRight: innerRadius,
                        bottomLeft: innerRadius,
                        bottomRight: innerRadius,
                      );
                      break;
                    case 1:
                      // top-right
                      tileRadius = BorderRadius.only(
                        topLeft: innerRadius,
                        topRight: radius,
                        bottomLeft: innerRadius,
                        bottomRight: innerRadius,
                      );
                      break;
                    case 2:
                      // bottom-left
                      tileRadius = BorderRadius.only(
                        topLeft: innerRadius,
                        topRight: innerRadius,
                        bottomLeft: radius,
                        bottomRight: innerRadius,
                      );
                      break;
                    case 3:
                    default:
                      // bottom-right
                      tileRadius = BorderRadius.only(
                        topLeft: innerRadius,
                        topRight: innerRadius,
                        bottomLeft: innerRadius,
                        bottomRight: radius,
                      );
                      break;
                  }

                  final showOverlay = (i == 3 && extra > 0);

                  return GestureDetector(
                    onTap:
                        () => Navigator.push(
                          ctx,
                          MaterialPageRoute(
                            builder:
                                (_) => ImageDetailScreen(
                                  images: images ?? [],
                                  initialIndex: i,
                                ),
                          ),
                        ),
                    child: SizedBox(
                      width: tileW,
                      height: tileH,
                      child: ClipRRect(
                        borderRadius: tileRadius,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            CachedNetworkImage(
                              imageUrl: images?[i] ?? '',
                              fit: BoxFit.cover,
                            ),
                            if (showOverlay)
                              Container(
                                color: Colors.black45,
                                alignment: Alignment.center,
                                child: Text(
                                  '+$extra',
                                  style: bodySmall.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              );
            },
          ),
        ),
      ],
    );
  }
}

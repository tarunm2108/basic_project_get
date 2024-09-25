import 'dart:io';

import 'package:basic_code_getx/src/widgets/loader_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ImageType { assets, file, network, svgAsset }

class LoadImageWidget extends StatelessWidget {
  final ImageType imageType;
  final String? imagePath;
  final double? height, width;
  final BoxFit? boxFit;
  final Widget? errorWidget;
  final Color? color;

  const LoadImageWidget({
    required this.imageType,
    required this.imagePath,
    this.height,
    this.width,
    this.boxFit,
    this.errorWidget,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return imagePath == null || (imagePath?.isEmpty ?? true)
        ? const SizedBox.shrink()
        : imageType == ImageType.svgAsset
            ? SvgPicture.asset(
                imagePath!,
                height: height,
                width: width,
                colorFilter: color != null
                    ? ColorFilter.mode(color!, BlendMode.srcIn)
                    : null,
              )
            : imageType == ImageType.file
                ? Image.file(
                    File(imagePath!),
                    height: height,
                    width: width,
                    fit: boxFit,
                    color: color,
                  )
                : imageType == ImageType.assets
                    ? Image.asset(
                        imagePath!,
                        height: height,
                        width: width,
                        fit: boxFit,
                        color: color,
                      )
                    : CachedNetworkImage(
                        imageUrl: imagePath!,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        height: height,
                        width: width,
                        fit: boxFit,
                        color: color,
                        placeholder: (context, url) => const LoaderWidget(),
                        errorWidget: (context, url, error) =>
                            errorWidget ?? const Icon(Icons.error),
                      );
  }
}

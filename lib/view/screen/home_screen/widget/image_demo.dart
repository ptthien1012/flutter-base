import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/util/tool/ui_tool.dart';
import 'package:flutter_base/generated/assets.gen.dart';

import 'package:image/image.dart' as ImageProcess;
import 'package:lottie/lottie.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageDemo extends StatelessWidget {
  final String url;
  const ImageDemo({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return FadeInImage.memoryNetwork(
      fit: BoxFit.fitWidth,
      width: UiTool().getScreenWidth(context: context),
      image:
          '$url/full/${UiTool().getScreenHeight(context: context).round()},/0/default.jpg',
      placeholder: kTransparentImage,
      // placeholderCacheHeight: 0,
    );
  }
}

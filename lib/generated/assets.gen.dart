/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsEnvGen {
  const $AssetsEnvGen();

  /// File path: assets/env/develop.env
  String get develop => 'assets/env/develop.env';

  /// File path: assets/env/product.env
  String get product => 'assets/env/product.env';

  /// File path: assets/env/qa.env
  String get qa => 'assets/env/qa.env';

  /// File path: assets/env/stag.env
  String get stag => 'assets/env/stag.env';

  /// List of all assets
  List<String> get values => [develop, product, qa, stag];
}

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/ClashGrotesk-Regular.otf
  String get clashGroteskRegular => 'assets/fonts/ClashGrotesk-Regular.otf';

  /// File path: assets/fonts/Fontspring.otf
  String get fontspring => 'assets/fonts/Fontspring.otf';

  /// List of all assets
  List<String> get values => [clashGroteskRegular, fontspring];
}

class $AssetsGifGen {
  const $AssetsGifGen();

  /// File path: assets/gif/loading.gif
  AssetGenImage get loading => const AssetGenImage('assets/gif/loading.gif');

  /// List of all assets
  List<AssetGenImage> get values => [loading];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/demo.png
  AssetGenImage get demo => const AssetGenImage('assets/images/demo.png');

  /// List of all assets
  List<AssetGenImage> get values => [demo];
}

class $AssetsLocaleGen {
  const $AssetsLocaleGen();

  /// File path: assets/locale/en.json
  String get en => 'assets/locale/en.json';

  /// File path: assets/locale/vi.json
  String get vi => 'assets/locale/vi.json';

  /// List of all assets
  List<String> get values => [en, vi];
}

class $AssetsRivGen {
  const $AssetsRivGen();

  /// File path: assets/riv/glow_ball.riv
  String get glowBall => 'assets/riv/glow_ball.riv';

  /// List of all assets
  List<String> get values => [glowBall];
}

class Assets {
  Assets._();

  static const $AssetsEnvGen env = $AssetsEnvGen();
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsGifGen gif = $AssetsGifGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLocaleGen locale = $AssetsLocaleGen();
  static const $AssetsRivGen riv = $AssetsRivGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

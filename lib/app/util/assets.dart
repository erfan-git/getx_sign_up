import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Assets {
  const Assets._();

  static const icons = _Icons();
  static const images = _Images();
}

class _Icons {
  const _Icons();

  _SvgAsset get person => const _SvgAsset('assets/icons/person.svg');
  _SvgAsset get lock => const _SvgAsset('assets/icons/lock.svg');
  _ImageAsset get user => const _ImageAsset('assets/icons/user.png');
  _SvgAsset get email => const _SvgAsset('assets/icons/email.svg');
}

class _Images {
  const _Images();

  _SvgAsset get logo => const _SvgAsset('assets/images/logo.svg');
}

class _ImageAsset {
  final String path;

  const _ImageAsset(this.path);

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
      path,
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
}

class _SvgAsset {
  final String path;

  const _SvgAsset(this.path);

  Widget svg({
    Key? key,
    bool matchTextDirection = false,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    bool excludeFromSemantics = false,
  }) {
    if (kIsWeb) {
      return Image.network(
        '/assets/$path',
        key: key,
        matchTextDirection: matchTextDirection,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        color: color,
        colorBlendMode: colorBlendMode,
        excludeFromSemantics: excludeFromSemantics,
      );
    }

    return SvgPicture.asset(
      path,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      colorFilter:
          color != null ? ColorFilter.mode(color, colorBlendMode) : null,
      excludeFromSemantics: excludeFromSemantics,
    );
  }
}

import 'dart:io';

import 'utils.dart';

String getAssetCode(String file) {
  final fileName = Uri.parse(file).pathSegments.last.replaceAll('-', '_');
  final propertyName = snakeCaseToCamelCase(
    (int.tryParse(fileName[0]) != null ? r'$' : '') +
        fileName.substring(0, fileName.indexOf('.')),
  );

  if (file.endsWith('.png') || file.endsWith('.jpg')) {
    return "_ImageAsset get $propertyName => const _ImageAsset('$file');";
  } else if (file.endsWith('.svg')) {
    return "_SvgAsset get $propertyName => const _SvgAsset('$file');";
  } else {
    throw Exception('Unknown file type');
  }
}

Future<void> main(List<String> args) async {
  checkIsRootDirectory();

  final foldersToGenerate = ['icons', 'images'];

  final assetsProperties = <String>[];
  final classes = <String>[];

  for (final folder in foldersToGenerate) {
    final files = Directory('assets/$folder').listSync();
    final properties = files
        .map((file) => getAssetCode(file.path.replaceAll(r'\', '/')))
        .toList();
    final className = folder[0].toUpperCase() + folder.substring(1);
    classes.add(classTemplate(className, properties));
    assetsProperties.add('static const $folder = _$className();');
  }

  final outputFile = File('lib/app/util/assets.dart');
  if (outputFile.existsSync()) outputFile.deleteSync();
  outputFile
    ..createSync()
    ..writeAsStringSync(
      assetsClassTemplate(classes: classes, assetsProperties: assetsProperties),
    );

  final process = await Process.start(
    'dart',
    ['format', 'lib/app/util/assets.dart'],
  );
  stdout.addStream(process.stdout);
  stderr.addStream(process.stderr);
  await process.exitCode;
}

String classTemplate(String className, List<String> properties) {
  return '''
class _$className {
  const _$className();

  ${properties.join('\n  ')}
}
''';
}

String assetsClassTemplate({
  required List<String> classes,
  required List<String> assetsProperties,
}) {
  return '''
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Assets {
  const Assets._();

  ${assetsProperties.join('\n  ')}
}

${classes.join('\n')}
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
        '/assets/\$path',
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
''';
}

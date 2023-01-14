/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/login.png
  AssetGenImage get login => const AssetGenImage('assets/images/login.png');

  /// File path: assets/images/not_found_images.png
  AssetGenImage get notFoundImages => const AssetGenImage('assets/images/not_found_images.png');

  /// File path: assets/images/vietnam.png
  AssetGenImage get vietnam => const AssetGenImage('assets/images/vietnam.png');

  /// List of all assets
  List<AssetGenImage> get values => [login, notFoundImages, vietnam];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/calendar-check.svg
  SvgGenImage get calendarCheck => const SvgGenImage('assets/svg/calendar-check.svg');

  /// File path: assets/svg/course.svg
  SvgGenImage get course => const SvgGenImage('assets/svg/course.svg');

  /// File path: assets/svg/facebook_logo.svg
  SvgGenImage get facebookLogo => const SvgGenImage('assets/svg/facebook_logo.svg');

  /// File path: assets/svg/google_logo.svg
  SvgGenImage get googleLogo => const SvgGenImage('assets/svg/google_logo.svg');

  /// File path: assets/svg/history_logo.svg
  SvgGenImage get historyLogo => const SvgGenImage('assets/svg/history_logo.svg');

  /// File path: assets/svg/icons_menu.svg
  SvgGenImage get iconsMenu => const SvgGenImage('assets/svg/icons_menu.svg');

  /// File path: assets/svg/lettutor_logo.svg
  SvgGenImage get lettutorLogo => const SvgGenImage('assets/svg/lettutor_logo.svg');

  /// File path: assets/svg/mobile_logo.svg
  SvgGenImage get mobileLogo => const SvgGenImage('assets/svg/mobile_logo.svg');

  /// File path: assets/svg/vietnam.svg
  SvgGenImage get vietnam => const SvgGenImage('assets/svg/vietnam.svg');

  /// List of all assets
  List<SvgGenImage> get values => [calendarCheck, course, facebookLogo, googleLogo, historyLogo, iconsMenu, lettutorLogo, mobileLogo, vietnam];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;
}

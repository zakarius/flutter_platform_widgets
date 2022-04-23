/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator;
import 'package:flutter/material.dart' show CircularProgressIndicator;
import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

const double _kDefaultIndicatorRadius = 10.0;

class MaterialProgressIndicatorData {
  MaterialProgressIndicatorData({
    this.key,
    this.backgroundColor,
    this.strokeWidth,
    this.value,
    this.valueColor,
    this.semanticsLabel,
    this.semanticsValue,
    this.color,
  });
  final Key? key;
  final Color? backgroundColor;
  final double? strokeWidth;
  final double? value;
  final Animation<Color>? valueColor;
  final String? semanticsLabel;
  final String? semanticsValue;
  final Color? color;
}

class CupertinoProgressIndicatorData {
  CupertinoProgressIndicatorData({
    this.key,
    this.animating,
    this.radius: _kDefaultIndicatorRadius,
    this.color,
  });

  final Key? key;
  final bool? animating;
  final double? radius;
  final Color? color;
}

class FluentProgressIndicatorData {
  FluentProgressIndicatorData({
    this.key,
    this.backgroundColor,
    this.strokeWidth,
    this.value,
    this.activeColor,
    this.semanticsLabel,
    this.backwards,
  });
  final Key? key;
  final Color? backgroundColor;
  final double? strokeWidth;
  final double? value;
  final String? semanticsLabel;
  final fluent_ui.Color? activeColor;
  final bool? backwards;
}

class PlatformCircularProgressIndicator extends PlatformWidgetBase<
    CupertinoActivityIndicator,
    CircularProgressIndicator,
    fluent_ui.ProgressRing> {
  final Key? widgetKey;

  final PlatformBuilder<MaterialProgressIndicatorData>? material;
  final PlatformBuilder<CupertinoProgressIndicatorData>? cupertino;
  final PlatformBuilder<FluentProgressIndicatorData>? fluent;

  PlatformCircularProgressIndicator({
    Key? key,
    this.widgetKey,
    this.material,
    this.cupertino,
    this.fluent,
  }) : super(key: key);

  @override
  CircularProgressIndicator createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

    return CircularProgressIndicator(
      key: data?.key ?? widgetKey,
      backgroundColor: data?.backgroundColor,
      strokeWidth: data?.strokeWidth ?? 4.0,
      value: data?.value,
      valueColor: data?.valueColor,
      semanticsLabel: data?.semanticsLabel,
      semanticsValue: data?.semanticsValue,
      color: data?.color,
    );
  }

  @override
  CupertinoActivityIndicator createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    return CupertinoActivityIndicator(
      key: data?.key ?? widgetKey,
      animating: data?.animating ?? true,
      radius: data?.radius ?? _kDefaultIndicatorRadius,
      color: data?.color,
    );
  }

  @override
  fluent_ui.ProgressRing createFluentWidget(fluent_ui.BuildContext context) {
    final data = fluent?.call(context, platform(context));
    return fluent_ui.ProgressRing(
      key: data?.key ?? widgetKey,
      backgroundColor: data?.backgroundColor,
      strokeWidth: data?.strokeWidth ?? 4.0,
      value: data?.value,
      activeColor: data?.activeColor,
      backwards: data?.backwards ?? false,
      semanticLabel: data?.semanticsLabel,
    );
  }
}

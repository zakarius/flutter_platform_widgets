/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoAlertDialog;
import 'package:flutter/material.dart' show AlertDialog;
import 'package:fluent_ui/fluent_ui.dart' as fluent_ui
    show ContentDialog, ContentDialogThemeData;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

const EdgeInsets _defaultInsetPadding =
    EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0);

abstract class _BaseData {
  _BaseData({
    this.widgetKey,
    this.actions,
    this.content,
    this.title,
  });

  final Key? widgetKey;
  final List<Widget>? actions;
  final Widget? content;
  final Widget? title;
}

class MaterialAlertDialogData extends _BaseData {
  MaterialAlertDialogData({
    Key? widgetKey,
    List<Widget>? actions,
    Widget? content,
    Widget? title,
    this.contentTextStyle,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.contentPadding,
    this.semanticLabel,
    this.titlePadding,
    this.titleTextStyle,
    this.scrollable,
    this.actionsOverflowDirection,
    this.actionsPadding,
    this.buttonPadding,
    this.actionsOverflowButtonSpacing,
    this.clipBehavior,
    this.insetPadding,
    this.actionsAlignment,
    this.alignment,
  }) : super(
            widgetKey: widgetKey,
            actions: actions,
            content: content,
            title: title);

  final EdgeInsetsGeometry? contentPadding;
  final String? semanticLabel;
  final EdgeInsetsGeometry? titlePadding;
  final TextStyle? contentTextStyle;
  final Color? backgroundColor;
  final double? elevation;
  final ShapeBorder? shape;
  final TextStyle? titleTextStyle;
  final bool? scrollable;
  final VerticalDirection? actionsOverflowDirection;
  final EdgeInsetsGeometry? actionsPadding;
  final EdgeInsetsGeometry? buttonPadding;
  final double? actionsOverflowButtonSpacing;
  final Clip? clipBehavior;
  final EdgeInsets? insetPadding;
  final MainAxisAlignment? actionsAlignment;
  final AlignmentGeometry? alignment;
}

class CupertinoAlertDialogData extends _BaseData {
  CupertinoAlertDialogData({
    Key? widgetKey,
    List<Widget>? actions,
    Widget? content,
    Widget? title,
    this.scrollController,
    this.actionScrollController,
    this.insetAnimationCurve,
    this.insetAnimationDuration,
  }) : super(
            widgetKey: widgetKey,
            actions: actions,
            content: content,
            title: title);

  final ScrollController? scrollController;
  final ScrollController? actionScrollController;
  final Curve? insetAnimationCurve;
  final Duration? insetAnimationDuration;
}

class FluentAlertDialogData extends _BaseData {
  final fluent_ui.ContentDialogThemeData? style;

  final bool backgroundDismiss;
  final BoxConstraints constraints;

  FluentAlertDialogData({
    Key? widgetKey,
    List<Widget>? actions,
    Widget? content,
    Widget? title,
    this.style,
    this.backgroundDismiss = false,
    this.constraints = const BoxConstraints(),
  }) : super(
            widgetKey: widgetKey,
            actions: actions,
            content: content,
            title: title);
}

class PlatformAlertDialog extends PlatformWidgetBase<CupertinoAlertDialog,
    AlertDialog, fluent_ui.ContentDialog> {
  final Key? widgetKey;
  final List<Widget>? actions;
  final Widget? content;
  final Widget? title;

  final PlatformBuilder<MaterialAlertDialogData>? material;
  final PlatformBuilder<CupertinoAlertDialogData>? cupertino;
  final PlatformBuilder<FluentAlertDialogData>? fluent;

  PlatformAlertDialog({
    Key? key,
    this.widgetKey,
    this.actions,
    this.content,
    this.title,
    this.material,
    this.cupertino,
    this.fluent,
  }) : super(key: key);

  @override
  AlertDialog createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

    return AlertDialog(
      key: data?.widgetKey ?? widgetKey,
      actions: data?.actions ?? actions,
      content: data?.content ?? content,
      contentPadding: data?.contentPadding ??
          const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
      semanticLabel: data?.semanticLabel,
      title: data?.title ?? title,
      titlePadding: data?.titlePadding,
      contentTextStyle: data?.contentTextStyle,
      backgroundColor: data?.backgroundColor,
      elevation: data?.elevation,
      shape: data?.shape,
      titleTextStyle: data?.titleTextStyle,
      scrollable: data?.scrollable ?? false,
      actionsOverflowDirection: data?.actionsOverflowDirection,
      actionsPadding: data?.actionsPadding ?? EdgeInsets.zero,
      buttonPadding: data?.buttonPadding,
      actionsOverflowButtonSpacing: data?.actionsOverflowButtonSpacing,
      clipBehavior: data?.clipBehavior ?? Clip.none,
      insetPadding: data?.insetPadding ?? _defaultInsetPadding,
      actionsAlignment: data?.actionsAlignment,
      alignment: data?.alignment,
    );
  }

  @override
  CupertinoAlertDialog createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    Curve? curve = data?.insetAnimationCurve;

    return CupertinoAlertDialog(
      key: data?.widgetKey ?? widgetKey,
      actions: data?.actions ?? actions ?? const <Widget>[],
      content: data?.content ?? content,
      scrollController: data?.scrollController,
      actionScrollController: data?.actionScrollController,
      title: data?.title ?? title,
      insetAnimationCurve: curve ?? Curves.decelerate,
      insetAnimationDuration:
          data?.insetAnimationDuration ?? Duration(milliseconds: 100),
    );
  }

  @override
  fluent_ui.ContentDialog createFluentWidget(BuildContext context) {
    final data = fluent?.call(context, platform(context));
    return fluent_ui.ContentDialog(
      key: data?.widgetKey ?? widgetKey,
      actions: data?.actions ?? actions ?? const <Widget>[],
      title: data?.title ?? title,
      content: data?.content ?? content,
      backgroundDismiss: data?.backgroundDismiss ?? false,
      constraints: data?.constraints ?? BoxConstraints.tightFor(width: 400),
      style: data?.style,
    );
  }
}

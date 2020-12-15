/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoButton;
import 'package:flutter/material.dart'
    show
        Brightness,
        ButtonTextTheme,
        MaterialButton,
        MaterialTapTargetSize,
        VisualDensity;
import 'package:flutter/rendering.dart' show MouseCursor;
import 'package:flutter/widgets.dart';

import 'platform_button_flat.dart' as button_flat;
import 'platform_button_raised.dart' as button_raised;
import 'widget_base.dart';

abstract class _BaseData {
  _BaseData({
    this.widgetKey,
    this.child,
    this.color,
    this.onPressed,
    this.padding,
    this.disabledColor,
  });

  final Key? widgetKey;
  final Widget? child;
  final Color? color;
  final void Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  final Color? disabledColor;
}

class MaterialFlatButtonData extends _BaseData {
  MaterialFlatButtonData({
    Key? widgetKey,
    Widget? child,
    Color? color,
    void Function()? onPressed,
    EdgeInsetsGeometry? padding,
    Color? disabledColor,
    this.animationDuration,
    this.colorBrightness,
    this.disabledElevation,
    this.disabledTextColor,
    this.elevation,
    this.highlightColor,
    this.highlightElevation,
    this.onHighlightChanged,
    this.shape,
    this.splashColor,
    this.textColor,
    this.textTheme,
    this.clipBehavior,
    this.materialTapTargetSize,
    this.focusElevation,
    this.focusColor,
    this.hoverColor,
    this.focusNode,
    this.hoverElevation,
    this.autofocus,
    this.onLongPress,
    this.visualDensity,
    this.mouseCursor,
    this.height,
    this.minWidth,
  }) : super(
          widgetKey: widgetKey,
          child: child,
          color: color,
          onPressed: onPressed,
          padding: padding,
          disabledColor: disabledColor,
        );

  final Duration? animationDuration;
  final Brightness? colorBrightness;

  final double? disabledElevation;
  final Color? disabledTextColor;
  final double? elevation;
  final Color? highlightColor;
  final double? highlightElevation;
  final void Function(bool)? onHighlightChanged;
  final ShapeBorder? shape;
  final Color? splashColor;
  final Color? textColor;
  final ButtonTextTheme? textTheme;
  final Clip? clipBehavior;
  final MaterialTapTargetSize? materialTapTargetSize;
  final double? focusElevation;
  final Color? focusColor;
  final Color? hoverColor;
  final FocusNode? focusNode;
  final double? hoverElevation;
  final bool? autofocus;
  final void Function()? onLongPress;
  final VisualDensity? visualDensity;
  final MouseCursor? mouseCursor;
  final double? height;
  final double? minWidth;
}

class MaterialRaisedButtonData extends _BaseData {
  MaterialRaisedButtonData({
    Key? widgetKey,
    Widget? child,
    Color? color,
    void Function()? onPressed,
    EdgeInsetsGeometry? padding,
    Color? disabledColor,
    this.animationDuration,
    this.colorBrightness,
    this.disabledElevation,
    this.disabledTextColor,
    this.elevation,
    this.highlightColor,
    this.highlightElevation,
    this.onHighlightChanged,
    this.shape,
    this.splashColor,
    this.textColor,
    this.textTheme,
    this.clipBehavior,
    this.materialTapTargetSize,
    this.focusElevation,
    this.focusColor,
    this.hoverColor,
    this.focusNode,
    this.hoverElevation,
    this.autofocus,
    this.onLongPress,
    this.visualDensity,
    this.mouseCursor,
  }) : super(
          widgetKey: widgetKey,
          child: child,
          color: color,
          onPressed: onPressed,
          padding: padding,
          disabledColor: disabledColor,
        );

  final Duration? animationDuration;
  final Brightness? colorBrightness;

  final double? disabledElevation;
  final Color? disabledTextColor;
  final double? elevation;
  final Color? highlightColor;
  final double? highlightElevation;
  final void Function(bool)? onHighlightChanged;
  final ShapeBorder? shape;
  final Color? splashColor;
  final Color? textColor;
  final ButtonTextTheme? textTheme;
  final Clip? clipBehavior;
  final MaterialTapTargetSize? materialTapTargetSize;
  final double? focusElevation;
  final Color? focusColor;
  final Color? hoverColor;
  final FocusNode? focusNode;
  final double? hoverElevation;
  final bool? autofocus;
  final void Function()? onLongPress;
  final VisualDensity? visualDensity;
  final MouseCursor? mouseCursor;
}

class CupertinoButtonData extends _BaseData {
  CupertinoButtonData({
    Key? widgetKey,
    Widget? child,
    Color? color,
    void Function()? onPressed,
    EdgeInsetsGeometry? padding,
    Color? disabledColor,
    this.borderRadius,
    this.minSize,
    this.pressedOpacity,
  }) : super(
            widgetKey: widgetKey,
            child: child,
            color: color,
            onPressed: onPressed,
            padding: padding,
            disabledColor: disabledColor);

  final BorderRadius? borderRadius;
  final double? minSize;
  final double? pressedOpacity;
}

class CupertinoFilledButtonData extends _BaseData {
  CupertinoFilledButtonData({
    Key? widgetKey,
    Widget? child,
    void Function()? onPressed,
    EdgeInsetsGeometry? padding,
    Color? disabledColor,
    this.borderRadius,
    this.minSize,
    this.pressedOpacity,
  }) : super(
            widgetKey: widgetKey,
            child: child,
            onPressed: onPressed,
            padding: padding,
            disabledColor: disabledColor);

  final BorderRadius? borderRadius;
  final double? minSize;
  final double? pressedOpacity;
}

enum _ButtonType {
  Raised,
  Flat,
}

class _CommonPropsV1 {
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final Color? disabledColor;

  const _CommonPropsV1({
    this.color,
    this.padding,
    this.disabledColor,
  });
}

class PlatformButton
    extends PlatformWidgetBase<CupertinoButton, MaterialButton> {
  PlatformButton._(
    Key? key,
    this.widgetKey,
    this.child,
    this.onPressed,
    this.commonPropsV1,
    this._buttonType,
    this._materialFlat,
    this._cupertinoDefault,
    this._materialRaised,
    this._cupertinoFilled,
  ) : super(key: key);

  PlatformButton.raised({
    Key? key,
    Key? widgetKey,
    Widget? child,
    void Function()? onPressed,
    Color? color,
    Color? disabledColor,
    EdgeInsetsGeometry? padding,
    PlatformBuilder<MaterialRaisedButtonData>? material,
    PlatformBuilder<CupertinoFilledButtonData>? cupertino,
  }) : this._(
          key,
          widgetKey,
          child,
          onPressed,
          _CommonPropsV1(
            color: color,
            disabledColor: disabledColor,
            padding: padding,
          ),
          _ButtonType.Raised,
          null,
          null,
          material,
          cupertino,
        );

  PlatformButton.flat({
    Key? key,
    Key? widgetKey,
    Widget? child,
    void Function()? onPressed,
    Color? color,
    Color? disabledColor,
    EdgeInsetsGeometry? padding,
    PlatformBuilder<MaterialFlatButtonData>? material,
    PlatformBuilder<CupertinoButtonData>? cupertino,
  }) : this._(
          key,
          widgetKey,
          child,
          onPressed,
          _CommonPropsV1(
            color: color,
            disabledColor: disabledColor,
            padding: padding,
          ),
          _ButtonType.Flat,
          material,
          cupertino,
          null,
          null,
        );

  final _ButtonType _buttonType;

  final Key? widgetKey;

  final void Function()? onPressed;
  final Widget? child;
  final _CommonPropsV1? commonPropsV1;

  final PlatformBuilder<MaterialFlatButtonData>? _materialFlat;
  final PlatformBuilder<CupertinoButtonData>? _cupertinoDefault;

  final PlatformBuilder<MaterialRaisedButtonData>? _materialRaised;
  final PlatformBuilder<CupertinoFilledButtonData>? _cupertinoFilled;

/*

  const PlatformButton.elevated() {}

  const PlatformButton.outline() {}

  const PlatformButton.text() {}
  */

  @override
  MaterialButton createMaterialWidget(BuildContext context) {
    switch (_buttonType) {
      case _ButtonType.Raised:
        return button_raised.createMaterialWidget(
          context,
          this,
          _materialRaised,
        );
      case _ButtonType.Flat:
        return button_flat.createMaterialWidget(
          context,
          this,
          _materialFlat,
        );
    }
  }

  @override
  CupertinoButton createCupertinoWidget(BuildContext context) {
    switch (_buttonType) {
      case _ButtonType.Raised:
        return button_raised.createCupertinoWidget(
          context,
          this,
          _cupertinoFilled,
        );
      case _ButtonType.Flat:
        return button_flat.createCupertinoWidget(
          context,
          this,
          _cupertinoDefault,
        );
    }
  }
}

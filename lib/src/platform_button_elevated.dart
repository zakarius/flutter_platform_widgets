import 'package:flutter/material.dart'
    show ElevatedButton, TextButton, OutlineButton;
import 'package:flutter/widgets.dart';

import 'platform_button.dart';
import 'widget_base.dart';

class MaterialElevatedButtonData {}

Widget createMaterialWidget(
  BuildContext context,
  PlatformButton button,
  PlatformBuilder<MaterialElevatedButtonData>? dataBuilder,
) {
  //ElevatedButton.icon
  return ElevatedButton(
    key: button.widgetKey,
    child: button.child,
    onPressed: button.onPressed,
    //VoidCallback? onLongPress,
    //ButtonStyle? style,
    //FocusNode? focusNode,
    //bool autofocus = false,
    //Clip clipBehavior = Clip.none,
  );
}

Widget createMaterialWidget_2(
  BuildContext context,
  PlatformButton button,
  PlatformBuilder<MaterialElevatedButtonData>? dataBuilder,
) {
  //TextButton.icon
  return TextButton(
    key: button.widgetKey,
    child: button.child!,
    onPressed: button.onPressed,
    //VoidCallback? onLongPress,
    //ButtonStyle? style,
    //FocusNode? focusNode,
    //bool autofocus = false,
    //Clip clipBehavior = Clip.none,
  );
}

Widget createMaterialWidget_3(
  BuildContext context,
  PlatformButton button,
  PlatformBuilder<MaterialElevatedButtonData>? dataBuilder,
) {
  //OutlineButton.icon
  return OutlineButton(
    key: button.widgetKey,
    child: button.child,
    onPressed: button.onPressed,
    // MouseCursor? mouseCursor,
    // ButtonTextTheme? textTheme,
    // Color? textColor,
    // Color? disabledTextColor,
    // Color? color,
    // Color? focusColor,
    // Color? hoverColor,
    // Color? highlightColor,
    // Color? splashColor,
    // double? highlightElevation,
    // this.borderSide,
    // this.disabledBorderColor,
    // this.highlightedBorderColor,
    // EdgeInsetsGeometry? padding,
    // VisualDensity? visualDensity,
    // ShapeBorder? shape,
    // Clip clipBehavior = Clip.none,
    // FocusNode? focusNode,
    // bool autofocus = false,
    // MaterialTapTargetSize? materialTapTargetSize,
  );
}

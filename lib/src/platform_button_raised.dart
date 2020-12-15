import 'package:flutter/cupertino.dart'
    show CupertinoButton, CupertinoColors, CupertinoColors;
import 'package:flutter/material.dart' show MaterialButton, RaisedButton;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'platform_button.dart';
import 'widget_base.dart';

const double _kMinInteractiveDimensionCupertino = 44.0;

MaterialButton createMaterialWidget(
  BuildContext context,
  PlatformButton button,
  PlatformBuilder<MaterialRaisedButtonData>? dataBuilder,
) {
  final data = dataBuilder?.call(context, platform(context));

  assert(data?.child != null || button.child != null);

  return RaisedButton(
    key: data?.widgetKey ?? button.widgetKey,
    child: data?.child ?? button.child!,
    onPressed: data?.onPressed ?? button.onPressed,
    animationDuration: data?.animationDuration,
    color: data?.color ?? button.commonPropsV1?.color,
    colorBrightness: data?.colorBrightness,
    disabledColor: data?.disabledColor ?? button.commonPropsV1?.disabledColor,
    disabledElevation: data?.disabledElevation,
    disabledTextColor: data?.disabledTextColor,
    elevation: data?.elevation,
    highlightColor: data?.highlightColor,
    highlightElevation: data?.highlightElevation,
    onHighlightChanged: data?.onHighlightChanged,
    padding: data?.padding ?? button.commonPropsV1?.padding,
    shape: data?.shape,
    splashColor: data?.splashColor,
    textColor: data?.textColor,
    textTheme: data?.textTheme,
    clipBehavior: data?.clipBehavior ?? Clip.none,
    materialTapTargetSize: data?.materialTapTargetSize,
    focusElevation: data?.focusElevation,
    focusColor: data?.focusColor,
    hoverColor: data?.hoverColor,
    focusNode: data?.focusNode,
    hoverElevation: data?.hoverElevation,
    autofocus: data?.autofocus ?? false,
    onLongPress: data?.onLongPress,
    visualDensity: data?.visualDensity,
    mouseCursor: data?.mouseCursor,
  );
}

CupertinoButton createCupertinoWidget(
  BuildContext context,
  PlatformButton button,
  PlatformBuilder<CupertinoFilledButtonData>? dataBuilder,
) {
  final data = dataBuilder?.call(context, platform(context));

  assert(data?.child != null || button.child != null);

  return CupertinoButton.filled(
    key: data?.widgetKey ?? button.widgetKey,
    child: data?.child ?? button.child!,
    onPressed: data?.onPressed ?? button.onPressed,
    borderRadius: data?.borderRadius ??
        const BorderRadius.all(const Radius.circular(8.0)),
    minSize: data?.minSize ?? _kMinInteractiveDimensionCupertino,
    padding: data?.padding ?? button.commonPropsV1?.padding,
    pressedOpacity: data?.pressedOpacity ?? 0.4,
    disabledColor: data?.disabledColor ??
        button.commonPropsV1?.disabledColor ??
        CupertinoColors.quaternarySystemFill,
  );
}

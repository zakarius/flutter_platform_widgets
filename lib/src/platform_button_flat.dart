import 'package:flutter/cupertino.dart' show CupertinoButton, CupertinoColors;
import 'package:flutter/material.dart' show MaterialButton, FlatButton;
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'platform_button.dart';
import 'widget_base.dart';

const double _kMinInteractiveDimensionCupertino = 44.0;

MaterialButton createMaterialWidget(
  BuildContext context,
  PlatformButton button,
  PlatformBuilder<MaterialFlatButtonData>? dataBuilder,
) {
  final data = dataBuilder?.call(context, platform(context));

  assert(data?.child != null || button.child != null);

  return FlatButton(
    key: data?.widgetKey ?? button.widgetKey,
    child: data?.child ?? button.child!,
    onPressed: data?.onPressed ?? button.onPressed,
    color: data?.color ?? button.commonPropsV1?.color,
    colorBrightness: data?.colorBrightness,
    disabledColor: data?.disabledColor ?? button.commonPropsV1?.disabledColor,
    disabledTextColor: data?.disabledTextColor,
    highlightColor: data?.highlightColor,
    onHighlightChanged: data?.onHighlightChanged,
    padding: data?.padding ?? button.commonPropsV1?.padding,
    shape: data?.shape,
    splashColor: data?.splashColor,
    textColor: data?.textColor,
    textTheme: data?.textTheme,
    clipBehavior: data?.clipBehavior ?? Clip.none,
    materialTapTargetSize: data?.materialTapTargetSize,
    focusColor: data?.focusColor,
    focusNode: data?.focusNode,
    hoverColor: data?.hoverColor,
    autofocus: data?.autofocus ?? false,
    onLongPress: data?.onLongPress,
    visualDensity: data?.visualDensity,
    mouseCursor: data?.mouseCursor,
    height: data?.height,
    minWidth: data?.minWidth,
  );
}

CupertinoButton createCupertinoWidget(
  BuildContext context,
  PlatformButton button,
  PlatformBuilder<CupertinoButtonData>? dataBuilder,
) {
  final data = dataBuilder?.call(context, platform(context));

  assert(data?.child != null || button.child != null);

  return CupertinoButton(
    key: data?.widgetKey ?? button.widgetKey,
    child: data?.child ?? button.child!,
    onPressed: data?.onPressed ?? button.onPressed,
    borderRadius: data?.borderRadius ??
        const BorderRadius.all(const Radius.circular(8.0)),
    color: data?.color ?? button.commonPropsV1?.color,
    minSize: data?.minSize ?? _kMinInteractiveDimensionCupertino,
    padding: data?.padding ?? button.commonPropsV1?.padding,
    pressedOpacity: data?.pressedOpacity ?? 0.4,
    disabledColor: data?.disabledColor ??
        button.commonPropsV1?.disabledColor ??
        CupertinoColors.quaternarySystemFill,
  );
}

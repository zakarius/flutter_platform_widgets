/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

class PlatformWidget extends PlatformWidgetBase<Widget, Widget, Widget> {
  final PlatformBuilder<Widget?>? material;
  final PlatformBuilder<Widget?>? cupertino;
  final PlatformBuilder<Widget?>? fluent;

  PlatformWidget({
    Key? key,
    this.cupertino,
    this.material,
    this.fluent,
  }) : super(key: key);

  @override
  Widget createMaterialWidget(BuildContext context) {
    return material?.call(context, platform(context)) ?? SizedBox.shrink();
  }

  @override
  Widget createCupertinoWidget(BuildContext context) {
    return cupertino?.call(context, platform(context)) ?? SizedBox.shrink();
  }

  @override
  Widget createFluentWidget(BuildContext context) {
    return fluent?.call(context, platform(context)) ?? SizedBox.shrink();
  }
}

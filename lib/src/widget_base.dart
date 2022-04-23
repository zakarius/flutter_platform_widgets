/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/widgets.dart';

import 'platform.dart';

typedef T PlatformBuilder<T>(BuildContext context, PlatformTarget platform);
typedef T PlatformIndexBuilder<T>(
    BuildContext context, PlatformTarget platform, int index);

abstract class PlatformWidgetBase<C extends Widget, M extends Widget,
    F extends Widget> extends StatelessWidget {
  const PlatformWidgetBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isFluent(context)) {
      return createFluentWidget(context);
    }

    if (isCupertino(context)) {
      return createCupertinoWidget(context);
    }

    return createMaterialWidget(context);
  }

  C createCupertinoWidget(BuildContext context);

  M createMaterialWidget(BuildContext context);

  F createFluentWidget(BuildContext context);
}

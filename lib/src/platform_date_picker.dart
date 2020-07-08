import 'package:flutter/cupertino.dart' show CupertinoDatePicker;
import 'package:flutter/material.dart' show showDatePicker;
import 'package:flutter/widgets.dart';

import 'platform.dart' as fpw;
import 'platform_button.dart';

/*
class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformDatePickerProvider( // can omit if using a state key picker
      builder: (context, picker) => Column(
        children: <Widget>[
          PlatformButton(
            child: Text('open'),
            onPressed: () => picker.open('one'),
          ),
          PlatformDatePicker(
            picker: datePicker.named('one'), // optional named
            // need to figure out if it is a widget or popup
            cupertinoViewMode: Mode.event | Mode.inline, //default inline
            cupertinoEvent: (context) {} // called when open is called + Mode.event
            cupertinoInlineBuilder: (context, picker) => // only needed for Mode.inline
                Container(height: 100, child: picker),
            onDateChanged: (date) {},
            // more args
          ),
        ],
      ),
    );
  }
}*/
class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformDatePickerProvider(
      // can omit if using a state key picker
      builder: (context, pickerState) => Column(
        children: <Widget>[
          PlatformButton(
            child: Text('open'),
            onPressed: () => pickerState.open(),
          ),
          if (pickerState.widget != null)
            Container(height: 100, child: pickerState.widget),
        ],
      ),
    );
  }
}

class DatePickerState {
  final Future<void> Function() _onOpen;

  DatePickerState(this._onOpen);

  Future<void> open() => _onOpen();

  Widget _widget;
  Widget get widget => _widget;
}

class PlatformDatePickerProvider extends StatefulWidget {
  final InteractionMode cupertinoMode;
  final Widget Function(BuildContext, DatePickerState) builder;

  const PlatformDatePickerProvider({
    Key key,
    @required this.builder,
    this.cupertinoMode = InteractionMode.Inline,
  })  : assert(builder != null),
        assert(cupertinoMode != null),
        super(key: key);

  @override
  _PlatformDatePickerProviderState createState() =>
      _PlatformDatePickerProviderState();
}

class _PlatformDatePickerProviderState
    extends State<PlatformDatePickerProvider> {
  @override
  Widget build(BuildContext context) {
    final isMaterial = fpw.isMaterial(context);
    final isCupertino = fpw.isCupertino(context);

    final state = DatePickerState(() async {
      if (widget.cupertinoMode == InteractionMode.Event || isMaterial) {
        // raise the event.
        if (isMaterial) {
          showDatePicker(
            lastDate: DateTime.now(),
            firstDate: DateTime.now(),
            initialDate: DateTime.now(),
            context: context,
            // todo more args
          );
        } else if (isCupertino) {
          // TODO popup
        }
      } else {
        setState(() {
          // just rebuild
        });
      }
    });

    if (isCupertino) {
      if (widget.cupertinoMode == InteractionMode.Inline) {
        state._widget = CupertinoDatePicker(
          onDateTimeChanged: (date) {},
          // todo more args
        );
      }
    }

    return widget.builder(context, state);
  }
}

enum InteractionMode {
  Event,
  Inline,
}

/*
class PlatformDatePicker extends StatefulWidget {
  final InteractionMode mode;

  const PlatformDatePicker({Key key, this.mode = InteractionMode.Inline})
      : assert(mode != null),
        super(key: key);

  @override
  _PlatformDatePickerState createState() => _PlatformDatePickerState();
}

class _PlatformDatePickerState extends State<PlatformDatePicker> {
  bool _show = false;

  @override
  Widget build(BuildContext context) {
    if (_show) {
      if (isCupertino(context)) {
        if (widget.mode == InteractionMode.Inline) {
          return CupertinoDatePicker(
            onDateTimeChanged: (date) {},
          );
        }
      }
    }
    return SizedBox.shrink();
  }
}
*/

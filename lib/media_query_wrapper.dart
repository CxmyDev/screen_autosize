part of screen_autosize;

class MediaQueryWrapper extends StatelessWidget {

  /// Creates a widget that delegates its build to a callback.
  ///
  /// The [builder] argument must not be null.
  const MediaQueryWrapper({
    Key key,
    @required this.builder,
  }) : assert(builder != null),
        super(key: key);

  /// Called to obtain the child widget.
  ///
  /// This function is called whenever this widget is included in its parent's
  /// build and the old widget (if any) that it synchronizes with has a distinct
  /// object identity. Typically the parent's build method will construct
  /// a new tree of widgets and so a new Builder child will not be [identical]
  /// to the corresponding old one.
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1.0,
          size: AutoSizeUtils.instance.screenSize,
          devicePixelRatio: AutoSizeUtils.instance.devicePixelRatio,
        ),
        child: builder(context));
  }
}
import 'package:community_charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

/// Example custom renderer that renders [IconData].
///
/// This is used to show that legend symbols can be assigned a custom symbol.
class IconSymbolRenderer extends charts.CustomSymbolRenderer {
  IconSymbolRenderer(
    this.iconData,
    this.size,
  );

  final IconData iconData;
  final double? size;

  @override
  Widget build(
    BuildContext context, {
    Color? color,
    bool enabled = true,
    required Size size,
  }) {
    return SizedBox.fromSize(
      size: size,
      child: Icon(
        iconData,
        color: color,
        size: this.size ?? size.shortestSide,
      ),
    );
  }
}

import 'dart:math';

import 'package:community_charts_flutter/flutter.dart' as charts;
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class SliderFunctions {
  static final Map<String, dynamic> functions = {
    'on_slider_change': (
      Point<int> point,
      dynamic domain,
      String roleId,
      charts.SliderListenerDragState dragState,
    ) {
      final registry = JsonWidgetRegistry.instance;

      registry.setValue('sliderDomainValue', (domain * 10).round() / 10);
      registry.setValue('sliderDragState', dragState.toString());
      registry.setValue('sliderPosition', {
        'x': point.x,
        'y': point.y,
      });
    }
  };
}

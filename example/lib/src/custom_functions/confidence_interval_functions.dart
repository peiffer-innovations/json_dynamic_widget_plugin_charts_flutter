import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';

class ConfidenceIntervalFunctions {
  static final Map<String, dynamic> functions = {
    'confidence_interval_measure_lower_bound':
        (ChartPoint<DateTime> point, _) => point.measure! - 5,
    'confidence_interval_measure_upper_bound':
        (ChartPoint<DateTime> point, _) => point.measure! + 5,
  };
}

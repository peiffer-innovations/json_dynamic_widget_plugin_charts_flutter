import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';

class ChartBehaviorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/chart_behavior.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/ChartBehavior-class.html',
    'title': 'ChartBehavior',
    'oneOf': [
      {
        'type': 'string',
      },
      {
        r'$ref': ChartTitleSchema.id,
      },
      {
        r'$ref': DatumLegendSchema.id,
      },
      {
        r'$ref': DomainHighlighterSchema.id,
      },
      {
        r'$ref': InitialHintBehaviorSchema.id,
      },
      {
        r'$ref': InitialSelectionSchema.id,
      },
      {
        r'$ref': LinePointHighlighterSchema.id,
      },
      {
        r'$ref': SelectNearestSchema.id,
      },
      {
        r'$ref': PanAndZoomBehaviorSchema.id,
      },
      {
        r'$ref': PercentInjectorSchema.id,
      },
      {
        r'$ref': RangeAnnotationSchema.id,
      },
      {
        r'$ref': SelectNearestSchema.id,
      },
      {
        r'$ref': SeriesLegendSchema.id,
      },
      {
        r'$ref': SliderSchema.id,
      },
      {
        r'$ref': SlidingViewportSchema.id,
      },
    ],
  };
}

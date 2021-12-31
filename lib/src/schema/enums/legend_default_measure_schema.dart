import 'package:json_theme/json_theme_schemas.dart';

class LegendDefaultMeasureSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/legend_default_measure.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/LegendDefaultMeasure.html',
    'type': 'string',
    'title': 'LegendDefaultMeasure',
    'oneOf': SchemaHelper.enumSchema([
      'average',
      'firstValue',
      'lastValue',
      'none',
      'sum',
    ]),
  };
}

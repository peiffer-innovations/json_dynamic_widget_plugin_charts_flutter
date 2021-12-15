import 'package:json_theme/json_theme_schemas.dart';

class AxisDirectionSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/axis_direction.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/AxisDirection.html',
    'type': 'string',
    'title': 'AxisDirection',
    'oneOf': SchemaHelper.enumSchema([
      'normal',
      'reversed',
    ]),
  };
}

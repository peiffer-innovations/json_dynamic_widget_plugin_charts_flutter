import 'package:json_dynamic_widget_plugin_charts_flutter/src/schema/enums/axis_direction_schema.dart';
import 'package:json_theme/json_theme_schemas.dart';

class RTLSpecSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/rtl_spec.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/NumericAxisSpec-class.html',
    'title': 'RTLSpec',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'axisDirection': SchemaHelper.objectSchema(AxisDirectionSchema.id),
    },
  };
}
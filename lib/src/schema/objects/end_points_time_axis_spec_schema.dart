import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_theme/json_theme_schemas.dart';

class EndPointsTimeAxisSpecSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/end_points_time_axis_spec.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/EndPointsTimeAxisSpec-class.html',
    'title': 'EndPointsTimeAxisSpec',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'renderSpec': SchemaHelper.objectSchema(RenderSpecSchema.id),
      'showAxisLine': SchemaHelper.boolSchema,
      'tickFormatterSpec': SchemaHelper.stringSchema,
      'tickProviderSpec': SchemaHelper.stringSchema,
      'type': {
        'type': 'string',
        'enum': [
          'end_points_time',
        ],
      },
      'viewport': SchemaHelper.stringSchema,
    },
  };
}

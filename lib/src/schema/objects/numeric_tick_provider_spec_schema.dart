import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_theme/json_theme_schemas.dart';

class NumericTickProviderSpecSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/numeric_tick_provider_spec.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/NumericTickProviderSpec-class.html',
    'title': 'NumericTickProviderSpec',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'dataIsInWholeNumbers': SchemaHelper.boolSchema,
      'desiredMaxTickCount': SchemaHelper.numberSchema,
      'desiredMinTickCount': SchemaHelper.numberSchema,
      'desiredTickCount': SchemaHelper.numberSchema,
      'ticks': SchemaHelper.arraySchema(
        TickSpecSchema.id,
        includeObject: true,
      ),
      'type': {
        'type': 'string',
        'enum': [
          'basic',
          'bucketing',
          'end_points',
          'static',
        ],
      },
      'zeroBound': SchemaHelper.boolSchema,
    },
  };
}

import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_theme/json_theme_schemas.dart';

class OrdinalTickProviderSpecSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/ordinal_tick_provider_spec.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/OrdinalTickProviderSpec-class.html',
    'title': 'AxisSpec',
    'type': 'object',
    'additionalProperties': true,
    'required': ['type'],
    'properties': {
      'ticks': SchemaHelper.arraySchema(
        TickSpecSchema.id,
        includeObject: true,
      ),
      'type': {
        'type': 'string',
        'enum': [
          'basic',
          'static',
        ],
      },
    },
  };
}

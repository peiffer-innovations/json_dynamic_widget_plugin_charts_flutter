import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_theme/json_theme_schemas.dart';

class OrdinalAxisSpecSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/ordinal_axis_spec.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/OrdinalAxisSpec-class.html',
    'title': 'OrdinalAxisSpec',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'renderSpec': SchemaHelper.objectSchema(RenderSpecSchema.id),
      'scaleSpec': SchemaHelper.stringSchema,
      'showAxisLine': SchemaHelper.boolSchema,
      'tickFormatterSpec': SchemaHelper.stringSchema,
      'tickProviderSpec': SchemaHelper.stringSchema,
      'type': {
        'type': 'string',
        'enum': [
          'ordinal',
        ],
      },
      'viewport': SchemaHelper.stringSchema,
    },
  };
}

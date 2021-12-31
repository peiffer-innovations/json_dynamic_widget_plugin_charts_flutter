import 'package:json_theme/json_theme_schemas.dart';

class ArcLabelLeaderLineStyleSpecSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/arc_label_leader_line_style_spec.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/ArcLabelLeaderLineStyleSpec-class.html',
    'title': 'ArcLabelLeaderLineStyleSpec',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'length': SchemaHelper.numberSchema,
      'thickness': SchemaHelper.numberSchema,
    },
  };
}

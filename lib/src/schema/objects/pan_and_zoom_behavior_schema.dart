import 'package:json_theme/json_theme_schemas.dart';

class PanAndZoomBehaviorSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/pan_and_zoom_behavior.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_flutter/latest/flutter/PanAndZoomBehavior-class.html',
    'title': 'PanAndZoomBehavior',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'panningCompletedCallback': SchemaHelper.stringSchema,
    },
  };
}

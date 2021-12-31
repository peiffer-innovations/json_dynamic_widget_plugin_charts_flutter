import 'package:json_theme/json_theme_schemas.dart';

class LinePointHighlighterFollowLineTypeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/line_point_highlighter_follow_line_type.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/LinePointHighlighterFollowLineType.html',
    'type': 'string',
    'title': 'LinePointHighlighterFollowLineType',
    'oneOf': SchemaHelper.enumSchema([
      'all',
      'nearest',
      'none',
    ]),
  };
}

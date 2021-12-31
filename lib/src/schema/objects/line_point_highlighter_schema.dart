import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_theme/json_theme_schemas.dart';

class LinePointHighlighterSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/line_point_highlighter.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/LinePointHighlighter-class.html',
    'title': 'LinePointHighlighter',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'dashPattern': SchemaHelper.anySchema,
      'defaultRadiusPx': SchemaHelper.numberSchema,
      'drawFollowLinesAcrossChart': SchemaHelper.boolSchema,
      'radiusPaddingPx': SchemaHelper.numberSchema,
      'selectionModelType':
          SchemaHelper.objectSchema(SelectionModelTypeSchema.id),
      'showHorizontalFollowLine': SchemaHelper.objectSchema(
        LinePointHighlighterFollowLineTypeSchema.id,
      ),
      'showVerticalFollowLine': SchemaHelper.objectSchema(
        LinePointHighlighterFollowLineTypeSchema.id,
      ),
      'symbolRenderer': SchemaHelper.objectSchema(SymbolRendererSchema.id)
    },
  };
}

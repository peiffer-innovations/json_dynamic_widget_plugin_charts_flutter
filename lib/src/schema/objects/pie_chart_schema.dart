import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_theme/json_theme_schemas.dart';

class PieChartSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/pie_chart.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_flutter/latest/flutter/PieChart-class.html',
    'title': 'PieChart',
    'type': 'object',
    'additionalProperties': false,
    'required': ['series'],
    'properties': {
      'animate': SchemaHelper.boolSchema,
      'animationDuration': SchemaHelper.numberSchema,
      'behaviors': SchemaHelper.arraySchema(
        ChartBehaviorSchema.id,
        includeObject: true,
      ),
      'defaultInteractions': SchemaHelper.boolSchema,
      'defaultRenderer': SchemaHelper.objectSchema(ArcRendererConfigSchema.id),
      'layoutConfig': SchemaHelper.objectSchema(LayoutConfigSchema.id),
      'rtlSpec': SchemaHelper.objectSchema(RTLSpecSchema.id),
      'series': SchemaHelper.arraySchema(
        SeriesSchema.id,
        includeObject: true,
      ),
      'selectionModels': SchemaHelper.arraySchema(
        SelectionModelTypeSchema.id,
        includeObject: true,
      ),
    },
  };
}

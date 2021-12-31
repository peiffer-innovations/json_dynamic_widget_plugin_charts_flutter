import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_theme/json_theme_schemas.dart';

class LineChartSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/line_chart.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_flutter/latest/flutter/LineChart-class.html',
    'title': 'LineChart',
    'type': 'object',
    'additionalProperties': false,
    'required': ['series'],
    'properties': {
      'animate': SchemaHelper.boolSchema,
      'animationDuration': SchemaHelper.numberSchema,
      'barGroupingType': SchemaHelper.objectSchema(BarGroupingTypeSchema.id),
      'barRendererDecorator': SchemaHelper.anySchema,
      'behaviors': SchemaHelper.anySchema,
      'customSeriesRenderers': SchemaHelper.anySchema,
      'defaultInteractions': SchemaHelper.boolSchema,
      'defaultRenderer': SchemaHelper.objectSchema(
        LineRendererConfigSchema.id,
      ),
      'disjointMeasureAxes': SchemaHelper.anySchema,
      'domainAxis': SchemaHelper.objectSchema(AxisSpecSchema.id),
      'flipVerticalAxis': SchemaHelper.boolSchema,
      'layoutConfig': SchemaHelper.objectSchema(LayoutConfigSchema.id),
      'primaryMeasureAxis': SchemaHelper.objectSchema(NumericAxisSpecSchema.id),
      'rtlSpec': SchemaHelper.objectSchema(RTLSpecSchema.id),
      'secondaryMeasureAxis': SchemaHelper.objectSchema(
        NumericAxisSpecSchema.id,
      ),
      'series': SchemaHelper.arraySchema(
        SeriesSchema.id,
        includeObject: true,
      ),
      'selectionModels': SchemaHelper.arraySchema(
        SelectionModelTypeSchema.id,
        includeObject: true,
      ),
      'userManagedState': SchemaHelper.stringSchema,
      'vertical': SchemaHelper.boolSchema,
    },
  };
}

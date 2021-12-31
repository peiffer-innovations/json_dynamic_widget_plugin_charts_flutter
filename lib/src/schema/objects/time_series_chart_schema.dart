import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_theme/json_theme_schemas.dart';

class TimeSeriesChartSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/time_series_chart.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_flutter/latest/flutter/TimeSeriesChart-class.html',
    'title': 'TimeSeriesChart',
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
      'customSeriesRenderers': SchemaHelper.arraySchema(
        SeriesRendererConfigSchema.id,
        includeObject: true,
      ),
      'dateTimeFactory': SchemaHelper.stringSchema,
      'defaultInteractions': SchemaHelper.boolSchema,
      'defaultRenderer': SchemaHelper.objectSchema(
        SeriesRendererConfigSchema.id,
      ),
      'disjointMeasureAxes': SchemaHelper.anySchema,
      'domainAxis': SchemaHelper.objectSchema(
        AxisSpecSchema.id,
      ),
      'flipVerticalAxis': SchemaHelper.boolSchema,
      'layoutConfig': SchemaHelper.objectSchema(
        LayoutConfigSchema.id,
      ),
      'primaryMeasureAxis': SchemaHelper.objectSchema(
        NumericAxisSpecSchema.id,
      ),
      'secondaryMeasureAxis': SchemaHelper.objectSchema(
        NumericAxisSpecSchema.id,
      ),
      'series': SchemaHelper.arraySchema(SeriesSchema.id),
      'selectionModels': SchemaHelper.arraySchema(
        SelectionModelSchema.id,
        includeObject: true,
      ),
      'userManagedState': SchemaHelper.stringSchema,
    },
  };
}

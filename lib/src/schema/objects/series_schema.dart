import 'package:json_theme/json_theme_schemas.dart';

class SeriesSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/series.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/Series-class.html',
    'title': 'Series',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'areaColorFn': SchemaHelper.stringSchema,
      'colorFn': SchemaHelper.stringSchema,
      'dashPatternFn': SchemaHelper.stringSchema,
      'data': SchemaHelper.anySchema,
      'displayName': SchemaHelper.stringSchema,
      'domainFormatterFn': SchemaHelper.stringSchema,
      'domainLowerBoundFn': SchemaHelper.stringSchema,
      'domainUpperBoundFn': SchemaHelper.stringSchema,
      'domainFn': SchemaHelper.stringSchema,
      'fillColorFn': SchemaHelper.stringSchema,
      'fillPatternFn': SchemaHelper.stringSchema,
      'id': SchemaHelper.stringSchema,
      'insideLabelStyleAccessorFn': SchemaHelper.stringSchema,
      'keyFn': SchemaHelper.stringSchema,
      'labelAccessorFn': SchemaHelper.stringSchema,
      'measureFn': SchemaHelper.stringSchema,
      'measureFormatterFn': SchemaHelper.stringSchema,
      'measureLowerBoundFn': SchemaHelper.stringSchema,
      'measureOffsetFn': SchemaHelper.stringSchema,
      'measureUpperBoundFn': SchemaHelper.stringSchema,
      'outsideLabelStyleAccessorFn': SchemaHelper.stringSchema,
      'overlaySeries': SchemaHelper.boolSchema,
      'patternColorFn': SchemaHelper.stringSchema,
      'radiusPxFn': SchemaHelper.stringSchema,
      'seriesCategory': SchemaHelper.stringSchema,
      'seriesColor': SchemaHelper.objectSchema(ColorSchema.id),
      'strokeWidthPxFn': SchemaHelper.stringSchema,
    },
  };
}

import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';

class SeriesRendererConfigSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/series_renderer_config.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/SeriesRendererConfig-class.html',
    'title': 'SeriesRendererConfig',
    'oneOf': [
      {
        'type': 'string',
      },
      {
        r'$ref': ArcRendererConfigSchema.id,
      },
      {
        r'$ref': BarRendererConfigSchema.id,
      },
      {
        r'$ref': BarTargetLineRendererConfigSchema.id,
      },
      {
        r'$ref': LineRendererConfigSchema.id,
      },
      {
        r'$ref': PointRendererConfigSchema.id,
      },
      {
        r'$ref': SymbolAnnotationRendererConfigSchema.id,
      },
    ],
  };
}

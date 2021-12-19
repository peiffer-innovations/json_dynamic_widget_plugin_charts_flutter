import 'package:json_theme/json_theme_schemas.dart';

class RangeAnnotationAxisTypeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/range_annotation_axis_type.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/RangeAnnotationAxisType.html',
    'type': 'string',
    'title': 'RangeAnnotationAxisType',
    'oneOf': SchemaHelper.enumSchema([
      'domain',
      'measure',
    ]),
  };
}

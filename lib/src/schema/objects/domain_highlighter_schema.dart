import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_theme/json_theme_schemas.dart';

class DomainHighlighterSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/domain_highlighter.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/DomainHighlighter-class.html',
    'title': 'DomainHighlighter',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'selectionModelType': SchemaHelper.objectSchema(
        SelectionModelTypeSchema.id,
      ),
      'type': {
        'type': 'string',
        'enum': [
          'domain_highlighter',
        ],
      },
    },
  };
}

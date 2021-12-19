import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_theme/json_theme_schemas.dart';

class SymbolAnnotationRendererConfigSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_charts_flutter/symbol_annotation_renderer_config.json';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    r'$comment':
        'https://pub.dev/documentation/charts_common/latest/common/SymbolAnnotationRendererConfig-class.html',
    'title': 'SymbolAnnotationRendererConfig',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'customRendererId': SchemaHelper.stringSchema,
      'customSymbolRenderers': SchemaHelper.anySchema,
      'pointRendererDecorators': SchemaHelper.stringSchema,
      'radiusPx': SchemaHelper.numberSchema,
      'showBottomSeparatorLine': SchemaHelper.boolSchema,
      'showSeparatorLines': SchemaHelper.boolSchema,
      'symbolRenderer': SchemaHelper.objectSchema(SymbolRendererSchema.id),
      'verticalSymbolBottomPaddingPx': SchemaHelper.numberSchema,
      'verticalSymbolTopPaddingPx': SchemaHelper.numberSchema,
      'type': {
        'type': 'string',
        'enum': [
          'symbol_annotation',
        ],
      },
    },
  };
}

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget_plugin_charts_flutter/json_dynamic_widget_plugin_charts_flutter.dart';
import 'package:json_theme/json_theme_schemas.dart';

import 'schema/json_charts_flutter_schemas.dart';
import 'values/create_series_function.dart';
import 'values/material_palette_values.dart';

class JsonChartsFlutterPlugin {
  static void bind(JsonWidgetRegistry registry) {
    var schemaCache = SchemaCache();
    Enums.all.addAll(JsonChartsFlutterSchemas.enums.keys);

    schemaCache.addSchemas(JsonChartsFlutterSchemas.enums);
    schemaCache.addSchemas(JsonChartsFlutterSchemas.objects);

    MaterialPaletteValues.values.forEach(
      (key, value) => registry.setValue(key, value),
    );

    registry.registerFunctions({
      CreateSeriesFunction.id: CreateSeriesFunction.body,
    });

    registry.registerCustomBuilders({
      BarChartBuilder.type: JsonWidgetBuilderContainer(
        builder: BarChartBuilder.fromDynamic,
        schemaId: BarChartSchema.id,
      ),
      LineChartBuilder.type: JsonWidgetBuilderContainer(
        builder: LineChartBuilder.fromDynamic,
        schemaId: LineChartSchema.id,
      ),
      NumericPieChartBuilder.type: JsonWidgetBuilderContainer(
        builder: NumericPieChartBuilder.fromDynamic,
        schemaId: PieChartSchema.id,
      ),
      NumericComboChartBuilder.type: JsonWidgetBuilderContainer(
        builder: NumericComboChartBuilder.fromDynamic,
        schemaId: NumericComboChartSchema.id,
      ),
      OrdinalComboChartBuilder.type: JsonWidgetBuilderContainer(
        builder: OrdinalComboChartBuilder.fromDynamic,
        schemaId: OrdinalComboChartSchema.id,
      ),
      ScatterPlotChartBuilder.type: JsonWidgetBuilderContainer(
        builder: ScatterPlotChartBuilder.fromDynamic,
        schemaId: ScatterPlotChartSchema.id,
      ),
      StringPieChartBuilder.type: JsonWidgetBuilderContainer(
        builder: StringPieChartBuilder.fromDynamic,
        schemaId: PieChartSchema.id,
      ),
      TimeSeriesChartBuilder.type: JsonWidgetBuilderContainer(
        builder: TimeSeriesChartBuilder.fromDynamic,
        schemaId: TimeSeriesChartSchema.id,
      ),
    });
  }
}

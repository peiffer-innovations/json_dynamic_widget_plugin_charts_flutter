import 'package:community_charts_flutter/flutter.dart' as charts;
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class SelectionCallbackFunctions {
  static final Map<String, dynamic> functions = {
    'on_selection_callback_change': (charts.SelectionModel model) {
      final registry = JsonWidgetRegistry.instance;
      final datum = model.selectedDatum;

      if (datum.isNotEmpty == true) {
        registry.setValue(
            'selectionCallbackTime', datum.first.datum.domain.toString());

        datum.forEach((charts.SeriesDatum datumPair) {
          final id = 'selectionCallbackSales${datumPair.series.id}';
          registry.setValue(
            id,
            datumPair.datum.measure,
          );
        });
      }
    }
  };
}

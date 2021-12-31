class SeriesLegendWithMeasuresFunctions {
  static final Map<String, dynamic> functions = {
    'series_legend_with_measures_measure_formatter': (num? value) =>
        value == null ? '-' : '${value}k',
  };
}

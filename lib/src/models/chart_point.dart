import 'package:json_class/json_class.dart';

class ChartPoint<D> extends JsonClass {
  ChartPoint({
    required this.domain,
    required this.label,
    required this.measure,
  });

  final D domain;
  final String? label;
  final num measure;

  static ChartPoint<D> fromDynamic<D>(dynamic map) {
    if (map == null) {
      throw Exception('[ChartPoint]: map is null');
    }

    var domain = map['domain'];
    if (D is int) {
      domain = JsonClass.parseInt(domain);
    } else if (D is double) {
      domain = JsonClass.parseDouble(domain);
    } else if (D is DateTime) {
      domain = JsonClass.parseDateTime(domain);
    }

    return ChartPoint<D>(
      domain: domain!,
      label: map['label']?.toString(),
      measure: JsonClass.parseDouble(map['measure'])!,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'domain': domain,
        'label': label,
        'measure': measure,
      };
}

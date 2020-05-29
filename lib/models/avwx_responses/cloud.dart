import 'package:json_annotation/json_annotation.dart';

part 'cloud.g.dart';

@JsonSerializable()
class Cloud {
  final String repr;
  final String type;
  final int altitude;
  final Map<String, dynamic> modifier;
  final Map<String, dynamic> direction;

  Cloud(this.repr, this.type, this.altitude, this.modifier, this.direction);

  factory Cloud.fromJson(Map<String, dynamic> json) => _$CloudFromJson(json);
  Map<String, dynamic> toJson() => _$CloudToJson(this);
}
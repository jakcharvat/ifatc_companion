import 'package:json_annotation/json_annotation.dart';

part 'runway.g.dart';

@JsonSerializable()
class Runway {
  @JsonKey(name: 'length_ft') final int length;
  @JsonKey(name: 'width_ft') final int width;
  @JsonKey(name: 'ident1') final String end1;
  @JsonKey(name: 'ident2') final String end2;

  Runway(this.length, this.width, this.end1, this.end2);

  factory Runway.fromJson(Map<String, dynamic> json) => _$RunwayFromJson(json);
  Map<String, dynamic> toJson() => _$RunwayToJson(this);
}
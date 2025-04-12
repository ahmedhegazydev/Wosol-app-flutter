import 'package:json_annotation/json_annotation.dart';

part 'IntroItem.g.dart';

@JsonSerializable()
class IntroItem {
  @JsonKey(name: 'ItemId')
  final int itemId;

  @JsonKey(name: 'ItemFields')
  final ItemFields itemFields;

  IntroItem({required this.itemId, required this.itemFields});

  factory IntroItem.fromJson(Map<String, dynamic> json) =>
      _$IntroItemFromJson(json);

  Map<String, dynamic> toJson() => _$IntroItemToJson(this);
}

@JsonSerializable()
class ItemFields {
  @JsonKey(name: 'Title')
  final String title;

  @JsonKey(name: 'IntroTitle')
  final String introTitle;

  @JsonKey(name: 'IntroDetails')
  final String introDetails;

  @JsonKey(name: 'IntroIcon')
  final IntroIcon introIcon;

  @JsonKey(name: 'IsActive')
  final bool isActive;

  @JsonKey(name: 'ID')
  final int id;

  @JsonKey(name: 'Modified')
  final String modified;

  @JsonKey(name: 'Created')
  final String created;

  @JsonKey(name: 'Order')
  final double order;

  @JsonKey(name: 'GUID')
  final String guid;

  ItemFields({
    required this.title,
    required this.introTitle,
    required this.introDetails,
    required this.introIcon,
    required this.isActive,
    required this.id,
    required this.modified,
    required this.created,
    required this.order,
    required this.guid,
  });

  factory ItemFields.fromJson(Map<String, dynamic> json) =>
      _$ItemFieldsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemFieldsToJson(this);
}

@JsonSerializable()
class IntroIcon {
  @JsonKey(name: 'Description')
  final String description;

  @JsonKey(name: 'Url')
  final String url;

  @JsonKey(name: 'TypeId')
  final String typeId;

  IntroIcon({
    required this.description,
    required this.url,
    required this.typeId,
  });

  factory IntroIcon.fromJson(Map<String, dynamic> json) =>
      _$IntroIconFromJson(json);

  Map<String, dynamic> toJson() => _$IntroIconToJson(this);
}
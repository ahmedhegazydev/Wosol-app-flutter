// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ItemTutorial.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemTutorial _$ItemTutorialFromJson(Map<String, dynamic> json) => ItemTutorial(
      itemId: (json['ItemId'] as num).toInt(),
      itemFields:
          ItemFields.fromJson(json['ItemFields'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemTutorialToJson(ItemTutorial instance) =>
    <String, dynamic>{
      'ItemId': instance.itemId,
      'ItemFields': instance.itemFields,
    };

ItemFields _$ItemFieldsFromJson(Map<String, dynamic> json) => ItemFields(
      title: json['Title'] as String,
      textKey: json['TextKey'] as String,
      textValue: json['TextValue'] as String,
      language: json['Language'] as String,
      screenName: (json['ScreenName'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      id: (json['ID'] as num).toInt(),
      modified: json['Modified'] as String,
      created: json['Created'] as String,
      order: (json['Order'] as num).toDouble(),
      guid: json['GUID'] as String,
    );

Map<String, dynamic> _$ItemFieldsToJson(ItemFields instance) =>
    <String, dynamic>{
      'Title': instance.title,
      'TextKey': instance.textKey,
      'TextValue': instance.textValue,
      'Language': instance.language,
      'ScreenName': instance.screenName,
      'ID': instance.id,
      'Modified': instance.modified,
      'Created': instance.created,
      'Order': instance.order,
      'GUID': instance.guid,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ItemTutorial.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemTutorial _$ItemTutorialFromJson(Map<String, dynamic> json) => ItemTutorial(
      itemId: (json['itemId'] as num).toInt(),
      itemFields:
          ItemFields.fromJson(json['itemFields'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemTutorialToJson(ItemTutorial instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'itemFields': instance.itemFields,
    };

ItemFields _$ItemFieldsFromJson(Map<String, dynamic> json) => ItemFields(
      title: json['title'] as String,
      textKey: json['textKey'] as String,
      textValue: json['textValue'] as String,
      language: json['language'] as String,
      screenName: (json['screenName'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      id: (json['id'] as num).toInt(),
      modified: json['modified'] as String,
      created: json['created'] as String,
      order: (json['order'] as num).toDouble(),
      guid: json['guid'] as String,
    );

Map<String, dynamic> _$ItemFieldsToJson(ItemFields instance) =>
    <String, dynamic>{
      'title': instance.title,
      'textKey': instance.textKey,
      'textValue': instance.textValue,
      'language': instance.language,
      'screenName': instance.screenName,
      'id': instance.id,
      'modified': instance.modified,
      'created': instance.created,
      'order': instance.order,
      'guid': instance.guid,
    };

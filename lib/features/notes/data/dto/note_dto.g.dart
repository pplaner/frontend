// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NoteDto _$NoteDtoFromJson(Map<String, dynamic> json) => _NoteDto(
  id: json['id'] as String,
  encryptedTitle: const Uint8ListConverter().fromJson(
    json['encryptedTitle'] as String,
  ),
  encryptedContent: const Uint8ListConverter().fromJson(
    json['encryptedContent'] as String,
  ),
  version: (json['version'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  deletedAt: json['deletedAt'] == null
      ? null
      : DateTime.parse(json['deletedAt'] as String),
  projectId: json['projectId'] as String?,
);

Map<String, dynamic> _$NoteDtoToJson(_NoteDto instance) => <String, dynamic>{
  'id': instance.id,
  'encryptedTitle': const Uint8ListConverter().toJson(instance.encryptedTitle),
  'encryptedContent': const Uint8ListConverter().toJson(
    instance.encryptedContent,
  ),
  'version': instance.version,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'deletedAt': instance.deletedAt?.toIso8601String(),
  'projectId': instance.projectId,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectDto _$ProjectDtoFromJson(Map<String, dynamic> json) => _ProjectDto(
  id: json['id'] as String,
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

Map<String, dynamic> _$ProjectDtoToJson(_ProjectDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'encryptedContent': const Uint8ListConverter().toJson(
        instance.encryptedContent,
      ),
      'version': instance.version,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'projectId': instance.projectId,
    };

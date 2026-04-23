import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/core/utils/json_helpers.dart';

part 'project_dto.g.dart';
part 'project_dto.freezed.dart';

@freezed
sealed class ProjectDto with _$ProjectDto {
  const factory ProjectDto({
    required String id,

    @Uint8ListConverter() required Uint8List encryptedContent,

    required int version,

    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,

    String? projectId,
  }) = _ProjectDto;

  factory ProjectDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectDtoFromJson(json);
}

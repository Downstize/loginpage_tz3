// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetScheduleEntityCollection on Isar {
  IsarCollection<ScheduleEntity> get scheduleEntitys => this.collection();
}

const ScheduleEntitySchema = CollectionSchema(
  name: r'ScheduleEntity',
  id: -8600403329115905495,
  properties: {
    r'auditory': PropertySchema(
      id: 0,
      name: r'auditory',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    ),
    r'numWeek': PropertySchema(
      id: 2,
      name: r'numWeek',
      type: IsarType.long,
    ),
    r'teacher': PropertySchema(
      id: 3,
      name: r'teacher',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 4,
      name: r'type',
      type: IsarType.string,
    )
  },
  estimateSize: _scheduleEntityEstimateSize,
  serialize: _scheduleEntitySerialize,
  deserialize: _scheduleEntityDeserialize,
  deserializeProp: _scheduleEntityDeserializeProp,
  idName: r'scheduleId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _scheduleEntityGetId,
  getLinks: _scheduleEntityGetLinks,
  attach: _scheduleEntityAttach,
  version: '3.0.5',
);

int _scheduleEntityEstimateSize(
  ScheduleEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.teacher.length * 3;
  bytesCount += 3 + object.type.length * 3;
  return bytesCount;
}

void _scheduleEntitySerialize(
  ScheduleEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.auditory);
  writer.writeString(offsets[1], object.name);
  writer.writeLong(offsets[2], object.numWeek);
  writer.writeString(offsets[3], object.teacher);
  writer.writeString(offsets[4], object.type);
}

ScheduleEntity _scheduleEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ScheduleEntity();
  object.auditory = reader.readLong(offsets[0]);
  object.name = reader.readString(offsets[1]);
  object.numWeek = reader.readLong(offsets[2]);
  object.scheduleId = id;
  object.teacher = reader.readString(offsets[3]);
  object.type = reader.readString(offsets[4]);
  return object;
}

P _scheduleEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _scheduleEntityGetId(ScheduleEntity object) {
  return object.scheduleId;
}

List<IsarLinkBase<dynamic>> _scheduleEntityGetLinks(ScheduleEntity object) {
  return [];
}

void _scheduleEntityAttach(
    IsarCollection<dynamic> col, Id id, ScheduleEntity object) {
  object.scheduleId = id;
}

extension ScheduleEntityQueryWhereSort
    on QueryBuilder<ScheduleEntity, ScheduleEntity, QWhere> {
  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterWhere> anyScheduleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ScheduleEntityQueryWhere
    on QueryBuilder<ScheduleEntity, ScheduleEntity, QWhereClause> {
  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterWhereClause>
      scheduleIdEqualTo(Id scheduleId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: scheduleId,
        upper: scheduleId,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterWhereClause>
      scheduleIdNotEqualTo(Id scheduleId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: scheduleId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: scheduleId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: scheduleId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: scheduleId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterWhereClause>
      scheduleIdGreaterThan(Id scheduleId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: scheduleId, includeLower: include),
      );
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterWhereClause>
      scheduleIdLessThan(Id scheduleId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: scheduleId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterWhereClause>
      scheduleIdBetween(
    Id lowerScheduleId,
    Id upperScheduleId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerScheduleId,
        includeLower: includeLower,
        upper: upperScheduleId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ScheduleEntityQueryFilter
    on QueryBuilder<ScheduleEntity, ScheduleEntity, QFilterCondition> {
  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      auditoryEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'auditory',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      auditoryGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'auditory',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      auditoryLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'auditory',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      auditoryBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'auditory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      numWeekEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numWeek',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      numWeekGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numWeek',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      numWeekLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numWeek',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      numWeekBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numWeek',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      scheduleIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scheduleId',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      scheduleIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scheduleId',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      scheduleIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scheduleId',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      scheduleIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scheduleId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      teacherEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'teacher',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      teacherGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'teacher',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      teacherLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'teacher',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      teacherBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'teacher',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      teacherStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'teacher',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      teacherEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'teacher',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      teacherContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'teacher',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      teacherMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'teacher',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      teacherIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'teacher',
        value: '',
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      teacherIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'teacher',
        value: '',
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension ScheduleEntityQueryObject
    on QueryBuilder<ScheduleEntity, ScheduleEntity, QFilterCondition> {}

extension ScheduleEntityQueryLinks
    on QueryBuilder<ScheduleEntity, ScheduleEntity, QFilterCondition> {}

extension ScheduleEntityQuerySortBy
    on QueryBuilder<ScheduleEntity, ScheduleEntity, QSortBy> {
  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterSortBy> sortByAuditory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditory', Sort.asc);
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterSortBy>
      sortByAuditoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditory', Sort.desc);
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterSortBy> sortByNumWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numWeek', Sort.asc);
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterSortBy>
      sortByNumWeekDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numWeek', Sort.desc);
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterSortBy> sortByTeacher() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teacher', Sort.asc);
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterSortBy>
      sortByTeacherDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teacher', Sort.desc);
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension ScheduleEntityQuerySortThenBy
    on QueryBuilder<ScheduleEntity, ScheduleEntity, QSortThenBy> {
  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterSortBy> thenByAuditory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditory', Sort.asc);
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterSortBy>
      thenByAuditoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditory', Sort.desc);
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterSortBy> thenByNumWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numWeek', Sort.asc);
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterSortBy>
      thenByNumWeekDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numWeek', Sort.desc);
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterSortBy>
      thenByScheduleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleId', Sort.asc);
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterSortBy>
      thenByScheduleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleId', Sort.desc);
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterSortBy> thenByTeacher() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teacher', Sort.asc);
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterSortBy>
      thenByTeacherDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teacher', Sort.desc);
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension ScheduleEntityQueryWhereDistinct
    on QueryBuilder<ScheduleEntity, ScheduleEntity, QDistinct> {
  QueryBuilder<ScheduleEntity, ScheduleEntity, QDistinct> distinctByAuditory() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'auditory');
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QDistinct> distinctByNumWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numWeek');
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QDistinct> distinctByTeacher(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'teacher', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ScheduleEntity, ScheduleEntity, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension ScheduleEntityQueryProperty
    on QueryBuilder<ScheduleEntity, ScheduleEntity, QQueryProperty> {
  QueryBuilder<ScheduleEntity, int, QQueryOperations> scheduleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scheduleId');
    });
  }

  QueryBuilder<ScheduleEntity, int, QQueryOperations> auditoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'auditory');
    });
  }

  QueryBuilder<ScheduleEntity, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ScheduleEntity, int, QQueryOperations> numWeekProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numWeek');
    });
  }

  QueryBuilder<ScheduleEntity, String, QQueryOperations> teacherProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'teacher');
    });
  }

  QueryBuilder<ScheduleEntity, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}

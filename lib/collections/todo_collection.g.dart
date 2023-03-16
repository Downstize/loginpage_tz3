// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetToDoEntityCollection on Isar {
  IsarCollection<ToDoEntity> get toDoEntitys => this.collection();
}

const ToDoEntitySchema = CollectionSchema(
  name: r'ToDoEntity',
  id: 910592610728692763,
  properties: {
    r'description': PropertySchema(
      id: 0,
      name: r'description',
      type: IsarType.string,
    ),
    r'expiry': PropertySchema(
      id: 1,
      name: r'expiry',
      type: IsarType.dateTime,
    ),
    r'issue': PropertySchema(
      id: 2,
      name: r'issue',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 4,
      name: r'type',
      type: IsarType.string,
    )
  },
  estimateSize: _toDoEntityEstimateSize,
  serialize: _toDoEntitySerialize,
  deserialize: _toDoEntityDeserialize,
  deserializeProp: _toDoEntityDeserializeProp,
  idName: r'toDoId',
  indexes: {
    r'issue': IndexSchema(
      id: -4097751367728898604,
      name: r'issue',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'issue',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'expiry': IndexSchema(
      id: 1237021439483585172,
      name: r'expiry',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'expiry',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _toDoEntityGetId,
  getLinks: _toDoEntityGetLinks,
  attach: _toDoEntityAttach,
  version: '3.0.5',
);

int _toDoEntityEstimateSize(
  ToDoEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.type.length * 3;
  return bytesCount;
}

void _toDoEntitySerialize(
  ToDoEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.description);
  writer.writeDateTime(offsets[1], object.expiry);
  writer.writeDateTime(offsets[2], object.issue);
  writer.writeString(offsets[3], object.name);
  writer.writeString(offsets[4], object.type);
}

ToDoEntity _toDoEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ToDoEntity();
  object.description = reader.readString(offsets[0]);
  object.expiry = reader.readDateTime(offsets[1]);
  object.issue = reader.readDateTime(offsets[2]);
  object.name = reader.readString(offsets[3]);
  object.toDoId = id;
  object.type = reader.readString(offsets[4]);
  return object;
}

P _toDoEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _toDoEntityGetId(ToDoEntity object) {
  return object.toDoId;
}

List<IsarLinkBase<dynamic>> _toDoEntityGetLinks(ToDoEntity object) {
  return [];
}

void _toDoEntityAttach(IsarCollection<dynamic> col, Id id, ToDoEntity object) {
  object.toDoId = id;
}

extension ToDoEntityQueryWhereSort
    on QueryBuilder<ToDoEntity, ToDoEntity, QWhere> {
  QueryBuilder<ToDoEntity, ToDoEntity, QAfterWhere> anyToDoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterWhere> anyIssue() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'issue'),
      );
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterWhere> anyExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'expiry'),
      );
    });
  }
}

extension ToDoEntityQueryWhere
    on QueryBuilder<ToDoEntity, ToDoEntity, QWhereClause> {
  QueryBuilder<ToDoEntity, ToDoEntity, QAfterWhereClause> toDoIdEqualTo(
      Id toDoId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: toDoId,
        upper: toDoId,
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterWhereClause> toDoIdNotEqualTo(
      Id toDoId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: toDoId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: toDoId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: toDoId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: toDoId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterWhereClause> toDoIdGreaterThan(
      Id toDoId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: toDoId, includeLower: include),
      );
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterWhereClause> toDoIdLessThan(
      Id toDoId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: toDoId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterWhereClause> toDoIdBetween(
    Id lowerToDoId,
    Id upperToDoId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerToDoId,
        includeLower: includeLower,
        upper: upperToDoId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterWhereClause> issueEqualTo(
      DateTime issue) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'issue',
        value: [issue],
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterWhereClause> issueNotEqualTo(
      DateTime issue) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'issue',
              lower: [],
              upper: [issue],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'issue',
              lower: [issue],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'issue',
              lower: [issue],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'issue',
              lower: [],
              upper: [issue],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterWhereClause> issueGreaterThan(
    DateTime issue, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'issue',
        lower: [issue],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterWhereClause> issueLessThan(
    DateTime issue, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'issue',
        lower: [],
        upper: [issue],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterWhereClause> issueBetween(
    DateTime lowerIssue,
    DateTime upperIssue, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'issue',
        lower: [lowerIssue],
        includeLower: includeLower,
        upper: [upperIssue],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterWhereClause> expiryEqualTo(
      DateTime expiry) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'expiry',
        value: [expiry],
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterWhereClause> expiryNotEqualTo(
      DateTime expiry) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'expiry',
              lower: [],
              upper: [expiry],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'expiry',
              lower: [expiry],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'expiry',
              lower: [expiry],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'expiry',
              lower: [],
              upper: [expiry],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterWhereClause> expiryGreaterThan(
    DateTime expiry, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'expiry',
        lower: [expiry],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterWhereClause> expiryLessThan(
    DateTime expiry, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'expiry',
        lower: [],
        upper: [expiry],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterWhereClause> expiryBetween(
    DateTime lowerExpiry,
    DateTime upperExpiry, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'expiry',
        lower: [lowerExpiry],
        includeLower: includeLower,
        upper: [upperExpiry],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ToDoEntityQueryFilter
    on QueryBuilder<ToDoEntity, ToDoEntity, QFilterCondition> {
  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition>
      descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition>
      descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition>
      descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> expiryEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiry',
        value: value,
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> expiryGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expiry',
        value: value,
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> expiryLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expiry',
        value: value,
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> expiryBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expiry',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> issueEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'issue',
        value: value,
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> issueGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'issue',
        value: value,
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> issueLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'issue',
        value: value,
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> issueBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'issue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> toDoIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toDoId',
        value: value,
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> toDoIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'toDoId',
        value: value,
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> toDoIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'toDoId',
        value: value,
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> toDoIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'toDoId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> typeEqualTo(
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

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> typeGreaterThan(
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

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> typeLessThan(
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

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> typeBetween(
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

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> typeStartsWith(
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

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> typeEndsWith(
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

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> typeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> typeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension ToDoEntityQueryObject
    on QueryBuilder<ToDoEntity, ToDoEntity, QFilterCondition> {}

extension ToDoEntityQueryLinks
    on QueryBuilder<ToDoEntity, ToDoEntity, QFilterCondition> {}

extension ToDoEntityQuerySortBy
    on QueryBuilder<ToDoEntity, ToDoEntity, QSortBy> {
  QueryBuilder<ToDoEntity, ToDoEntity, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterSortBy> sortByExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiry', Sort.asc);
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterSortBy> sortByExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiry', Sort.desc);
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterSortBy> sortByIssue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issue', Sort.asc);
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterSortBy> sortByIssueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issue', Sort.desc);
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension ToDoEntityQuerySortThenBy
    on QueryBuilder<ToDoEntity, ToDoEntity, QSortThenBy> {
  QueryBuilder<ToDoEntity, ToDoEntity, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterSortBy> thenByExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiry', Sort.asc);
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterSortBy> thenByExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiry', Sort.desc);
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterSortBy> thenByIssue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issue', Sort.asc);
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterSortBy> thenByIssueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issue', Sort.desc);
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterSortBy> thenByToDoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toDoId', Sort.asc);
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterSortBy> thenByToDoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toDoId', Sort.desc);
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension ToDoEntityQueryWhereDistinct
    on QueryBuilder<ToDoEntity, ToDoEntity, QDistinct> {
  QueryBuilder<ToDoEntity, ToDoEntity, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QDistinct> distinctByExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expiry');
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QDistinct> distinctByIssue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'issue');
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ToDoEntity, ToDoEntity, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension ToDoEntityQueryProperty
    on QueryBuilder<ToDoEntity, ToDoEntity, QQueryProperty> {
  QueryBuilder<ToDoEntity, int, QQueryOperations> toDoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'toDoId');
    });
  }

  QueryBuilder<ToDoEntity, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<ToDoEntity, DateTime, QQueryOperations> expiryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expiry');
    });
  }

  QueryBuilder<ToDoEntity, DateTime, QQueryOperations> issueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'issue');
    });
  }

  QueryBuilder<ToDoEntity, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ToDoEntity, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}

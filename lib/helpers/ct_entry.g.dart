// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ct_entry.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCTEntryCollection on Isar {
  IsarCollection<CTEntry> get cTEntrys => this.collection();
}

const CTEntrySchema = CollectionSchema(
  name: r'CTEntry',
  id: -8154954864545053587,
  properties: {
    r'archRadius': PropertySchema(
      id: 0,
      name: r'archRadius',
      type: IsarType.double,
    ),
    r'ctDiameter': PropertySchema(
      id: 1,
      name: r'ctDiameter',
      type: IsarType.double,
    ),
    r'ctIntPressure': PropertySchema(
      id: 2,
      name: r'ctIntPressure',
      type: IsarType.double,
    ),
    r'ctLife': PropertySchema(
      id: 3,
      name: r'ctLife',
      type: IsarType.double,
    ),
    r'ctName': PropertySchema(
      id: 4,
      name: r'ctName',
      type: IsarType.string,
    ),
    r'ctWallThickness': PropertySchema(
      id: 5,
      name: r'ctWallThickness',
      type: IsarType.double,
    ),
    r'currentLife': PropertySchema(
      id: 6,
      name: r'currentLife',
      type: IsarType.double,
    ),
    r'drumDiameter': PropertySchema(
      id: 7,
      name: r'drumDiameter',
      type: IsarType.double,
    ),
    r'elasticModulus': PropertySchema(
      id: 8,
      name: r'elasticModulus',
      type: IsarType.long,
    ),
    r'jobs': PropertySchema(
      id: 9,
      name: r'jobs',
      type: IsarType.objectList,
      target: r'Job',
    )
  },
  estimateSize: _cTEntryEstimateSize,
  serialize: _cTEntrySerialize,
  deserialize: _cTEntryDeserialize,
  deserializeProp: _cTEntryDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'Job': JobSchema},
  getId: _cTEntryGetId,
  getLinks: _cTEntryGetLinks,
  attach: _cTEntryAttach,
  version: '3.1.0+1',
);

int _cTEntryEstimateSize(
  CTEntry object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.ctName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.jobs.length * 3;
  {
    final offsets = allOffsets[Job]!;
    for (var i = 0; i < object.jobs.length; i++) {
      final value = object.jobs[i];
      bytesCount += JobSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _cTEntrySerialize(
  CTEntry object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.archRadius);
  writer.writeDouble(offsets[1], object.ctDiameter);
  writer.writeDouble(offsets[2], object.ctIntPressure);
  writer.writeDouble(offsets[3], object.ctLife);
  writer.writeString(offsets[4], object.ctName);
  writer.writeDouble(offsets[5], object.ctWallThickness);
  writer.writeDouble(offsets[6], object.currentLife);
  writer.writeDouble(offsets[7], object.drumDiameter);
  writer.writeLong(offsets[8], object.elasticModulus);
  writer.writeObjectList<Job>(
    offsets[9],
    allOffsets,
    JobSchema.serialize,
    object.jobs,
  );
}

CTEntry _cTEntryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CTEntry();
  object.archRadius = reader.readDoubleOrNull(offsets[0]);
  object.ctDiameter = reader.readDoubleOrNull(offsets[1]);
  object.ctIntPressure = reader.readDoubleOrNull(offsets[2]);
  object.ctLife = reader.readDoubleOrNull(offsets[3]);
  object.ctName = reader.readStringOrNull(offsets[4]);
  object.ctWallThickness = reader.readDoubleOrNull(offsets[5]);
  object.currentLife = reader.readDoubleOrNull(offsets[6]);
  object.drumDiameter = reader.readDoubleOrNull(offsets[7]);
  object.elasticModulus = reader.readLongOrNull(offsets[8]);
  object.id = id;
  object.jobs = reader.readObjectList<Job>(
        offsets[9],
        JobSchema.deserialize,
        allOffsets,
        Job(),
      ) ??
      [];
  return object;
}

P _cTEntryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readObjectList<Job>(
            offset,
            JobSchema.deserialize,
            allOffsets,
            Job(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _cTEntryGetId(CTEntry object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cTEntryGetLinks(CTEntry object) {
  return [];
}

void _cTEntryAttach(IsarCollection<dynamic> col, Id id, CTEntry object) {
  object.id = id;
}

extension CTEntryQueryWhereSort on QueryBuilder<CTEntry, CTEntry, QWhere> {
  QueryBuilder<CTEntry, CTEntry, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CTEntryQueryWhere on QueryBuilder<CTEntry, CTEntry, QWhereClause> {
  QueryBuilder<CTEntry, CTEntry, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CTEntryQueryFilter
    on QueryBuilder<CTEntry, CTEntry, QFilterCondition> {
  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> archRadiusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'archRadius',
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> archRadiusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'archRadius',
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> archRadiusEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'archRadius',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> archRadiusGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'archRadius',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> archRadiusLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'archRadius',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> archRadiusBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'archRadius',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctDiameterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ctDiameter',
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctDiameterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ctDiameter',
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctDiameterEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ctDiameter',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctDiameterGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ctDiameter',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctDiameterLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ctDiameter',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctDiameterBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ctDiameter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctIntPressureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ctIntPressure',
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition>
      ctIntPressureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ctIntPressure',
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctIntPressureEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ctIntPressure',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition>
      ctIntPressureGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ctIntPressure',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctIntPressureLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ctIntPressure',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctIntPressureBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ctIntPressure',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctLifeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ctLife',
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctLifeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ctLife',
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctLifeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ctLife',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctLifeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ctLife',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctLifeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ctLife',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctLifeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ctLife',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ctName',
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ctName',
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ctName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ctName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ctName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ctName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ctName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ctName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ctName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ctName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ctName',
        value: '',
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ctName',
        value: '',
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition>
      ctWallThicknessIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ctWallThickness',
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition>
      ctWallThicknessIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ctWallThickness',
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctWallThicknessEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ctWallThickness',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition>
      ctWallThicknessGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ctWallThickness',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctWallThicknessLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ctWallThickness',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> ctWallThicknessBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ctWallThickness',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> currentLifeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currentLife',
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> currentLifeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currentLife',
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> currentLifeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentLife',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> currentLifeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentLife',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> currentLifeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentLife',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> currentLifeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentLife',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> drumDiameterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'drumDiameter',
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition>
      drumDiameterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'drumDiameter',
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> drumDiameterEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'drumDiameter',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> drumDiameterGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'drumDiameter',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> drumDiameterLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'drumDiameter',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> drumDiameterBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'drumDiameter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> elasticModulusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'elasticModulus',
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition>
      elasticModulusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'elasticModulus',
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> elasticModulusEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'elasticModulus',
        value: value,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition>
      elasticModulusGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'elasticModulus',
        value: value,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> elasticModulusLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'elasticModulus',
        value: value,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> elasticModulusBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'elasticModulus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> jobsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'jobs',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> jobsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'jobs',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> jobsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'jobs',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> jobsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'jobs',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> jobsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'jobs',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> jobsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'jobs',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension CTEntryQueryObject
    on QueryBuilder<CTEntry, CTEntry, QFilterCondition> {
  QueryBuilder<CTEntry, CTEntry, QAfterFilterCondition> jobsElement(
      FilterQuery<Job> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'jobs');
    });
  }
}

extension CTEntryQueryLinks
    on QueryBuilder<CTEntry, CTEntry, QFilterCondition> {}

extension CTEntryQuerySortBy on QueryBuilder<CTEntry, CTEntry, QSortBy> {
  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> sortByArchRadius() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'archRadius', Sort.asc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> sortByArchRadiusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'archRadius', Sort.desc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> sortByCtDiameter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctDiameter', Sort.asc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> sortByCtDiameterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctDiameter', Sort.desc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> sortByCtIntPressure() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctIntPressure', Sort.asc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> sortByCtIntPressureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctIntPressure', Sort.desc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> sortByCtLife() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctLife', Sort.asc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> sortByCtLifeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctLife', Sort.desc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> sortByCtName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctName', Sort.asc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> sortByCtNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctName', Sort.desc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> sortByCtWallThickness() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctWallThickness', Sort.asc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> sortByCtWallThicknessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctWallThickness', Sort.desc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> sortByCurrentLife() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLife', Sort.asc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> sortByCurrentLifeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLife', Sort.desc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> sortByDrumDiameter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'drumDiameter', Sort.asc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> sortByDrumDiameterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'drumDiameter', Sort.desc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> sortByElasticModulus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elasticModulus', Sort.asc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> sortByElasticModulusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elasticModulus', Sort.desc);
    });
  }
}

extension CTEntryQuerySortThenBy
    on QueryBuilder<CTEntry, CTEntry, QSortThenBy> {
  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> thenByArchRadius() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'archRadius', Sort.asc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> thenByArchRadiusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'archRadius', Sort.desc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> thenByCtDiameter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctDiameter', Sort.asc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> thenByCtDiameterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctDiameter', Sort.desc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> thenByCtIntPressure() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctIntPressure', Sort.asc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> thenByCtIntPressureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctIntPressure', Sort.desc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> thenByCtLife() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctLife', Sort.asc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> thenByCtLifeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctLife', Sort.desc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> thenByCtName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctName', Sort.asc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> thenByCtNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctName', Sort.desc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> thenByCtWallThickness() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctWallThickness', Sort.asc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> thenByCtWallThicknessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctWallThickness', Sort.desc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> thenByCurrentLife() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLife', Sort.asc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> thenByCurrentLifeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLife', Sort.desc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> thenByDrumDiameter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'drumDiameter', Sort.asc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> thenByDrumDiameterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'drumDiameter', Sort.desc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> thenByElasticModulus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elasticModulus', Sort.asc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> thenByElasticModulusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elasticModulus', Sort.desc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension CTEntryQueryWhereDistinct
    on QueryBuilder<CTEntry, CTEntry, QDistinct> {
  QueryBuilder<CTEntry, CTEntry, QDistinct> distinctByArchRadius() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'archRadius');
    });
  }

  QueryBuilder<CTEntry, CTEntry, QDistinct> distinctByCtDiameter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ctDiameter');
    });
  }

  QueryBuilder<CTEntry, CTEntry, QDistinct> distinctByCtIntPressure() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ctIntPressure');
    });
  }

  QueryBuilder<CTEntry, CTEntry, QDistinct> distinctByCtLife() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ctLife');
    });
  }

  QueryBuilder<CTEntry, CTEntry, QDistinct> distinctByCtName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ctName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CTEntry, CTEntry, QDistinct> distinctByCtWallThickness() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ctWallThickness');
    });
  }

  QueryBuilder<CTEntry, CTEntry, QDistinct> distinctByCurrentLife() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentLife');
    });
  }

  QueryBuilder<CTEntry, CTEntry, QDistinct> distinctByDrumDiameter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'drumDiameter');
    });
  }

  QueryBuilder<CTEntry, CTEntry, QDistinct> distinctByElasticModulus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'elasticModulus');
    });
  }
}

extension CTEntryQueryProperty
    on QueryBuilder<CTEntry, CTEntry, QQueryProperty> {
  QueryBuilder<CTEntry, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CTEntry, double?, QQueryOperations> archRadiusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'archRadius');
    });
  }

  QueryBuilder<CTEntry, double?, QQueryOperations> ctDiameterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ctDiameter');
    });
  }

  QueryBuilder<CTEntry, double?, QQueryOperations> ctIntPressureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ctIntPressure');
    });
  }

  QueryBuilder<CTEntry, double?, QQueryOperations> ctLifeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ctLife');
    });
  }

  QueryBuilder<CTEntry, String?, QQueryOperations> ctNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ctName');
    });
  }

  QueryBuilder<CTEntry, double?, QQueryOperations> ctWallThicknessProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ctWallThickness');
    });
  }

  QueryBuilder<CTEntry, double?, QQueryOperations> currentLifeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentLife');
    });
  }

  QueryBuilder<CTEntry, double?, QQueryOperations> drumDiameterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'drumDiameter');
    });
  }

  QueryBuilder<CTEntry, int?, QQueryOperations> elasticModulusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'elasticModulus');
    });
  }

  QueryBuilder<CTEntry, List<Job>, QQueryOperations> jobsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobs');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const JobSchema = Schema(
  name: r'Job',
  id: -5961302972855324388,
  properties: {
    r'cycles': PropertySchema(
      id: 0,
      name: r'cycles',
      type: IsarType.double,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'info': PropertySchema(
      id: 2,
      name: r'info',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 3,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _jobEstimateSize,
  serialize: _jobSerialize,
  deserialize: _jobDeserialize,
  deserializeProp: _jobDeserializeProp,
);

int _jobEstimateSize(
  Job object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.info;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _jobSerialize(
  Job object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.cycles);
  writer.writeDateTime(offsets[1], object.date);
  writer.writeString(offsets[2], object.info);
  writer.writeString(offsets[3], object.title);
}

Job _jobDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Job();
  object.cycles = reader.readDoubleOrNull(offsets[0]);
  object.date = reader.readDateTime(offsets[1]);
  object.info = reader.readStringOrNull(offsets[2]);
  object.title = reader.readStringOrNull(offsets[3]);
  return object;
}

P _jobDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension JobQueryFilter on QueryBuilder<Job, Job, QFilterCondition> {
  QueryBuilder<Job, Job, QAfterFilterCondition> cyclesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cycles',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> cyclesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cycles',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> cyclesEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cycles',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> cyclesGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cycles',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> cyclesLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cycles',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> cyclesBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cycles',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> infoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'info',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> infoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'info',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> infoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'info',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> infoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'info',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> infoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'info',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> infoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'info',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> infoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'info',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> infoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'info',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> infoContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'info',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> infoMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'info',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> infoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'info',
        value: '',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> infoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'info',
        value: '',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension JobQueryObject on QueryBuilder<Job, Job, QFilterCondition> {}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receta_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RecetaRecord> _$recetaRecordSerializer =
    new _$RecetaRecordSerializer();

class _$RecetaRecordSerializer implements StructuredSerializer<RecetaRecord> {
  @override
  final Iterable<Type> types = const [RecetaRecord, _$RecetaRecord];
  @override
  final String wireName = 'RecetaRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, RecetaRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.idReceta;
    if (value != null) {
      result
        ..add('idReceta')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fechaCreate;
    if (value != null) {
      result
        ..add('fechaCreate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.uidDoctor;
    if (value != null) {
      result
        ..add('uidDoctor')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.uidPaciente;
    if (value != null) {
      result
        ..add('uidPaciente')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  RecetaRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RecetaRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'idReceta':
          result.idReceta = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fechaCreate':
          result.fechaCreate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'uidDoctor':
          result.uidDoctor = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'uidPaciente':
          result.uidPaciente = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$RecetaRecord extends RecetaRecord {
  @override
  final String? idReceta;
  @override
  final DateTime? fechaCreate;
  @override
  final DocumentReference<Object?>? uidDoctor;
  @override
  final DocumentReference<Object?>? uidPaciente;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RecetaRecord([void Function(RecetaRecordBuilder)? updates]) =>
      (new RecetaRecordBuilder()..update(updates))._build();

  _$RecetaRecord._(
      {this.idReceta,
      this.fechaCreate,
      this.uidDoctor,
      this.uidPaciente,
      this.ffRef})
      : super._();

  @override
  RecetaRecord rebuild(void Function(RecetaRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecetaRecordBuilder toBuilder() => new RecetaRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecetaRecord &&
        idReceta == other.idReceta &&
        fechaCreate == other.fechaCreate &&
        uidDoctor == other.uidDoctor &&
        uidPaciente == other.uidPaciente &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, idReceta.hashCode), fechaCreate.hashCode),
                uidDoctor.hashCode),
            uidPaciente.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecetaRecord')
          ..add('idReceta', idReceta)
          ..add('fechaCreate', fechaCreate)
          ..add('uidDoctor', uidDoctor)
          ..add('uidPaciente', uidPaciente)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RecetaRecordBuilder
    implements Builder<RecetaRecord, RecetaRecordBuilder> {
  _$RecetaRecord? _$v;

  String? _idReceta;
  String? get idReceta => _$this._idReceta;
  set idReceta(String? idReceta) => _$this._idReceta = idReceta;

  DateTime? _fechaCreate;
  DateTime? get fechaCreate => _$this._fechaCreate;
  set fechaCreate(DateTime? fechaCreate) => _$this._fechaCreate = fechaCreate;

  DocumentReference<Object?>? _uidDoctor;
  DocumentReference<Object?>? get uidDoctor => _$this._uidDoctor;
  set uidDoctor(DocumentReference<Object?>? uidDoctor) =>
      _$this._uidDoctor = uidDoctor;

  DocumentReference<Object?>? _uidPaciente;
  DocumentReference<Object?>? get uidPaciente => _$this._uidPaciente;
  set uidPaciente(DocumentReference<Object?>? uidPaciente) =>
      _$this._uidPaciente = uidPaciente;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RecetaRecordBuilder() {
    RecetaRecord._initializeBuilder(this);
  }

  RecetaRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _idReceta = $v.idReceta;
      _fechaCreate = $v.fechaCreate;
      _uidDoctor = $v.uidDoctor;
      _uidPaciente = $v.uidPaciente;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecetaRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecetaRecord;
  }

  @override
  void update(void Function(RecetaRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecetaRecord build() => _build();

  _$RecetaRecord _build() {
    final _$result = _$v ??
        new _$RecetaRecord._(
            idReceta: idReceta,
            fechaCreate: fechaCreate,
            uidDoctor: uidDoctor,
            uidPaciente: uidPaciente,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_paciente_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DoctorPacienteRecord> _$doctorPacienteRecordSerializer =
    new _$DoctorPacienteRecordSerializer();

class _$DoctorPacienteRecordSerializer
    implements StructuredSerializer<DoctorPacienteRecord> {
  @override
  final Iterable<Type> types = const [
    DoctorPacienteRecord,
    _$DoctorPacienteRecord
  ];
  @override
  final String wireName = 'DoctorPacienteRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DoctorPacienteRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.uidPaciente;
    if (value != null) {
      result
        ..add('uidPaciente')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.uidDoctor;
    if (value != null) {
      result
        ..add('uidDoctor')
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
  DoctorPacienteRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DoctorPacienteRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'uidPaciente':
          result.uidPaciente = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'uidDoctor':
          result.uidDoctor = serializers.deserialize(value,
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

class _$DoctorPacienteRecord extends DoctorPacienteRecord {
  @override
  final DocumentReference<Object?>? uidPaciente;
  @override
  final DocumentReference<Object?>? uidDoctor;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$DoctorPacienteRecord(
          [void Function(DoctorPacienteRecordBuilder)? updates]) =>
      (new DoctorPacienteRecordBuilder()..update(updates))._build();

  _$DoctorPacienteRecord._({this.uidPaciente, this.uidDoctor, this.ffRef})
      : super._();

  @override
  DoctorPacienteRecord rebuild(
          void Function(DoctorPacienteRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoctorPacienteRecordBuilder toBuilder() =>
      new DoctorPacienteRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DoctorPacienteRecord &&
        uidPaciente == other.uidPaciente &&
        uidDoctor == other.uidDoctor &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, uidPaciente.hashCode), uidDoctor.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DoctorPacienteRecord')
          ..add('uidPaciente', uidPaciente)
          ..add('uidDoctor', uidDoctor)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class DoctorPacienteRecordBuilder
    implements Builder<DoctorPacienteRecord, DoctorPacienteRecordBuilder> {
  _$DoctorPacienteRecord? _$v;

  DocumentReference<Object?>? _uidPaciente;
  DocumentReference<Object?>? get uidPaciente => _$this._uidPaciente;
  set uidPaciente(DocumentReference<Object?>? uidPaciente) =>
      _$this._uidPaciente = uidPaciente;

  DocumentReference<Object?>? _uidDoctor;
  DocumentReference<Object?>? get uidDoctor => _$this._uidDoctor;
  set uidDoctor(DocumentReference<Object?>? uidDoctor) =>
      _$this._uidDoctor = uidDoctor;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  DoctorPacienteRecordBuilder() {
    DoctorPacienteRecord._initializeBuilder(this);
  }

  DoctorPacienteRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uidPaciente = $v.uidPaciente;
      _uidDoctor = $v.uidDoctor;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DoctorPacienteRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DoctorPacienteRecord;
  }

  @override
  void update(void Function(DoctorPacienteRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DoctorPacienteRecord build() => _build();

  _$DoctorPacienteRecord _build() {
    final _$result = _$v ??
        new _$DoctorPacienteRecord._(
            uidPaciente: uidPaciente, uidDoctor: uidDoctor, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

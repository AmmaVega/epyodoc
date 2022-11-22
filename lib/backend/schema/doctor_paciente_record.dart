import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'doctor_paciente_record.g.dart';

abstract class DoctorPacienteRecord
    implements Built<DoctorPacienteRecord, DoctorPacienteRecordBuilder> {
  static Serializer<DoctorPacienteRecord> get serializer =>
      _$doctorPacienteRecordSerializer;

  DocumentReference? get uidPaciente;

  DocumentReference? get uidDoctor;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(DoctorPacienteRecordBuilder builder) =>
      builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('doctorPaciente');

  static Stream<DoctorPacienteRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DoctorPacienteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DoctorPacienteRecord._();
  factory DoctorPacienteRecord(
          [void Function(DoctorPacienteRecordBuilder) updates]) =
      _$DoctorPacienteRecord;

  static DoctorPacienteRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDoctorPacienteRecordData({
  DocumentReference? uidPaciente,
  DocumentReference? uidDoctor,
}) {
  final firestoreData = serializers.toFirestore(
    DoctorPacienteRecord.serializer,
    DoctorPacienteRecord(
      (d) => d
        ..uidPaciente = uidPaciente
        ..uidDoctor = uidDoctor,
    ),
  );

  return firestoreData;
}

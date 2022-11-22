import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'receta_record.g.dart';

abstract class RecetaRecord
    implements Built<RecetaRecord, RecetaRecordBuilder> {
  static Serializer<RecetaRecord> get serializer => _$recetaRecordSerializer;

  String? get idReceta;

  DateTime? get fechaCreate;

  DocumentReference? get uidDoctor;

  DocumentReference? get uidPaciente;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(RecetaRecordBuilder builder) =>
      builder..idReceta = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('receta');

  static Stream<RecetaRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RecetaRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  RecetaRecord._();
  factory RecetaRecord([void Function(RecetaRecordBuilder) updates]) =
      _$RecetaRecord;

  static RecetaRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRecetaRecordData({
  String? idReceta,
  DateTime? fechaCreate,
  DocumentReference? uidDoctor,
  DocumentReference? uidPaciente,
}) {
  final firestoreData = serializers.toFirestore(
    RecetaRecord.serializer,
    RecetaRecord(
      (r) => r
        ..idReceta = idReceta
        ..fechaCreate = fechaCreate
        ..uidDoctor = uidDoctor
        ..uidPaciente = uidPaciente,
    ),
  );

  return firestoreData;
}

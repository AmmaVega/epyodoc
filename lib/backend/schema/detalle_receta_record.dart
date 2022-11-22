import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'detalle_receta_record.g.dart';

abstract class DetalleRecetaRecord
    implements Built<DetalleRecetaRecord, DetalleRecetaRecordBuilder> {
  static Serializer<DetalleRecetaRecord> get serializer =>
      _$detalleRecetaRecordSerializer;

  String? get idReceta;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(DetalleRecetaRecordBuilder builder) =>
      builder..idReceta = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('detalleReceta');

  static Stream<DetalleRecetaRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DetalleRecetaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DetalleRecetaRecord._();
  factory DetalleRecetaRecord(
          [void Function(DetalleRecetaRecordBuilder) updates]) =
      _$DetalleRecetaRecord;

  static DetalleRecetaRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDetalleRecetaRecordData({
  String? idReceta,
}) {
  final firestoreData = serializers.toFirestore(
    DetalleRecetaRecord.serializer,
    DetalleRecetaRecord(
      (d) => d..idReceta = idReceta,
    ),
  );

  return firestoreData;
}

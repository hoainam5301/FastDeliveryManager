// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wareHousing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WareHousing _$WareHousingFromJson(Map<String, dynamic> json) {
  return WareHousing(
    id: json['_id'] as String,
    name: json['name'] as String,
    idAddress: json['idAddress'] == null
        ? null
        : Address.fromJson(json['idAddress'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WareHousingToJson(WareHousing instance) => <String, dynamic>{
  'name': instance.name,
  'idAddress': jsonEncode(instance.idAddress?.toJson()),
};

Map<String, dynamic> _$WareHousingUpdateToJson(WareHousing instance) => <String, dynamic>{
  'name': instance.name,
  'idAddress': jsonEncode(instance.idAddress?.toJsonUpdate()),
};

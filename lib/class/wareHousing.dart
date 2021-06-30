import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:managerdelivery/class/address.dart';
import 'package:http/http.dart' as http;
part 'wareHousing.g.dart';


@JsonSerializable(explicitToJson: true)
class WareHousing{
  String id;
  Address idAddress;
  String name;

  WareHousing({
   this.id,this.idAddress,this.name
  });
  factory WareHousing.fromJson(Map<String, dynamic> data) => _$WareHousingFromJson(data);
  Map<String, dynamic> toUpdateJson() => _$WareHousingUpdateToJson(this);
  Map<String, dynamic> toJson() => _$WareHousingToJson(this);

  List<WareHousing> listAllWareHousing=[];

  Future<WareHousing> createWareHousing(WareHousing wareHousing) async {
    final String apiUrl = "http://52.142.43.138:3000/warehouses";
    var response = await http.post(apiUrl, body: wareHousing.toJson() );

    if(response.statusCode==201 || response.statusCode==200) {
      final String wareFrom=response.body;
      return WareHousing.fromJson(jsonDecode(response.body));
    }
    else {

      throw Exception(response.body);
    }
  }

  Future<List<WareHousing>> getListWareHousing()async{
    List<WareHousing> listWareHousing = [];
    final String apiUrl = "http://52.142.43.138:3000/warehouses";
    var response = await http.get(apiUrl);

    if(response.statusCode==200)
    {
      var data=jsonDecode(response.body);
      for (var _policy in data){
        listWareHousing.add(WareHousing.fromJson(_policy));
      }
      listAllWareHousing=listWareHousing;
      return listWareHousing;
    }
  }

  Future<String> updateWareHousing(String idware,WareHousing wareHousing) async {
    final String apiUrl = "http://52.142.43.138:3000/warehouses/$idware";
    //print("aaaaaa");
    var response = await http.put(apiUrl, body: wareHousing.toUpdateJson() );
    print(wareHousing.toJson());
    if(response.statusCode==201 || response.statusCode==200) {
      var data = jsonDecode(response.body);
      return "Update successfully";
    }
    else {

      return response.body;
    }
  }

}
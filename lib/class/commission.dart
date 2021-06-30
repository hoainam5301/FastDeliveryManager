import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
part 'commission.g.dart';

@JsonSerializable(explicitToJson: true)
class Commission {
  String id;
  String name;
  String note;
  String orderPerMonthMin;
  String orderPerMonthMax;
  String ratioCommission;

  Commission({this.id,this.name,this.ratioCommission,this.note,this.orderPerMonthMax,this.orderPerMonthMin});

  List<Commission> listAllCommissionStore=[];
  List<Commission> listAllCommissionStaff=[];


  factory Commission.fromJson(Map<String,dynamic>data) => _$CommissionFromJson(data);

  Map<String,dynamic> toJson() => _$CommissionToJson(this);

  Future<String> createCommissionStore(Commission commission)async{

    List<Commission> listCommission = [];
    final String apiUrl = "http://52.142.43.138:3000/cmstores";
    var response = await http.post(apiUrl,body:commission.toJson());

    if(response.statusCode==200)
    {
      //var data=jsonDecode(response.body);
      //for (var _policy in data){
        //listCommission.add(Commission.fromJson(_policy));
      //}
      //listAllCommission=listCommission;
      return "Success";
    }

  }

  Future<String> createCommissionStaff(Commission commission)async{

    List<Commission> listCommission = [];
    final String apiUrl = "http://52.142.43.138:3000/cmstaffs";
    var response = await http.post(apiUrl,body:commission.toJson());

    if(response.statusCode==200)
    {
      //var data=jsonDecode(response.body);
      //for (var _policy in data){
      //listCommission.add(Commission.fromJson(_policy));
      //}
      //listAllCommission=listCommission;
      return "Success";
    }

  }

  Future<List<Commission>> getListCommissionStore()async{
    List<Commission> listCommission = [];
    final String apiUrl = "http://52.142.43.138:3000/cmstores";
    var response = await http.get(apiUrl);

    if(response.statusCode==200)
    {
      var data=jsonDecode(response.body);
      for (var _policy in data){
        listCommission.add(Commission.fromJson(_policy));
      }
      listAllCommissionStore=listCommission;
      return listCommission;
    }
  }
  Future<List<Commission>> getListCommissionStaff()async{
    List<Commission> listCommission = [];
    final String apiUrl = "http://52.142.43.138:3000/cmstaffs";
    var response = await http.get(apiUrl);

    if(response.statusCode==200)
    {
      var data=jsonDecode(response.body);
      for (var _policy in data){
        listCommission.add(Commission.fromJson(_policy));
      }
      listAllCommissionStaff=listCommission;
      return listCommission;
    }
  }

  Future<String> updateCommissionStore(String idCommission,Commission commission) async {
    final String apiUrl = "http://52.142.43.138:3000/cmstores/$idCommission";
    //print("aaaaaa");
    var response = await http.put(apiUrl, body: commission.toJson() );
    //print(c.toJson());
    if(response.statusCode==201 || response.statusCode==200) {
      var data = jsonDecode(response.body);
      //print(response.body);
      //storeUser=Store.fromJson(data);
      return "Update successfully";
    }
    else {
      return response.body;
    }
  }
  Future<String> updateCommissionStaff(String idCommission,Commission commission) async {
    final String apiUrl = "http://52.142.43.138:3000/cmstaffs/$idCommission";
    //print("aaaaaa");
    var response = await http.put(apiUrl, body: commission.toJson() );
    //print(c.toJson());
    if(response.statusCode==201 || response.statusCode==200) {
      var data = jsonDecode(response.body);
      //print(response.body);
      //storeUser=Store.fromJson(data);
      return "Update successfully";
    }
    else {
      return response.body;
    }
  }

}
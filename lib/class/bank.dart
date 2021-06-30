
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
part 'bank.g.dart';

@JsonSerializable(explicitToJson: true)
class Bank{
  String id;
  String name;

  Bank({this.id,this.name});
  List<Bank> listAllBank=[];
  List<String> listNameAllBank=[];

  factory Bank.fromJson(Map<String,dynamic>data) => _$BankFromJson(data);
  Map<String,dynamic> toJson() => _$BankToJson(this);

  Future<List<Bank>> getListBank()async{
    List<Bank> listbank = [];
    final String apiUrl = "http://52.142.43.138:3000/banks";
    var response = await http.get(apiUrl);

    if(response.statusCode==200)
    {
      var data=jsonDecode(response.body);
      //print(data);
      for (var _policy in data){
        listNameAllBank.add(_policy["name"]);
        listbank.add(Bank.fromJson(_policy));
      }
      listAllBank=listbank;
      return listbank;
    }
  }
}
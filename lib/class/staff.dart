import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:managerdelivery/class/address.dart';
import 'package:managerdelivery/class/commission.dart';
import 'package:managerdelivery/class/staffType.dart';
import 'package:http/http.dart' as http;
part 'staff.g.dart';

@JsonSerializable(explicitToJson: true)
class Staff{
  String id;
  StaffType idStaffType;
  Commission idCommission;
  String fullName;
  String gender;
  String dateOfBirth;
  String idNumber;
  String phone;
  String email;
  String password;
  Address idAddress;
  String basicSalary;
  String actualSalary;

  Staff({this.id,
    this.idAddress,
    this.idCommission,
    this.idStaffType,
    this.idNumber,
    this.password,
    this.phone,
    this.email,
    this.fullName,
    this.gender,
    this.actualSalary,
    this.basicSalary,
    this.dateOfBirth});

  factory Staff.fromJson(Map<String, dynamic> data) => _$StaffFromJson(data);
  Map<String, dynamic> toUpdateJson() => _$StaffUpdateToJson(this);
  Map<String, dynamic> toJson() => _$StaffToJson(this);

  List<Staff> listAllStaff=[];

  Future<List<Staff>> getListStaff()async{
    List<Staff> listStaff = [];
    final String apiUrl = "http://52.142.43.138:3000/staffs";
    var response = await http.get(apiUrl);

    if(response.statusCode==200)
    {
      var data=jsonDecode(response.body);
      for (var _policy in data){
        listStaff.add(Staff.fromJson(_policy));
      }
      listAllStaff=listStaff;
      return listStaff;
    }
  }

  Future<Staff> createStaff(Staff staff) async {
    final String apiUrl = "http://52.142.43.138:3000/staffs";
    var response = await http.post(apiUrl, body: staff.toJson() );

    if(response.statusCode==201 || response.statusCode==200) {
      final String storeFrom=response.body;
      return Staff.fromJson(jsonDecode(response.body));
    }
    else {

      throw Exception(response.body);
    }
  }

  Future<String> updateStaff(String idStaff,Staff staff) async {
    final String apiUrl = "http://52.142.43.138:3000/staffs/$idStaff";
    var response = await http.put(apiUrl, body: staff.toUpdateJson() );

    if(response.statusCode==201 || response.statusCode==200) {
      var data = jsonDecode(response.body);

      return "Update successfully";
    }
    else {

      return response.body;
    }
  }

  List listAllNewStaff=[];
  Future<List> getListAllNewStaff()async{
    List listStaff = [];
    final String apiUrl = "http://52.142.43.138:3000/new-staffs";
    var response = await http.get(apiUrl);

    if(response.statusCode==200)
    {
      var data=jsonDecode(response.body);
      for (var _policy in data){
        listStaff.add(_policy);
      }
      listAllNewStaff=listStaff;
      return listStaff;
    }
  }

}
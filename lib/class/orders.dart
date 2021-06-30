import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:managerdelivery/class/address.dart';
import 'package:managerdelivery/class/deliveryMethod.dart';
import 'package:managerdelivery/class/detailStatus.dart';
import 'package:managerdelivery/class/staff.dart';
import 'package:managerdelivery/class/store.dart';
part 'orders.g.dart';

@JsonSerializable(explicitToJson: true)
class Orders {
  String id;
  Store idStore;
  Staff idStaff;
  String orderName;
  String totalWeight;
  String orderMoney;
  String note;
  String receiverName;
  String receiverPhone;
  String receiverEmail;
  Address receiverIDAddress;
  bool isUseCommission;
  String feeDelivery;
  String feeChangeAddressDelivery;
  String feeStorageCharges;
  String feeReturn;
  DeliveryMethod idDeliveryMethod;
  DetailStatus idPresentStatus;

  Orders({
    this.orderName,
    this.id,
    this.idStore,
    this.note,
    this.receiverName,
    this.receiverEmail,
    this.receiverPhone,
    this.receiverIDAddress,
    this.orderMoney,
    this.feeStorageCharges,
    this.feeChangeAddressDelivery,
    this.feeReturn,
    this.feeDelivery,
    this.isUseCommission,
    this.idDeliveryMethod,
    this.idStaff,
    this.totalWeight,
    this.idPresentStatus,
  });

  factory Orders.fromJson(Map<String, dynamic> data) => _$OrdersFromJson(data);
  Map<String, dynamic> toJson() => _$OrdersToJson(this);

  List<Orders> listAllOrder=[];
  List<String> listNameAllOrders=[];
  String standardFee;
  String surCharge;
  String commission;
  String totalFeeDelivery;

  Future<Orders> createOrder(Orders order) async {
    final String apiUrl = "http://52.142.43.138:3000/orders";
    print(order.toJson());
    var response = await http.post(apiUrl, body: order.toJson());

    print(response.statusCode);
    if (response.statusCode == 200) {
      //final String storeFrom = response.body;
      //print(jsonDecode(response.body)[""]);
      //print(jsonDecode(response.body[0])['id']);
      return Orders.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create Store');
    }
  }

  Future<String> getFee(Orders orders) async{
    final String apiUrl="http://52.142.43.138:3000/orders/fee?idStore=${orders.idStore.id}&orderName=${orders.orderName}"
        "&receiverName=${orders.receiverName}"
        "&receiverIdAddress=${jsonEncode(orders.receiverIDAddress)}&receiverPhone=${orders.receiverPhone}"
        "&receiverEmail=${orders.receiverEmail}&orderMoney=${orders.orderMoney}&totalWeight=${orders.totalWeight}"
        "&note=${orders.note}&idDeliveryMethod=${orders.idDeliveryMethod.id}&isUseCommission=${orders.isUseCommission}"
        "&feeDelivery=${orders.feeDelivery}&feeChangeAddressDelivery=${orders.feeChangeAddressDelivery}"
        "&feeStorageCharges=${orders.feeStorageCharges}&feeReturn=${orders.feeReturn}";
    var response = await http.get(apiUrl);

    if(response.statusCode == 200)
    {
      var data=jsonDecode(response.body);
      print(data);
      print(data['totalFee']);
      standardFee= (data['standardFee'].toString());
      surCharge= (data['surCharge'].toString());
      commission= (data['commission'].toString());
      totalFeeDelivery= (data['totalFee'].toString());
      return (data['totalFee'].toString());
    }
  }

  Future<List<Orders>> getListOrders()async{
    List<Orders> listOrders = [];
    final String apiUrl = "http://52.142.43.138:3000/orders";
    var response = await http.get(apiUrl);

    if(response.statusCode==200)
    {
      var data=jsonDecode(response.body);
      //print(data);
      for (var _policy in data){
        listNameAllOrders.add(_policy["name"]);
        listOrders.add(Orders.fromJson(_policy));
      }
      listAllOrder=listOrders;
      return listOrders;
    }
  }

  Future<String> updateAssignment(String idOrder, String idStaff)async{
    List<Orders> listOrders = [];
    final String apiUrl = "http://52.142.43.138:3000/orders/$idOrder/assignment";
    var response = await http.put(apiUrl,body:
      {
        'idStaff':idStaff,
      }
    );
    print(apiUrl);
    print(response.statusCode);
    if(response.statusCode==200)
    {

      return response.body;
    }
    else
      return response.body;
  }

  List<Orders> listAllOrderToHandling=[];
  Future<List<Orders>> getHandling()async{
    List<Orders> listOrders = [];
    final String apiUrl = "http://52.142.43.138:3000/orders/handling";
    var response = await http.get(apiUrl);

    if(response.statusCode==200)
    {
      var data=jsonDecode(response.body);
      for (var _policy in data){
        listOrders.add(Orders.fromJson(_policy));
      }
      listAllOrderToHandling=listOrders;
      return listOrders;
    }
  }
}

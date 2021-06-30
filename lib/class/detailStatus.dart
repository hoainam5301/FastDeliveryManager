import 'package:json_annotation/json_annotation.dart';
import 'package:managerdelivery/class/orders.dart';
import 'package:managerdelivery/class/staff.dart';
import 'package:managerdelivery/class/status.dart';
part 'detailStatus.g.dart';

@JsonSerializable(explicitToJson: true)
class DetailStatus{
  String id;
  String idOrder;
  Status idStatus;
  String idStaff;

  DetailStatus({this.id,this.idStaff,this.idOrder,this.idStatus});

  factory DetailStatus.fromJson(Map<String, dynamic> data) => _$DetailStatusFromJson(data);

  Map<String, dynamic> toJson() => _$DetailStatusToJson(this);
}
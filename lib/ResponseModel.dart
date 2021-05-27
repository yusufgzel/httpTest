// To parse this JSON data, do
//
//     final responseModel = responseModelFromJson(jsonString);

import 'dart:convert';

ResponseModel responseModelFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  ResponseModel({
    this.status,
    this.requestId,
    this.message,
    this.data,
  });

  String requestId;
  String status;
  Message message;
  Data data;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        status: json["status"],
        requestId: json["requestId"],
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "requestId": requestId,
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.milesResponseDetail,
  });

  MilesResponseDetail milesResponseDetail;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        milesResponseDetail:
            MilesResponseDetail.fromJson(json["milesResponseDetail"]),
      );

  Map<String, dynamic> toJson() => {
        "milesResponseDetail": milesResponseDetail.toJson(),
      };
}

class MilesResponseDetail {
  MilesResponseDetail({
    this.promoPoints,
    this.promoMiles,
    this.baseMiles,
    this.basePoint,
    this.definition,
    this.classCodes,
    this.flightCount,
    this.totalMiles,
    this.cabinType,
  });

  String promoPoints;
  String promoMiles;
  String baseMiles;
  String basePoint;
  String definition;
  String classCodes;
  String flightCount;
  String totalMiles;
  String cabinType;

  factory MilesResponseDetail.fromJson(Map<String, dynamic> json) =>
      MilesResponseDetail(
        promoPoints: json["promoPoints"],
        promoMiles: json["promoMiles"],
        baseMiles: json["baseMiles"],
        basePoint: json["basePoint"],
        definition: json["definition"],
        classCodes: json["classCodes"],
        flightCount: json["flightCount"],
        totalMiles: json["totalMiles"],
        cabinType: json["cabinType"],
      );

  Map<String, dynamic> toJson() => {
        "promoPoints": promoPoints,
        "promoMiles": promoMiles,
        "baseMiles": baseMiles,
        "basePoint": basePoint,
        "definition": definition,
        "classCodes": classCodes,
        "flightCount": flightCount,
        "totalMiles": totalMiles,
        "cabinType": cabinType,
      };
}

class Message {
  Message({
    this.code,
    this.description,
  });

  String code;
  String description;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        code: json["code"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "description": description,
      };
}

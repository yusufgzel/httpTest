import 'dart:convert';

RequestModel requestModelFromJson(String str) =>
    RequestModel.fromJson(json.decode(str));

String requestModelToJson(RequestModel data) => json.encode(data.toJson());

class RequestModel {
  RequestModel({
    this.requestHeader,
    this.calculateFlightMilesDetail,
  });

  RequestHeader requestHeader;
  CalculateFlightMilesDetail calculateFlightMilesDetail;

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
        requestHeader: RequestHeader.fromJson(json["requestHeader"]),
        calculateFlightMilesDetail: CalculateFlightMilesDetail.fromJson(
            json["calculateFlightMilesDetail"]),
      );

  Map<String, dynamic> toJson() => {
        "requestHeader": requestHeader.toJson(),
        "calculateFlightMilesDetail": calculateFlightMilesDetail.toJson(),
      };
}

class CalculateFlightMilesDetail {
  CalculateFlightMilesDetail({
    this.cardType,
    this.classCode,
    this.destination,
    this.flightDate,
    this.origin,
  });

  String cardType;
  String classCode;
  String destination;
  String flightDate;
  String origin;

  factory CalculateFlightMilesDetail.fromJson(Map<String, dynamic> json) =>
      CalculateFlightMilesDetail(
        cardType: json["card_type"],
        classCode: json["class_code"],
        destination: json["destination"],
        flightDate: json["flightDate"],
        origin: json["origin"],
      );

  Map<String, dynamic> toJson() => {
        "card_type": cardType,
        "class_code": classCode,
        "destination": destination,
        "flightDate": flightDate,
        "origin": origin,
      };
}

class RequestHeader {
  RequestHeader({
    this.clientCode,
    this.clientUsername,
    this.channel,
    this.airlineCode,
    this.application,
    this.clientTransactionId,
    this.languageCode,
  });

  String clientCode;
  String clientUsername;
  String channel;
  String airlineCode;
  String application;
  String clientTransactionId;
  String languageCode;

  factory RequestHeader.fromJson(Map<String, dynamic> json) => RequestHeader(
        clientCode: json["clientCode"],
        clientUsername: json["clientUsername"],
        channel: json["channel"],
        airlineCode: json["airlineCode"],
        application: json["application"],
        clientTransactionId: json["clientTransactionId"],
        languageCode: json["languageCode"],
      );

  Map<String, dynamic> toJson() => {
        "clientCode": clientCode,
        "clientUsername": clientUsername,
        "channel": channel,
        "airlineCode": airlineCode,
        "application": application,
        "clientTransactionId": clientTransactionId,
        "languageCode": languageCode,
      };
}

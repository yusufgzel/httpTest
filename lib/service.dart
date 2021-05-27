import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:httptry4/ResponseModel.dart';

class Service {
  String apiKey = "l7xx4c3e7a50d8fd469ba82d8c1001f90471";
  String secretKey = "a9c85920b4154dd291d680ee405ef239";

  Future<ResponseModel> getData(
      String clientCode,
      String clientUsername,
      String channel,
      String tk,
      String loyaltyService,
      String clientTransactionId,
      String languageCode,
      String cardType,
      String classCode,
      String destination,
      String flightData,
      String origin) async {
    final String url =
        "https://api.turkishairlines.com/test/calculateFlightMiles";

    final body = {
      "requestHeader": {
        "clientCode": clientCode,
        "clientUsername": clientUsername,
        "channel": channel,
        "airlineCode": tk,
        "application": loyaltyService,
        "clientTransactionId": clientTransactionId.toString(),
        "languageCode": languageCode
      },
      "calculateFlightMilesDetail": {
        "card_type": cardType,
        "class_code": classCode,
        "destination": destination,
        "flightDate": flightData,
        "origin": origin
      }
    };

    final headers = {
      'Content-Type': 'application/json',
      'apikey': '$apiKey',
      'apisecret': '$secretKey',
    };

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: headers,
    );

    if (response.statusCode == 200) {
      /// JSON Object To String
      final _jsonBody = response.body;
      print(_jsonBody);

      /// String To Map
      final _decodedBody = jsonDecode(_jsonBody) as Map<String, dynamic>;

      /// JSON (Map) To Dart (Object)
      final _modelResponse = ResponseModel.fromJson(_decodedBody);

      /// Response: Dart Object
      return _modelResponse;
    } else {
      throw Exception(
        'Data Not Received. Error code: ${response.statusCode}',
      );
    }
  }
}

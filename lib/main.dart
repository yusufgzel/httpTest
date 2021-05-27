import 'package:flutter/material.dart';
import 'package:httptry4/ResponseModel.dart';
import 'package:httptry4/service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Service _service;
  ResponseModel _responseModel;
  MilesResponseDetail _milesResponseDetail = MilesResponseDetail();
  TextEditingController clientCode = TextEditingController();
  TextEditingController clientUsername = TextEditingController();
  TextEditingController channel = TextEditingController();
  TextEditingController tk = TextEditingController();
  TextEditingController loyaltyService = TextEditingController();
  TextEditingController clientTransactionId = TextEditingController();
  TextEditingController languageCode = TextEditingController();
  TextEditingController cardType = TextEditingController();
  TextEditingController classCode = TextEditingController();
  TextEditingController destination = TextEditingController();
  TextEditingController flightData = TextEditingController();
  TextEditingController origin = TextEditingController();
  GlobalKey _clientCodeKey = GlobalKey();
  GlobalKey _clientUsername = GlobalKey();
  GlobalKey _channel = GlobalKey();
  GlobalKey _tk = GlobalKey();
  GlobalKey _loyaltyService = GlobalKey();
  GlobalKey _clientTransactionId = GlobalKey();
  GlobalKey _languageCode = GlobalKey();
  GlobalKey _cardType = GlobalKey();
  GlobalKey _classCode = GlobalKey();
  GlobalKey _destination = GlobalKey();
  GlobalKey _flightData = GlobalKey();
  GlobalKey _origin = GlobalKey();

  Future<ResponseModel> futures;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<ResponseModel>(
          future: Service().getData(
              clientCode.text,
              clientUsername.text,
              channel.text,
              tk.text,
              loyaltyService.text,
              clientTransactionId.text,
              languageCode.text,
              cardType.text,
              classCode.text,
              destination.text,
              flightData.text,
              origin.text),
          builder:
              (BuildContext context, AsyncSnapshot<ResponseModel> snapshot) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  buildTextField("ClientCode is necessary", false, clientCode,
                      "_clientCodeKey", _clientCodeKey),
                  buildTextField("clientUsername", false, clientUsername,
                      "_clientCodeKey", _clientUsername),
                  buildTextField(
                      "channel", false, channel, "_clientCodeKey", _channel),
                  buildTextField("airlineCode (optional)", false, tk,
                      "_clientCodeKey", _tk),
                  buildTextField("application (optional)", false,
                      loyaltyService, "_clientCodeKey", _loyaltyService),
                  buildTextField(
                      "clientTransactionId",
                      false,
                      clientTransactionId,
                      "_clientCodeKey",
                      _clientTransactionId),
                  buildTextField("languageCode", false, languageCode,
                      "_clientCodeKey", _languageCode),
                  buildTextField("card_type", false, cardType, "_clientCodeKey",
                      _cardType),
                  buildTextField("class_code (optional)", false, classCode,
                      "_clientCodeKey", _classCode),
                  buildTextField("destination", false, destination,
                      "_clientCodeKey", _destination),
                  buildTextField("flightDate", false, flightData,
                      "_clientCodeKey", _flightData),
                  buildTextField(
                      "origin", false, origin, "_clientCodeKey", _origin),
                  snapshot.data == null
                      ? Container()
                      : Column(
                          children: [
                            Text("Promo Points: " +
                                "${snapshot.data.data.milesResponseDetail.promoPoints}"),
                            Text("Promo Miles: " +
                                "${snapshot.data.data.milesResponseDetail.promoMiles}"),
                            Text("Base Miles: " +
                                "${snapshot.data.data.milesResponseDetail.baseMiles}"),
                            Text("Base Point: "
                                "${snapshot.data.data.milesResponseDetail.basePoint}"),
                            Text("Definition: "
                                "${snapshot.data.data.milesResponseDetail.definition}"),
                            Text("Class Codes: "
                                "${snapshot.data.data.milesResponseDetail.classCodes}"),
                            Text("Flight Count: "
                                "${snapshot.data.data.milesResponseDetail.flightCount}"),
                            Text("Total Miles: "
                                "${snapshot.data.data.milesResponseDetail.totalMiles}"),
                            Text("Cabin Type: "
                                "${snapshot.data.data.milesResponseDetail.cabinType}"),
                          ],
                        ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print(_responseModel);
          await Service().getData(
              clientCode.text,
              clientUsername.text,
              channel.text,
              tk.text,
              loyaltyService.text,
              clientTransactionId.text,
              languageCode.text,
              cardType.text,
              classCode.text,
              destination.text,
              flightData.text,
              origin.text);
          setState(() {});
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Widget buildTextField(String hintText, bool isEmail,
    TextEditingController controller, String errorMessage, _formKey) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Form(
      key: _formKey,
      child: TextFormField(
        validator: (String value) {
          if (value.length < 6 && value != null)
            return "Enter at least 6 char";
          else
            return null;
        },
        style: TextStyle(color: Colors.black),
        controller: controller,
        decoration: InputDecoration(
          labelText: hintText,
          labelStyle: TextStyle(
              fontSize: 15,
              color: errorMessage != null ? Colors.red : Colors.teal[300]),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: EdgeInsets.all(10),
          hintStyle: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ),
    ),
  );
}

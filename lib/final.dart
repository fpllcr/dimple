import 'package:flutter/material.dart';
import 'constants.dart';

class Final extends StatefulWidget {
  final TextEditingController t1, t2;
  @override
  FinalState createState() => new FinalState();

  Final(this.t1, this.t2);
}

class FinalState extends State<Final> {
  double originalPrice, discount, finalPrice;
  String finalPriceStr = "";
  GlobalKey<FormState> formKey1 = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    Constants constants = new Constants(context);

    String _validateField(String str) {
      String message;

      if (str.isNotEmpty) {
        try {
          double num = double.parse(str);
          if (num < 0.0) {
            message = "Invalid number";
          }
        } catch (e) {
          message = "Invalid number";
          if(str.contains(',')){
            message = "Use decimal point (.)";
          }
        }
      }

      return message;
    }

    void _formChanged() {
      if (formKey1.currentState.validate()) {
        if (widget.t1.text.isNotEmpty && widget.t2.text.isNotEmpty) {
          formKey1.currentState.save();
          finalPrice = originalPrice * (100.0 - discount) / 100.0;
          finalPriceStr =
              "${constants.currencySymbol}${finalPrice.toStringAsFixed(2)}";
        } else {
          finalPriceStr = "";
        }
      } else {
        finalPriceStr = "";
      }
      setState(() {});
    }

    final resultTitle = Text("Final price",
        style: TextStyle(
            fontFamily: 'Lato',
            //color: Color(0xFF4b1000),
            fontWeight: FontWeight.bold));

    try {
      if (widget.t1.text.isNotEmpty && widget.t2.text.isNotEmpty) {
        originalPrice = double.parse(widget.t1.text);
        discount = double.parse(widget.t2.text);
        finalPrice = originalPrice * (100.0 - discount) / 100.0;
        finalPriceStr =
            "${constants.currencySymbol}${finalPrice.toStringAsFixed(2)}";
      } else {
        finalPriceStr = "";
      }
      setState(() {});
    } catch (e) {}

    var result = Text(
      finalPriceStr,
      style: TextStyle(
        fontSize: 46.0,
        fontFamily: 'Volkhov',
        //color: Color(0xFF4b1000),
      ),
    );

    final field1 = TextFormField(
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 18.0,
            color: Colors.black
          ),
          decoration: InputDecoration(
              prefixText: constants.currencySymbol,
              border: OutlineInputBorder(),
              labelText: "Original price",
              labelStyle: TextStyle(fontSize: 16.0)
          ),
          keyboardType: TextInputType.number,
          validator: _validateField,
          onSaved: (str) => originalPrice = double.parse(str),
          controller: widget.t1,
        );

    final field2 = TextFormField(
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 18.0,
              color: Colors.black
          ),
          decoration: InputDecoration(
              prefixText: '%',
              border: OutlineInputBorder(),
              labelText: "Discount",
              labelStyle: TextStyle(fontSize: 16.0)),
          keyboardType: TextInputType.number,
          validator: _validateField,
          onSaved: (str) => discount = double.parse(str),
          controller: widget.t2,
        );

    var form = Form(
        key: formKey1,
        onChanged: _formChanged,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(child: field1),
            SizedBox(width: 10.0),
            Flexible(child: field2)
          ],
        ));

    return Stack(
      children: <Widget>[
        Positioned(
          top: constants.dimensions.height * 0.5 / 10,
          left: 0.0,
          right: 0.0,
          child: Column(
            children: <Widget>[resultTitle, result],
          ),
        ),
        Positioned(
            top: constants.dimensions.height * 1.04 / 3,
            left: 15.0,
            right: 15.0,
            child: form),
      ],
    );
  }
}

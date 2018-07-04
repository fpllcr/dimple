import 'package:flutter/material.dart';
import 'constants.dart';

class Discount extends StatefulWidget {
  final TextEditingController t1, t2;
  @override
  DiscountState createState() => new DiscountState();

  Discount(this.t1, this.t2);
}

class DiscountState extends State<Discount> {
  double originalPrice, discount, finalPrice;
  String discountStr = "";
  GlobalKey<FormState> formKey2 = new GlobalKey<FormState>();

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
      if (formKey2.currentState.validate()) {
        if (widget.t1.text.isNotEmpty && widget.t2.text.isNotEmpty) {
          formKey2.currentState.save();
          discount = 100 * (originalPrice - finalPrice) / originalPrice;
          discountStr = "${discount.toStringAsFixed(2)}%";
        } else {
          discountStr = "";
        }
      } else {
        discountStr = "";
      }
      setState(() {});
    }

    final resultTitle = Text("Discount",
        style: TextStyle(
            fontFamily: 'Lato',
            //color: Color(0xFF4b1000),
            fontWeight: FontWeight.bold));

    try {
      if (widget.t1.text.isNotEmpty && widget.t2.text.isNotEmpty) {
        originalPrice = double.parse(widget.t1.text);
        finalPrice = double.parse(widget.t2.text);
        discount = 100 * (originalPrice - finalPrice) / originalPrice;
        discountStr = "${discount.toStringAsFixed(2)}%";
      } else {
        discountStr = "";
      }
    } catch (e) {}

    var result = Text(
      discountStr,
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
              color: Colors.black),
          decoration: InputDecoration(
              prefixText: constants.currencySymbol,
              border: OutlineInputBorder(),
              labelText: "Original price",
              labelStyle: TextStyle(fontSize: 16.0)),
          keyboardType: TextInputType.number,
          validator: _validateField,
          onSaved: (str) => originalPrice = double.parse(str),
          controller: widget.t1,
        );

    final field2 = TextFormField(
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Lato', fontSize: 18.0, color: Colors.black),
          decoration: InputDecoration(
              prefixText: constants.currencySymbol,
              border: OutlineInputBorder(),
              labelText: "Final price",
              labelStyle: TextStyle(fontSize: 16.0)),
          keyboardType: TextInputType.number,
          validator: _validateField,
          onSaved: (str) => finalPrice = double.parse(str),
          controller: widget.t2,
        );

    return Stack(
      children: <Widget>[
        Positioned(
          top: constants.dimensions.height * 0.65 / 10,
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
          child: Form(
            key: formKey2,
            onChanged: _formChanged,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(child: field1),
                SizedBox(width: 10.0),
                Flexible(child: field2)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

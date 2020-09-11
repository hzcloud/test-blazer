import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/service.dart';
import 'package:string_validator/string_validator.dart';

class AddCustomerPage extends StatefulWidget {
  @override
  _AddCustomerPageState createState() => _AddCustomerPageState();
}

class _AddCustomerPageState extends State<AddCustomerPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _firstName, _lastName, _phoneNumber, _email;

    Widget _appBar() {
    return PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            tooltip: 'Previous choice',
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () => Navigator.of(context).pop(true),
          ),
          actions: <Widget>[
            IconButton(
              icon: new Icon(Icons.add),
              onPressed: () =>  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddCustomerPage())),
            ),
          ],
        ));
  }

    Widget _firstNameField() {
    return Container(
        // margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Text("First Name",
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Color.fromARGB(255, 136, 146, 163),
                  fontWeight: FontWeight.w700,
                  fontSize: 14.0)),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'This value is required.';
              }

              if (!isAlpha(value)) {
                return 'Only letters allowed.';
              }
            },
            keyboardType: TextInputType.text,
            onSaved: (value) => _firstName = value,
            obscureText: false,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                hintStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                labelStyle:
                    TextStyle(fontWeight: FontWeight.w400, color: Colors.grey),
                focusedBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 212, 34, 32), width: 2.0),
                ),
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          )
        ]));
  }

  Widget _lastNameField() {
    return Container(
        // margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Text("Last Name",
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Color.fromARGB(255, 136, 146, 163),
                  fontWeight: FontWeight.w700,
                  fontSize: 14.0)),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'This value is required.';
              }

              if (!isAlpha(value)) {
                return 'Only letters allowed.';
              }
            },
            keyboardType: TextInputType.text,
            onSaved: (value) => _lastName = value,
            obscureText: false,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                hintStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                labelStyle:
                    TextStyle(fontWeight: FontWeight.w400, color: Colors.grey),
                focusedBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 212, 34, 32), width: 2.0),
                ),
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          )
        ]));
  }

  Widget _emailField() {
    return Container(
        // margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Text("Email",
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Color.fromARGB(255, 136, 146, 163),
                  fontWeight: FontWeight.w700,
                  fontSize: 14.0)),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            onSaved: (value) => _email = value,
            validator: (value) {
              if (value.isEmpty) {
                return 'This value is required.';
              }

              if (!EmailValidator.validate(value)) {
                return 'Invalid email.';
              }
            },
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
            decoration: InputDecoration(
             
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                hintStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                labelStyle:
                    TextStyle(fontWeight: FontWeight.w400, color: Colors.grey),
                focusedBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 212, 34, 32), width: 2.0),
                ),
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          )
        ]));
  }

  Widget _phoneNumberField() {
    return Container(
        // margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Text("Cellphone",
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Color.fromARGB(255, 136, 146, 163),
                  fontWeight: FontWeight.w700,
                  fontSize: 14.0)),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            onSaved: (value) => _phoneNumber = value,
            validator: (value) {
              if (value.isEmpty) {
                return 'This value is required.';
              }
              if (value.length != 9) {
                return 'Invalid phone number.';
              }

              if (!isNumeric(value)) {
                return 'Invalid phone number.';
              }
            },
            keyboardType: TextInputType.phone,
            obscureText: false,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                hintStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                labelStyle:
                    TextStyle(fontWeight: FontWeight.w400, color: Colors.grey),
                focusedBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 212, 34, 32), width: 2.0),
                ),
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          )
        ]));
  }

  Widget _registerBtn() {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      // padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          color: Colors.white,),
      child: Material(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white,
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            splashColor: Colors.grey,
            child: Center(
              child: Text("REGISTER",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0)),
            ),
            onTap: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();


                final body = {
                  "firstName": _firstName.trim(),
                  "lastName": _lastName.trim(),
                  "email": _email.trim(),
                  "phoneNumber": _phoneNumber.trim()
                };

                ApiService.registerCustomer(body).then((success) {
                  if (success.code.toString() == "OK") {
                    
                    Navigator.of(context).pop();

                  }
                }).catchError((error) {
                  print(error.toString());
                });
              }
            },
          )),
    );
  }


  Widget _addCustomerWidget() {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: _firstNameField()),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(child: _lastNameField())
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            _emailField(),
            SizedBox(
              height: 10.0,
            ),
            _phoneNumberField(),
            Expanded(child: SizedBox()),
            
            _registerBtn(),
            SizedBox(
              height: 20.0,
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          color: Colors.white,
          child: _addCustomerWidget()
        ),
      ),
    );
  }
}
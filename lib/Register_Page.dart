// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqldataexample/DataBaseHelper/database_helper.dart';
import 'package:sqldataexample/Login_Page.dart';
import 'package:sqldataexample/homepage.dart';

class RegistrationPage extends StatefulWidget
{
  @override
  RegistrationPageState createState() =>  RegistrationPageState();
}

class  RegistrationPageState extends State<RegistrationPage>
{
  final _formKey = new GlobalKey<FormState>();

  TextEditingController _firstname = TextEditingController();
  TextEditingController _contact = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _lastname = TextEditingController();

  int _groupValue = 0;

  _checkRadio(int? index){
    setState(() {
      _groupValue = index!;
    });
  }

  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHandler();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Registration"),
      ),
      // backgroundColor: Colors.blueGrey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(25, 60, 25, 25),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _firstname,
                      keyboardType: TextInputType.text,
                      autofocus: true,
                      decoration: InputDecoration(
                        filled: true,
                        // fillColor: Colors.black12,
                        isDense: true,
                        labelText: "Enter FirstName",
                        labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),
                        hintText: "Enter Name Here",
                        prefixIcon: Icon
                          (Icons.person,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)

                        ),
                      ),
                      validator: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return "Please Enter FirstName";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 10.0),


                    TextFormField(
                      controller: _lastname,
                      keyboardType: TextInputType.text,
                      autofocus: true,
                      decoration: InputDecoration(
                        filled: true,
                        // fillColor: Colors.black12,
                        isDense: true,
                        labelText: "Enter LastName",
                        labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),
                        hintText: "Enter Name Here",
                        prefixIcon: Icon
                          (Icons.person,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                      validator: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return "Please Enter LastName";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 10.0),

                    TextFormField(
                      controller: _contact,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        filled: true,
                        // fillColor: Colors.black12,
                        isDense: true,
                        labelText: "Enter Contact-No.",
                        labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),
                        hintText: "Enter Number Here",
                        prefixIcon: Icon
                          (Icons.phone_android_outlined,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)

                        ),
                      ),
                      validator: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return "Please Enter Correct Number";
                        }
                        if(value.length!=10)
                        {
                          return "Number should be 10 character";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 10.0),

                    TextFormField(
                      controller: _email,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        // fillColor: Colors.black12,
                        isDense: true,
                        labelText: "Enter Email-Id",
                        labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),
                        hintText: "Enter Email-Id Here",
                        prefixIcon: Icon
                          (Icons.email,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)

                        ),
                      ),
                      validator: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return "Please Enter Email-Id";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 10.0),

                    TextFormField(
                      controller: _password,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        // fillColor: Colors.black12,
                        isDense: true,
                        labelText: "Enter Password",
                        labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),
                        hintText: "Enter Password Here",
                        prefixIcon: Icon
                          (Icons.password,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)

                        ),
                      ),
                      validator: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return "Please Enter Password";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 10.0),

                    Row(
                      children: [
                        Text("Gender :"),
                        Radio(
                          value: 0,
                          groupValue: _groupValue,
                          onChanged: _checkRadio,
                          activeColor: Colors.black,
                        ),
                        Text("Male"),
                        Radio(
                          value: 1,
                          groupValue: _groupValue,
                          onChanged: _checkRadio,
                          activeColor: Colors.black,
                        ),
                        Text("Female"),
                      ],
                    ),

                    InkWell(
                      onTap: () async {
                        if(_formKey.currentState!.validate()) {
                          var first_name = _firstname.text.toString();
                          var last_name = _lastname.text.toString();
                          var number = _contact.text.toString();
                          var email_id = _email.text.toString();
                          var password = _password.text.toString();
                          var gender = "";

                          if (_groupValue == 0) {
                            gender = "male";
                          }
                          else {
                            gender = "female";
                          }

                          print("First Name :" + first_name);
                          print("Last Name :" + last_name);
                          print("Contact :" + number);
                          print("Email :" + email_id);
                          print("Password :" + password);
                          print("Gender :" + gender);

                          DatabaseHandler obj = new DatabaseHandler();
                          int id = await obj.insert_records(first_name, last_name,number, email_id, password, gender);
                          print("Record Inserted At:"+id.toString());
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> LoginPage()));

                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 10.0),
                        width: MediaQuery.of(context).size.width,
                        height: 40.0,
                        child: Text("Register",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 18),),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",),

                TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text("Login",),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
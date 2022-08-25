// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqldataexample/DataBaseHelper/database_helper.dart';
import 'package:sqldataexample/homepage.dart';

class UpdateScreen extends StatefulWidget
{
  @override
  UpdateScreenState createState() =>  UpdateScreenState();
}

class UpdateScreenState extends State<UpdateScreen>
{
  var _formkey = GlobalKey<FormState>();
  var id;
  TextEditingController _name = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _contact = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();


  int _groupValue = 0;

  _checkRadio(int? index){
    setState(() {
      _groupValue = index!;
    });
  }


  late Future<List> singledata;

  getsingledata(id) async{
    DatabaseHandler obj = new DatabaseHandler();
    singledata = obj.getsinglerecord(id);
    singledata.then((value){
      _name.text = value[0]["name"].toString();
      _lastname.text = value[0]["lastname"].toString();
      _contact.text = value[0]["number"].toString();
      _email.text = value[0]["email"].toString();
      _password.text = value[0]["password"].toString();
      if(value[0]["gender"].toString()=="male")
      {
        setState(() {
          _groupValue=0;
        });
      }
      else
      {
        setState(() {
          _groupValue=1;
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero,(){
      final Map args = ModalRoute.of(context)!.settings.arguments as Map;
      setState(() {
        id = args["id"];
        getsingledata(id);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // backgroundColor: Colors.black38,
        title: Text("Update Information"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(25, 60, 25, 25),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _name,
                      keyboardType: TextInputType.text,
                      autofocus: true,
                      decoration: InputDecoration(
                        filled: true,
                        // fillColor: Colors.black12,
                        isDense: true,
                        labelText: "Enter Name",
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
                          return "Please Enter Name";
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
                        labelText: "Enter Last Name",
                        labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),
                        hintText: "Enter Last Name Here",
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
                          return "Please Enter Name";
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
                        prefixIcon: Icon(Icons.password, color: Colors.black,),
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
                        if(_formkey.currentState!.validate()) {
                          var namen1 = _name.text.toString();
                          var lastname1 = _lastname.text.toString();
                          var numbern2 = _contact.text.toString();
                          var emailn3 = _email.text.toString();
                          var passwordn4 = _password.text.toString();
                          var gender = "";

                          if (_groupValue == 0) {
                            gender = "male";
                          }
                          else {
                            gender = "female";
                          }

                          print("Name :" + namen1);
                          print("lastname :" + lastname1);
                          print("Contact :" + numbern2);
                          print("Email :" + emailn3);
                          print("Password :" + passwordn4);
                          print("Gender :" + gender);

                          DatabaseHandler obj = new DatabaseHandler();
                          int sid = await obj.update_records(namen1, lastname1, numbern2, emailn3, passwordn4, gender,id);
                          print("Record Updated At:"+sid.toString());
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> HomePage()));

                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 10.0),
                        width: MediaQuery.of(context).size.width,
                        height: 40.0,
                        child: Text("Update",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 18),),
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
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqldataexample/DataBaseHelper/database_helper.dart';
import 'package:sqldataexample/Register_Page.dart';
import 'package:sqldataexample/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();

  var _formkey = GlobalKey<FormState>();


  var dbHelper;


  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHandler();
  }

  login() async {
    String uid = emailAddress.text;
    String passwd = password.text;

    if (uid.isEmpty) {
      print('Please Enter User ID');
    } else if (passwd.isEmpty) {
      print('Please Enter Password');
    } else {
      await dbHelper.loginUser(uid, passwd).then((userData) {
        if (userData != null) {
          setSP(userData).whenComplete(() {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => HomePage()),
                    (Route<dynamic> route) => false);
          });
        } else {
          print('Error: User Not Found');
        }
      }).catchError((error) {
        print(error);
        print('Login Success');
      });
    }
  }

  Future setSP(user) async {
    final SharedPreferences sp = await _pref;

    sp.setString("first_name", user.first_name!);
    sp.setString("user_name", user.last_name!);
    sp.setString("email", user.email!);
    sp.setString("number", user.number!);
    sp.setString("password", user.password!);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Login'),
      ),
      body: Form(
        key: _formkey,

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // SizedBox(height: 100,),

              TextFormField(
                controller: emailAddress,
                keyboardType: TextInputType.text,
                autofocus: true,
                decoration: InputDecoration(
                  filled: true,
                  // fillColor: Colors.black12,
                  isDense: true,
                  labelText: "Enter Email",
                  labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),
                  hintText: "Enter Email",
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
                    return "Please Enter Email";
                  }
                  return null;
                },
              ),


              SizedBox(height: 20,),

              TextFormField(
                controller: password,
                keyboardType: TextInputType.text,
                autofocus: true,
                decoration: InputDecoration(
                  filled: true,
                  // fillColor: Colors.black12,
                  isDense: true,
                  labelText: "Enter password",
                  labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),
                  hintText: "Enter password",
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
                    return "Please Enter password";
                  }
                  return null;
                },
              ),



              SizedBox(height: 30,),

              InkWell(

                onTap: ()  {
                  login();
                },

                child: Container(
                  margin: EdgeInsets.only(top: 10.0),
                  width: MediaQuery.of(context).size.width,
                  height: 40.0,
                  child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 18),),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),

              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don`t have an Account?",),

                  TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                    },
                    child: Text("Register now",),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

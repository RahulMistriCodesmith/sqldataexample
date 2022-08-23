// import 'package:flutter/material.dart';
// import 'package:sqldataexample/Register_Page.dart';
// import 'package:sqldataexample/Value/mystyle.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//
//   TextEditingController emailAddress = TextEditingController();
//   TextEditingController password = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         centerTitle: true,
//         title: Text('Login'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//
//             // SizedBox(height: 100,),
//
//
//             TextFormField(
//               controller: emailAddress,
//               keyboardType: TextInputType.emailAddress,
//               decoration: MyStyle.inputDec1.copyWith(
//                 hintText: 'Enter Email',
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20)
//
//                 ),
//               ),
//             ),
//
//             SizedBox(height: 20,),
//
//             TextFormField(
//               controller: password,
//               decoration: MyStyle.inputDec1.copyWith(
//                 hintText: 'Enter Password',
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20)
//
//                 ),
//               ),
//             ),
//
//
//             SizedBox(height: 30,),
//
//             InkWell(
//
//               onTap: (){
//                 setState(() {
//
//                 });
//               },
//
//               child: Container(
//                 margin: EdgeInsets.only(top: 10.0),
//                 width: MediaQuery.of(context).size.width,
//                 height: 40.0,
//                 child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 18),),
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   color: Colors.teal,
//                   borderRadius: BorderRadius.circular(25.0),
//                 ),
//               ),
//             ),
//
//             SizedBox(height: 10,),
//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("Don`t have an Account?",),
//
//                 TextButton(
//                   onPressed: (){
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
//                   },
//                   child: Text("Register now",),
//                 ),
//               ],
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }

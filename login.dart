import 'dart:ui';

import 'package:dear_canary/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  // const login({ Key? key }) : super(key: key);

  @override
  _loginState createState() => _loginState();
}
class _loginState extends State<login> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? validateEmail(value)  {
    RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$");
    if(value.isEmpty) {
      return "Email required";
    }
    else {
      return null;
    }
    if(!regExp.hasMatch(value)) {
      return "Enter a valid Email Address";
    } else {
      return null;
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp().whenComplete(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Container(
          color: Colors.white,
          child: ProgressHUD(
            child: Builder(
                builder: (context) {
                  final progress = ProgressHUD.of(context);
                  return Form(
                    autovalidateMode: AutovalidateMode.always, key: _formKey,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          const Text(
                            'User Login',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 30.0,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Text(
                            'Enter your details to Login',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17.0,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),

                          Container(
                            color: Colors.grey[100],
                            margin: const EdgeInsets.all(10),
                            //height: 100,
                            width: MediaQuery.of(context).size.width,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.black,),
                              cursorColor: Colors.black,
                              controller: emailController,
                              validator: validateEmail,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.mail,color: Colors.black,),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black)
                                ),
                                labelText: "Email",
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            color: Colors.grey[100],
                            margin: const EdgeInsets.all(10),
                            //padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,

                            child: TextFormField(
                              style: const TextStyle(color: Colors.black,),
                              validator: (input) {
                                if(input!.length<6) {
                                  return "Password required";
                                }
                                else {
                                  return null;
                                }
                              },
                              controller: passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.vpn_key,color: Colors.black,),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black,)
                                ),
                                hintText: "Password",
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword(),));
                              },
                              child: const Text(
                                'Forget your password?',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            height: 50,
                            width: 200.0,
                            child: MaterialButton(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(13.0),
                                    topRight: Radius.circular(13.0),
                                    bottomLeft: Radius.circular(13.0),
                                    topLeft: Radius.circular(13.0)),
                              ),
                              color: Colors.green[900],
                              onPressed: () async {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                              },
                              child: const SizedBox(
                                width: 200,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text("Dont have an account?",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),));
                                  },
                                  child: Text(" Sign Up",
                                    style: TextStyle(
                                      color: Colors.green[900],
                                      fontSize: 20.0,fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }
            ),
          ),
        ),
      );
  }

  void signIn () {
    final formState = _formKey.currentState;
    if(formState!.validate())
    {

    }
  }
// Function to check and verify that password entered in registration and login are same or not
// Future loginData() async {
//   try {
//     await _auth
//         .signInWithEmailAndPassword(email: emailController.text, password: passwordController.text)
//         .then((value) async {
//       if (value.user!.uid.isNotEmpty)
//         {
//           ScaffoldMessenger.of(context)
//               .showSnackBar(SnackBar(content: Text("Authenticated"),));
//         }
//     });
//   } on FirebaseAuthException catch (error) {
//     print(error.code);
//     print(error.message);
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text("The password is invalid or the user does not have a password."),));
//   }
// }

}










































































// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:start/FirstPage.dart';
// import 'package:start/util/ConstantData.dart';
// import 'package:start/util/ConstantWidget.dart';
// import 'package:start/util/PrefData.dart';
//
//
//
// import 'ForgotPassword.dart';
// import 'SignUpPage.dart';
// import 'generated/l10n.dart';
//
//
// class SignInPage extends StatefulWidget {
//   @override
//   _SignInPage createState() {
//     return _SignInPage();
//   }
// }
//
// class _SignInPage extends State<SignInPage> {
//   bool isRemember = false;
//   // int themeMode = 0;
//   TextEditingController textNameController = new TextEditingController();
//   TextEditingController textPasswordController = new TextEditingController();
//
//
//   Future<bool> _requestPop() {
//     Navigator.of(context).pop();
//     return new Future.value(false);
//   }
//
//
//   @override
//   void initState() {
//
//     super.initState();
//     ConstantData.setThemePosition();
//     setState(() {
//
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//
//
//
//     return WillPopScope(
//         child: Scaffold(
//
//           backgroundColor: cellColor,
//           appBar: AppBar(
//             backgroundColor: cellColor,
//             elevation: 0,
//
//             title: Text(""),
//             leading: GestureDetector(
//               onTap: (){
//                 _requestPop();
//               },
//               child: Icon(
//                 Icons.keyboard_backspace,
//                 color: textColor,
//               ),
//             ),
//           ),
//
//           body: Container(
//             padding: EdgeInsets.symmetric(
//                 horizontal: getScreenPercentSize(context, 2.5)),
//             child: ListView(
//               children: [
//                 getTextWidget(
//                     S.of(context).signIn,
//                     // S.of(context).gladToMeetnyouAgain,
//                     textColor,
//                     TextAlign.left,
//                     FontWeight.bold,
//                     getScreenPercentSize(context, 4.2)),
//                 SizedBox(
//                   height: getScreenPercentSize(context, 2.5),
//                 ),
//
//
//
//
//                 getTextFiled( S.of(context).yourEmail, textNameController,false),
//                 getTextFiled( S.of(context).password, textPasswordController,true),
//
//                 //
//                 // getDefaultTextFiledWidget(
//                 //     context, S.of(context).yourEmail, textNameController),
//                 // getPasswordTextFiled(
//                 //     context, S.of(context).password, textPasswordController),
//
//
//                 InkWell(
//                   child: getTextWidget(
//                     S.of(context).forgotPassword,
//                     textColor,
//                     TextAlign.end,
//                     FontWeight.w600,
//                     getScreenPercentSize(context, 1.8),
//                   ),
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ForgotPassword(),
//                         ));
//                   },
//                 )
// ,
//                 SizedBox(
//                   height: getScreenPercentSize(context, 4),
//                 ),
//
//                 getTextButtonWidget(context, S.of(context).signIn,
//                     Colors.orangeAccent, () {
//                   PrefData.setIsSignIn(true);
//                   PrefData.setIsIntro(false);
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage(),));
//                 }),
//
//
//                 // Padding(padding: EdgeInsets.symmetric(vertical: getScreenPercentSize(context,.5)),child: Center(
//                 //   child: getTextWidget(
//                 //       S.of(context).or,
//                 //       textColor,
//                 //       TextAlign.center,
//                 //       FontWeight.w300,
//                 //       getScreenPercentSize(context, 1.8)),
//                 // ),),
//
//
//                 // getTextButtonWidget(context, S.of(context).signUpNow,
//                 //     primaryColor, () {
//                 //   Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),));
//                 // }),
//
//
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: getScreenPercentSize(context,.5)),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//
//                       getTextWidget(
//                           S.of(context).dontHaveAnAccount,
//                           textColor,
//                           TextAlign.left,
//                           FontWeight.w500,
//                           getScreenPercentSize(context, 1.8)),
//
//                       SizedBox(
//                         width: getScreenPercentSize(context, 0.5),
//                       ),
//                       InkWell(
//                         child: getTextWidget(
//                             S.of(context).signUp,
//                             primaryColor,
//                             TextAlign.start,
//                             FontWeight.bold,
//                             getScreenPercentSize(context, 2)),onTap: (){
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),));
//                       },
//                       )
//
//                     ],
//                   ),
//                 )
//
//
//
//
//               ],
//             ),
//           ),
//         ),
//         onWillPop: _requestPop);
//   }
//
//   getTextFiled(String s,TextEditingController controller,bool isPass){
//     Color color = Colors.grey;
//     double editTextHeight = MediaQuery.of(context).size.height * 0.07;
//     double defaultMargin = getScreenPercentSize(context, 2);
//
//     return  StatefulBuilder(builder: (context, setState) {
//
//       return Container(
//         margin: EdgeInsets.symmetric(vertical: (defaultMargin)),
//         padding: EdgeInsets.only(right: (defaultMargin/1.5)),
//         height: editTextHeight,
//         child: Focus(
//           onFocusChange: (hasFocus) {
//             setState(() => color = !hasFocus ? primaryColor : Colors.grey);
//           },
//
//           child: TextField(
//             maxLines: 1,
//             obscureText: isPass,
//             controller: controller,
//             style: TextStyle(
//                 fontFamily: ConstantData.fontFamily,
//                 color: textColor,
//                 fontWeight: FontWeight.w400,
//                 fontSize: ConstantData.font18Px),
//
//
//             decoration: InputDecoration(
//               enabledBorder:  OutlineInputBorder(
//
//                 borderSide:  BorderSide(
//                     color: Colors.grey, width: 0.0),
//               ),
//
//               focusedBorder: OutlineInputBorder(
//
//                 borderSide:  BorderSide(
//                     color: primaryColor, width: 1),
//               ),
//               border: OutlineInputBorder(
//                 borderSide:  BorderSide(
//                     color: Colors.grey, width: 0.0),
//               ),
//
//               labelStyle: TextStyle(
//                   fontFamily: ConstantData.fontFamily,
//
//                   color:  color
//               ),
//
//
//               labelText: s,
//               // hintText: 'Full Name',
//             ),
//           ),
//         ),
//       );
//     },);
//   }
//
//
// }













// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:twilio_flutter/twilio_flutter.dart';
// import 'package:dear_canary/models/user_details.dart';
// import 'package:dear_canary/screens/UserDetailsEntry/user_basic_details_enrty.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dear_canary/screens/home.dart';
// // import 'package:tele_doc/widget/otp_verify.dart';
//
// // Enum created for switching between login and otp verify screen
// enum MobileVerificationState {
//   SHOW_MOBILE_FORM_STATE,
//   SHOW_OTP_FORM_STATE,
// }
//
// class MobileAuth extends StatefulWidget {
//   const MobileAuth({Key? key}) : super(key: key);
//
//   @override
//   State<MobileAuth> createState() => _MobileAuthState();
// }
//
// class _MobileAuthState extends State<MobileAuth> {
//   // It will help to switch between login and otp page
//   MobileVerificationState currentState =
//       MobileVerificationState.SHOW_MOBILE_FORM_STATE;
//
//   // For firebase auth
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   final _otpController = TextEditingController();
//   final _mobileController = TextEditingController();
//
//   String verificationId = "";
//
//   // For activating loading screen
//   bool showLoading = false;
//
//   void signInWithPhoneAuthCredential(
//       PhoneAuthCredential phoneAuthCredential) async {
//     setState(() {
//       showLoading = true;
//     });
//
//     try {
//       final authCredential =
//           await _auth.signInWithCredential(phoneAuthCredential);
//
//       setState(() {
//         showLoading = false;
//       });
//
//       if (authCredential.user != null) {
//         var collectionRef =
//             FirebaseFirestore.instance.collection('Dear Canary');
//         var doc = await collectionRef.doc(_mobileController.text).get();
//         if (doc.exists) {
//           Navigator.push(context, MaterialPageRoute(builder: (context) {
//             return HomePage(
//               value: _mobileController.text,
//             );
//           }));
//         } else {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) =>
//                       BasicDataEntry(value: _mobileController.text)));
//         }
//       }
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         showLoading = false;
//       });
//
//       _scaffoldkey.currentState!
//           .showSnackBar(SnackBar(content: Text(e.message.toString())));
//     }
//   }
//
//   final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     final mediaQueryHeight = MediaQuery.of(context).size.height;
//     final mediaQueryWidth = MediaQuery.of(context).size.width;
//
//     Future<void> _showMyDialog(errorText) async {
//       return showDialog<void>(
//         context: context,
//         barrierDismissible: false, // user must tap button!
//         builder: (BuildContext context) {
//           return AlertDialog(
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//             content: Text(
//               errorText,
//               style: const TextStyle(
//                 fontFamily: "Poppins",
//               ),
//             ),
//             actions: <Widget>[
//               TextButton(
//                 child: const Text('Ok'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     }
//
//     // Function to send OTP
//     void _sendOTP() async {
//       await _auth.verifyPhoneNumber(
//           phoneNumber: _mobileController.text,
//           verificationCompleted: (phoneAuthCredential) async {
//             setState(() {
//               showLoading = false;
//             }); //signInWithPhoneAuthCredential(phoneAuthCredential);
//           },
//           verificationFailed: (verificationFailed) async {
//             setState(() {
//               showLoading = false;
//             });
//             _scaffoldkey.currentState?.showSnackBar(
//                 SnackBar(content: Text(verificationFailed.message.toString())));
//           },
//           codeSent: (verificationId, resendingToken) async {
//             setState(() {
//               showLoading = false;
//               currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
//               this.verificationId = verificationId;
//             });
//           },
//           codeAutoRetrievalTimeout: (verificationId) async {});
//     }
//
//     // Login Page
//     getMobileFormWidget(context) {
//       return SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               SizedBox(
//                 height: mediaQuery.size.height * 0.04,
//               ),
//
//               //App Name Text
//               const Text(
//                 "dear\nCanary",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontFamily: "Lemon Milk",
//                     fontSize: 40,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xff084d52)
//                     // fontWeight: FontWeight.bold
//                     ),
//               ),
//
//               SizedBox(
//                 height: mediaQueryHeight * 0.1,
//               ),
//
//               Container(
//                 margin:
//                     EdgeInsets.symmetric(horizontal: mediaQueryWidth * 0.075),
//                 child: Column(
//                   children: <Widget>[
//                     const SizedBox(
//                       height: 10,
//                     ),
//
//                     // For taking mobile number from the user
//                     Container(
//                       height: 60,
//                       margin: const EdgeInsets.symmetric(vertical: 10),
//                       width: MediaQuery.of(context).size.width * 0.95,
//                       child: TextFormField(
//                         keyboardType: TextInputType.phone,
//                         controller: _mobileController,
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(
//                           fontFamily: "Poppins",
//                           fontSize: 20,
//                           // fontWeight: FontWeight.bold
//                         ),
//                         decoration: InputDecoration(
//                             labelText: "Enter your Mobile Number",
//                             labelStyle: const TextStyle(
//                               fontFamily: "Bebas Neue",
//                               // color: Colors.white
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                                 borderSide: const BorderSide(
//                                     color: Color(0xff084d52), width: 5)),
//                             focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                                 borderSide: const BorderSide(
//                                     color: Colors.white, width: 5))),
//                       ),
//                     ),
//
//                     SizedBox(
//                       height: mediaQueryHeight * 0.02,
//                     ),
//
//                     // OTP button
//                     Align(
//                         alignment: Alignment.topRight,
//                         child: Container(
//                           alignment: Alignment.topRight,
//                           height: 41,
//                           width: 48,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(4),
//                             // color: const Color(0XFF258BD1)
//                           ),
//                           child: TextButton(
//                               style: TextButton.styleFrom(
//                                   backgroundColor: const Color(0xff084d52)),
//                               onPressed: () async {
//                                 if (_mobileController.text.isEmpty) {
//                                   _showMyDialog("Enter your mobile number");
//                                 } else {
//                                   setState(() {
//                                     showLoading = true;
//                                   });
//                                   _sendOTP();
//                                 }
//                               },
//                               child: const Center(
//                                 child: Text(
//                                   "OTP",
//                                   style: TextStyle(
//                                       fontFamily: "Poppins",
//                                       fontWeight: FontWeight.w500,
//                                       color: Colors.white,
//                                       fontSize: 14),
//                                 ),
//                               )),
//                         ))
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//
//     // OTP Page
//     getOtpFormWidget(context) {
//       return SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               SizedBox(
//                 height: mediaQuery.size.height * 0.04,
//               ),
//
//               //App Name Text
//               const Text(
//                 "dear\nCanary",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontFamily: "Lemon Milk",
//                     fontSize: 40,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xff084d52)
//                     // fontWeight: FontWeight.bold
//                     ),
//               ),
//
//               SizedBox(
//                 height: mediaQueryHeight * 0.1,
//               ),
//
//               Container(
//                 margin:
//                     EdgeInsets.symmetric(horizontal: mediaQueryWidth * 0.075),
//                 child: Column(
//                   children: <Widget>[
//                     const SizedBox(
//                       height: 10,
//                     ),
//
//                     // For taking OTP from the user
//                     Container(
//                       height: 60,
//                       margin: const EdgeInsets.symmetric(vertical: 10),
//                       width: MediaQuery.of(context).size.width * 0.95,
//                       child: TextFormField(
//                         keyboardType: TextInputType.number,
//                         controller: _otpController,
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(
//                           fontFamily: "Poppins",
//                           fontSize: 20,
//                           // fontWeight: FontWeight.bold
//                         ),
//                         decoration: InputDecoration(
//                             labelText: "OTP",
//                             labelStyle: const TextStyle(
//                               fontFamily: "Bebas Neue",
//                               // color: Colors.white
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                                 borderSide: const BorderSide(
//                                     color: Color(0xff084d52), width: 5)),
//                             focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                                 borderSide: const BorderSide(
//                                     color: Colors.white, width: 5))),
//                       ),
//                     ),
//
//                     SizedBox(
//                       height: mediaQueryHeight * 0.02,
//                     ),
//
//                     // Resend and Verify Button
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         TextButton(
//                             onPressed: () async {
//                               _sendOTP();
//                             },
//                             child: const Text(
//                               "Resend",
//                               style: TextStyle(
//                                   decoration: TextDecoration.underline,
//                                   fontFamily: "Poppins",
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 16,
//                                   color: Color(0xfffe5a60)),
//                             )),
//                         Container(
//                           alignment: Alignment.topRight,
//                           height: 41,
//                           width: 63,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(4),
//                             // color: const Color(0XFF258BD1)
//                           ),
//                           child: TextButton(
//                               style: TextButton.styleFrom(
//                                   backgroundColor: const Color(0xff084d52)),
//                               onPressed: () async {
//                                 PhoneAuthCredential phoneAuthCredential =
//                                     PhoneAuthProvider.credential(
//                                         verificationId: verificationId,
//                                         smsCode: _otpController.text);
//
//                                 signInWithPhoneAuthCredential(
//                                     phoneAuthCredential);
//                               },
//                               child: const Center(
//                                 child: Text(
//                                   "Verify",
//                                   style: TextStyle(
//                                       fontFamily: "Poppins",
//                                       fontWeight: FontWeight.w500,
//                                       color: Colors.white,
//                                       fontSize: 14),
//                                 ),
//                               )),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//             resizeToAvoidBottomInset: false,
//             backgroundColor: const Color(0xffe9e8e8),
//             body: Stack(
//               children: <Widget>[
//                 if (!showLoading)
//                   Align(
//                     alignment: Alignment.bottomCenter,
//                     child: Image.asset("assets/gif/girl_14.gif"),
//                   ),
//                 Container(
//                   child: showLoading
//                       ? const Center(
//                           child: CircularProgressIndicator(
//                             color: Color(0xff084d52),
//                           ),
//                         )
//                       : currentState ==
//                               MobileVerificationState.SHOW_MOBILE_FORM_STATE
//                           ? getMobileFormWidget(context)
//                           : getOtpFormWidget(context),
//                 )
//               ],
//             )),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../../core/unit/widgets/my_buttom.dart';
import '../../core/unit/widgets/my_form.dart';



class LoginPage extends StatelessWidget {

  final formKey= GlobalKey<FormState>();
var emailController =TextEditingController();
var passwordController =TextEditingController();

  LoginPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key:formKey ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              MyForm(type: TextInputType.emailAddress, label: 'Email Address', validation: 'Enter the email address', controller: emailController,),
              SizedBox(height: 20,),
              MyForm(type: TextInputType.visiblePassword, label: ' Password', validation: 'Enter the your password', controller: emailController,),
              SizedBox(height: 20,),
              MyButton(onClick: () {
                if (formKey.currentState!.validate()
                );
              },

              ),
            ],
          ),
        ),
      ),
    );
  }

}
// shar7 abdallah
// 1) null sefty

// class UserModel {
//   // variable have a value
//   int i = 5;
//
//   // value maye have a value
//   int? x;
//
//   // variable weill have a value
//   late int y;
//
//   void printUserData() {
//     // noo null
//     i = 8;
//
//     x = 8;
//     x = null;
//
//     // noo null
//     y = 9;
//   }
// }

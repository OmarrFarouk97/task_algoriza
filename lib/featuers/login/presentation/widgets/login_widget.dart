import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../../../core/componat.dart';
import '../../../../core/unit/widgets/my_buttom.dart';
import '../../../register_screen/ragister_screen.dart';

class LoginWidget extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  var phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 250,
                  child: Image.asset(
                    'assets/images/login.png',
                    width: 400,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Welcome to Fashion Daily',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      'Sign in',
                      style:
                      TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    const Text(
                      'Help',
                      style: TextStyle(color: Colors.blueAccent, fontSize: 18),
                    ),
                    IconButton(
                      color: Colors.blue,
                      onPressed: () {},
                      icon: const Icon(Icons.help),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Phone Number',
                  style: TextStyle(fontSize: 17),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 70,
                  child: TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Phone number is not registered';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      hintText: 'Eg.1552468326',
                      prefixIcon: CountryCodePicker(
                        onChanged: print,
                        initialSelection: 'EG',
                        favorite: const ['+20', 'EG'],
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyButton(
                  onClick: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  text: 'Sign in',
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1,
                      width: 130,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      'Or',
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 1,
                      width: 130,
                      color: Colors.black,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 52.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                  ),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      side: const BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/google.png',
                          width: 30.0,
                          height: 30.0,
                        ),
                        const Text(
                          'Sign in by google',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Text(
                      "Doesn't have any account?",
                      style: TextStyle(fontSize: 16),
                    ),
                    TextButton(
                        onPressed: () {
                          navigateTo(context, const RegisterScreen());
                        },
                        child: const Text(
                          "Register here",
                          style: TextStyle(color: Colors.blue, fontSize: 18),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                    'Use the application according to policy. Any kinds of violations will be subject to sanctions.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

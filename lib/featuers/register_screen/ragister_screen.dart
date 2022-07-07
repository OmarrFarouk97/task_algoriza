import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import '../../componat/Widget/widget.dart';
import '../../core/componat.dart';
import '../../core/unit/widgets/my_buttom.dart';
import '../../core/unit/widgets/my_form.dart';
import '../login/presentation/login_screen/screen_login.dart';

var emailController = TextEditingController();
var passwordController = TextEditingController();
var phoneController = TextEditingController();

IconData suffix = Icons.visibility;

bool isPassword = true;
final formKey = GlobalKey<FormState>();

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.network(
                      'https://ouch-cdn2.icons8.com/Jjxybowwu3P8g0IDOp1OBfmnbloJQDRPE9-hfQdTGlg/rs:fit:256:144/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvOTgw/L2YyZjQ3ZGQyLTYw/MTItNDU1MS04OGM4/LWQ3NjU2OWYzMWFm/NC5zdmc.png',
                      width: double.infinity,
                      fit: BoxFit.fill,
                      height: 150,
                    ),
                    // Image.asset(
                    //   'assets/images/register.png',
                    //   width: double.infinity,
                    //   height: 150,
                    //   fit: BoxFit.fill,
                    // ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 15.0,
                        top: 25,
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const CircleAvatar(
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.black,
                          radius: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Welcome to Fashion Daily',
                  // style: Theme.of(context)
                  //     .textTheme
                  //     .subtitle1!
                  //     .copyWith(color: Colors.grey, fontSize: 14.0),
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Text(
                      'Register',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.black,
                          ),
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
                  height: 15.0,
                ),
                Text(
                  'Email',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                MyForm(
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  radius: 10.0,
                  validation: 'Email must not be empty',
                  hintText: 'Eg. example@gmail.com',
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Phone Number',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(
                  height: 10.0,
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
                      hintText: 'Eg. 1552468326',
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
                  height: 10.0,
                ),
                Text(
                  'Password',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                defaultFormField(
                    suffix: isPassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility,
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password must not be empty';
                      }
                    },
                    prefix: Icons.lock_outline,
                    isPassword: isPassword,
                    suffixPressed: () {
                      setState(() {
                        suffix = isPassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility;
                        isPassword = !isPassword;
                      });
                    }),
                const SizedBox(
                  height: 20.0,
                ),
                MyButton(
                  onClick: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  text: 'Register',
                  background: Colors.teal,
                ),
                const SizedBox(
                  height: 20.0,
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
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Has any account ?',
                      style: TextStyle(fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        navigateTo(context, LoginScreen());
                      },
                      child: const Text(
                        'Sign in here ',
                        style: TextStyle(color: Colors.blue, fontSize: 19),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

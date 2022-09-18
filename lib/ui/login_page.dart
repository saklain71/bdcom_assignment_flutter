

//import 'package:api_integration/core/app_colors.dart';
//import 'package:api_integration/ui/validator.dart';
//import 'package:api_integration/ui/slide_navigator.dart';
import 'package:bdcom_assignment/ui/main_screen.dart';
import 'package:bdcom_assignment/ui/validator.dart';
import 'package:flutter/material.dart';
import '../core/app_colors.dart';


//import 'main_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.pageBackground,

        body: SingleChildScrollView(
          // Image(image: AssetImage('graphics/background.png'));
          child:Column(

            children: [
               SizedBox(height: 40,),

              Center(
                child: Image.asset('assets/images/smile.png'),
              ),
              SizedBox(height: 50,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                decoration: BoxDecoration(
                  //color: Colors.white,
                  border: Border.all(color: Colors.white,width: 0.5),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Text("Self Care",
                          style: TextStyle(
                              color: AppColors.colorWhite,
                              fontSize: 30
                          ),),


                      ),
                    ),
                    Divider(
                      color: AppColors.colorWhite,
                    ),

                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: <Widget>[
                            //email
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColors.colorWhite,
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              margin: EdgeInsets.all(20),

                              // padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                validator: (val){
                                  // Validator validate =  Validator();
                                  // validate.isValidEmail(val!);
                                  //Validator.isValidEmail(val!);
                                  if(Validator.isValidEmail(val!)){
                                    return null;
                                    // if ( emailVal) return null;
                                    // else return 'Enter a Valid Email';
                                  }

                                  // return 'Enter valid Email';
                                },
                                //obscureText: true,
                                controller: nameController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'User Id'
                                  //labelText: 'Email',
                                ),
                              ),
                            ),
                            //password
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColors.colorWhite,
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              margin: EdgeInsets.all(20),
                              child: TextFormField(
                                validator: (val){
                                  // Validator.isValidPassword(val!);
                                  if(Validator.isValidPassword(val!)){
                                    return null;
                                    // if ( emailVal) return null;
                                    // else return 'Enter a Valid Email';
                                  }
                                  // return 'Enter valid Email';

                                  ///Todo
                                  ///
                                  // return 'Need valid PassWord';
                                  // if ( emailPass) return null;
                                  // else

                                },
                                obscureText: true,
                                controller: passwordController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Password',
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: TextButton(
                                    onPressed: () {
                                      //forgot password screen
                                    },
                                    child: const Text(
                                      'Forgot Password',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: AppColors.colorWhite,
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              margin: EdgeInsets.all(20),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.teal, // background
                                  onPrimary: AppColors.butonTextColor, // foreground
                                ),
                                child: const Text('Login'),
                                onPressed: () {
                                  // Validate returns true if the form is valid, or false otherwise.
                                  if (_formKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Processing Data')),
                                    );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>  MainScreen()),
                                    );
                                  }
                                  print(nameController.text);
                                  print(passwordController.text);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Divider(
              //   color: AppColors.colorWhite,
              // ),

            ],

          ),
        ),
      ),
    );
  }
}
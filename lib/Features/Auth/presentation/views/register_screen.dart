import 'package:flutter/material.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/views/widgets/custom_text_button.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/views/widgets/custom_text_field.dart';

import '../../../../Core/utilis/app_color.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static const String routeName= "RegisterScreen";


  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height*0.03,),
              const Text("Register Now", style:  TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              SizedBox(height: height*0.01,),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
                color: AppColors.kWhiteColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(height: height*0.03,),
                      const CustomTextField(labelText: "display Name",keyboardType: TextInputType.text,suffixIcon: Icon(Icons.person_outline),),
                      SizedBox(height: height*0.03,),
                      const CustomTextField(labelText: "User Name",keyboardType: TextInputType.text,suffixIcon: Icon(Icons.person),),
                      SizedBox(height: height*0.03,),
                      const CustomTextField(labelText: "Email",keyboardType: TextInputType.emailAddress,suffixIcon: Icon(Icons.email_outlined),),
                      SizedBox(height: height*0.03,),
                      CustomTextField(labelText: "Password",isSecure: true,keyboardType: TextInputType.text,
                        suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.visibility_off)),),
                      SizedBox(height: height*0.03,),
                      CustomTextField(labelText: "Confirm Password",isSecure: true,keyboardType: TextInputType.text,
                        suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.visibility_off)),),
                      SizedBox(height: height*0.03,),
                      const CustomTextField(labelText: "Phone Number",keyboardType: TextInputType.number,suffixIcon: Icon(Icons.phone),),
                      SizedBox(height: height*0.03,),
                      Container(
                          height: height*0.07,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColors.kPrimaryColor,
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: Center(child: CustomTextButton(text: "Register",color: AppColors.kWhiteColor, onTab: (){},))),
                      SizedBox(height: height*0.03,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("You already have an account ?  ", style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w400),),
                          InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, LoginScreen.routeName);
                              },
                              child: const Text("Login", style: TextStyle(fontSize: 18 ,color: AppColors.kPrimaryColor, fontWeight: FontWeight.w500),))

                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

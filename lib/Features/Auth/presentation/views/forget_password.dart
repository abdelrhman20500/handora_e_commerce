import 'package:flutter/material.dart';
import 'package:handora_e_commerce/Core/utilis/app_color.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/views/widgets/custom_text_button.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/views/widgets/custom_text_field.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  static const String routeName= "ForgetPassword";

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: height*0.05,),
              const Align(
                  alignment: Alignment.center,
                  child: Text("Send PIN Code", style: TextStyle(color: AppColors.kPrimaryColor, fontSize: 22, fontWeight: FontWeight.bold),)),
              SizedBox(height: height*0.05,),
              const Text("Email*", style: TextStyle(color: AppColors.kGreyColor, fontSize: 22),),
              SizedBox(height: height*0.03,),
              const CustomTextField(labelText: "Enter Your Email"),
              SizedBox(height: height*0.03,),
              Container(
                  height: height*0.07,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.kPrimaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(child: CustomTextButton(text: "Send  PIN code", color: AppColors.kWhiteColor,)))
            ],
          ),
        ),
      ),
    );
  }
}

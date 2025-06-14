import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handora_e_commerce/Core/function/api_service.dart';
import 'package:handora_e_commerce/Features/Auth/data/repo/auth_repo_impl.dart';
import 'package:handora_e_commerce/Features/Auth/domain/use_case/auth_use_case.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/view_model/login_cubit/login_state.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/views/register_screen.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/views/widgets/custom_text_button.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/views/widgets/custom_text_field.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/home_screen.dart';
import '../../../../Core/utilis/app_color.dart';
import '../../../../Core/utilis/error_dialog.dart';
import '../../../../Core/utilis/loading_dialog.dart';
import '../../../../Core/utilis/success_dialog.dart';


class LoginScreen extends StatefulWidget {
   const LoginScreen({super.key});

  static const String routeName= "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => LoginCubit(AuthUseCase(AuthRepoImpl(apiService: ApiService(Dio())))),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginLoading) {
                // You can show a loading indicator or message here
                showLoadingDialog(context);
              } else if (state is LoginFailure) {
                // print(state.errMessage);
                showErrorDialog(context, state.errMessage);
              } else if (state is LoginSuccess) {
                closeLoadingDialog(context);
                showSuccessDialog(context, "Login Successfully");
                Navigator.pushNamed(context, HomeScreen.routeName);
                // print(state.authLogin.token); // Adjust based on your response structure
                // Navigate to the next screen or show success message
              }
            },
            builder: (context, state) {
              return Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: height*0.2,),
                      const Text("Login Now", style:  TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                      SizedBox(height: height*0.01,),
                      Card(
                        margin: const EdgeInsets.all(24),
                        color: AppColors.kWhiteColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              CustomTextField(labelText: "Email",keyboardType: TextInputType.emailAddress,controller: emailController,),
                              SizedBox(height: height*0.03,),
                              CustomTextField(labelText: "Password",isSecure: false,keyboardType: TextInputType.text,controller: passwordController,
                                suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.visibility_off)),),
                              SizedBox(height: height*0.03,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [

                                  CustomTextButton(text: "Forget Password ?", onTab: ()
                                  {
                                    // Navigator.pushNamed(context, ForgetPasswordScreen.routeName);
                                  },)
                                ],
                              ),
                              SizedBox(height: height*0.03,),
                              Container(
                                  height: height*0.07,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: AppColors.kPrimaryColor,
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: Center(child: CustomTextButton(text: "Login",color: AppColors.kWhiteColor,
                                    onTab: (){
                                    if(formKey.currentState!.validate()){
                                      BlocProvider.of<LoginCubit>(context).login(emailController.text, passwordController.text);
                                    }
                                    },))),
                              SizedBox(height: height*0.03,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("You don't have an account ?  ", style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w400),),
                                  InkWell(
                                      onTap: (){
                                        Navigator.pushNamed(context, RegisterScreen.routeName);
                                      },
                                      child: const Text("Register", style: TextStyle(fontSize: 18 ,color: AppColors.kPrimaryColor, fontWeight: FontWeight.w500),))

                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/styles/icon_broken.dart';
import '../login/login_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class RegisterScreen extends StatelessWidget {
  var formState = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            if (state.loginModel.status!) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return LoginScreen();
              }));
              MotionToast.success(
                title: "Success",
                titleStyle: const TextStyle(fontWeight: FontWeight.bold),
                description: state.loginModel.message!,
                descriptionStyle: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
                animationType: ANIMATION.FROM_LEFT,
                position: MOTION_TOAST_POSITION.TOP,
                borderRadius: 10.0,
                width: 300,
                height: 65,
              ).show(context);
            } else {
              print(state.loginModel.message);
              MotionToast.error(
                title: "خطأ",
                titleStyle: const TextStyle(fontWeight: FontWeight.bold),
                description: state.loginModel.message!,
                descriptionStyle: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
                animationType: ANIMATION.FROM_LEFT,
                position: MOTION_TOAST_POSITION.TOP,
                borderRadius: 10.0,
                width: 300,
                height: 65,
              ).show(context);
            }
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is RegisterLoadingState,
            color: Colors.white,
            opacity: 0.5,
            progressIndicator: const CircularProgressIndicator(),
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SvgPicture.asset(
                    'assets/images/bg.svg',
                    fit: BoxFit.cover,
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Scaffold(
                    resizeToAvoidBottomInset: false,
                    backgroundColor: Colors.transparent,
                    body: AnnotatedRegion<SystemUiOverlayStyle>(
                      value: const SystemUiOverlayStyle(
                          statusBarColor: Colors.transparent,
                          statusBarIconBrightness: Brightness.dark),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Form(
                              key: formState,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'تسجيل حساب',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'لديك حساب ؟',
                                        style: TextStyle(),
                                      ),
                                      const SizedBox(
                                        width: 0,
                                      ),
                                      TextButton(
                                          style: const ButtonStyle(),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'إضغط هنا ',
                                            style: TextStyle(
                                                color: indigo,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: fullNameController,
                                    cursorColor: indigo,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your name';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      labelText: 'إسمك بالكامل',
                                      prefixIcon:
                                          const Icon(IconBroken.Profile),
                                      enabledBorder: enabledBorder,
                                      focusedBorder: focusedBorder,
                                      errorBorder: enabledBorder,
                                      focusedErrorBorder: focusedBorder,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: emailController,
                                    cursorColor: indigo,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your email';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      labelText: 'الإيميل ',
                                      prefixIcon:
                                          const Icon(IconBroken.Message),
                                      enabledBorder: enabledBorder,
                                      focusedBorder: focusedBorder,
                                      errorBorder: enabledBorder,
                                      focusedErrorBorder: focusedBorder,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: passwordController,
                                    cursorColor: indigo,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: RegisterCubit.get(context)
                                        .isShowPassword,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Password is too short';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      labelText: 'كلمة السر',
                                      prefixIcon: const Icon(IconBroken.Unlock),
                                      suffixIcon: InkWell(
                                        onTap: () {
                                          RegisterCubit.get(context)
                                              .changePasswordVisibility();
                                        },
                                        child: RegisterCubit.get(context)
                                                .isShowPassword
                                            ? const Icon(IconBroken.Hide)
                                            : const Icon(IconBroken.Show),
                                      ),
                                      enabledBorder: enabledBorder,
                                      focusedBorder: focusedBorder,
                                      errorBorder: enabledBorder,
                                      focusedErrorBorder: focusedBorder,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: phoneController,
                                    cursorColor: indigo,
                                    keyboardType: TextInputType.phone,
                                    maxLength: 11,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your phone number';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      labelText: 'رقم الهاتف',
                                      prefixIcon: const Icon(IconBroken.Call),
                                      enabledBorder: enabledBorder,
                                      focusedBorder: focusedBorder,
                                      errorBorder: enabledBorder,
                                      focusedErrorBorder: focusedBorder,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  gradientButton(
                                    context: context,
                                    onPressed: () {
                                      if (formState.currentState!.validate()) {
                                        RegisterCubit.get(context).userRegister(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          phone: phoneController.text,
                                          name: fullNameController.text,
                                        );
                                      }
                                    },
                                    title: const Text(
                                      'تسجيل',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

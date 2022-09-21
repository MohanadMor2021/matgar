import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:matgar/layout/home_layout.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/local/cache_helper.dart';
import '../../shared/styles/icon_broken.dart';
import '../register/register_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class LoginScreen extends StatelessWidget {
  var formState = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.status!) {
              print(state.loginModel.message);
              CacheHelper.saveData(
                      key: 'token', value: state.loginModel.user!.token)
                  .then((value) {
                //   print(state.loginModel.data.token);
                print('==============================');
                token = CacheHelper.getData(key: 'token');
                print(token);
                print('==============================');
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return Text('');
                }));
                MotionToast.success(
                  title: "Success",
                  titleStyle: TextStyle(fontWeight: FontWeight.bold),
                  description: state.loginModel.message!,
                  descriptionStyle: const TextStyle(
                      //overflow: TextOverflow.ellipsis,
                      ),
                  animationType: ANIMATION.FROM_LEFT,
                  position: MOTION_TOAST_POSITION.TOP,
                  borderRadius: 10.0,
                  width: 300,
                  height: 65,
                ).show(context);
              });
            } else {
              print(state.loginModel.message);
              MotionToast.error(
                title: "خطأ",
                titleStyle: TextStyle(fontWeight: FontWeight.bold),
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
            inAsyncCall: state is LoginLoadingState,
            color: Colors.white,
            opacity: 0.5,
            progressIndicator: CircularProgressIndicator(),
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
                          child: Form(
                            key: formState,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'تسجيل الدخول ',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'لا تمتلك حساب ؟',
                                      style: TextStyle(),
                                    ),
                                    const SizedBox(
                                      width: 0,
                                    ),
                                    TextButton(
                                        style: ButtonStyle(),
                                        onPressed: () {
                                          navigatorPush(
                                              context, RegisterScreen());
                                        },
                                        child: Text(
                                          'اضغط هنا',
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
                                  controller: emailController,
                                  cursorColor: indigo,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your email address';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: 'الإيميل',
                                    prefixIcon: const Icon(IconBroken.Message),
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
                                  obscureText:
                                      LoginCubit.get(context).isShowPassword,
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
                                        LoginCubit.get(context)
                                            .changePasswordVisibility();
                                      },
                                      child:
                                          LoginCubit.get(context).isShowPassword
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
                                  height: 30.0,
                                ),
                                gradientButton(
                                    context: context,
                                    title: const Text(
                                      'تسجيل الدخول',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    onPressed: () {
                                      navigatorPush(
                                          context, ShopLayoutScreen());
                                      // if (formState.currentState!.validate()) {
                                      //   LoginCubit.get(context).userLogin(
                                      //       email: emailController.text,
                                      //       password: passwordController.text);
                                      // }
                                    }),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 150,
                        width: 150,
                        child: Center(
                            child:
                                Lottie.asset('assets/lottiefiles/sheep.json'))),
                    const Divider()
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

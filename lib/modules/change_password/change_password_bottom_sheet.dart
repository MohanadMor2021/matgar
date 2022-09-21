import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/styles/icon_broken.dart';

var formState = GlobalKey<FormState>();
TextEditingController currentPasswordController = TextEditingController();
TextEditingController newPasswordController = TextEditingController();

void bottomSheetChangePassword(
    {required BuildContext context, required ShopCubit cubit}) {
  showBarModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
    context: context,
    builder: (context) => Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Text(
                'Change Password',
                style: TextStyle(
                  color: indigo,
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 25,
                  bottom: 25,
                ),
                child: Form(
                  key: formState,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: currentPasswordController,
                        cursorColor: indigo,
                        keyboardType: TextInputType.visiblePassword,
                        // obscureText: cubit.isShowPassword1,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your current password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Current Password',
                          prefixIcon: const Icon(IconBroken.Unlock),
                          suffixIcon: InkWell(
                            onTap: () {
                              // cubit.changePasswordVisibility1();
                            },
                            // child: cubit.isShowPassword1
                            //     ? Icon(IconBroken.Hide)
                            //     : Icon(IconBroken.Show),
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
                        controller: newPasswordController,
                        cursorColor: indigo,
                        keyboardType: TextInputType.visiblePassword,
                        //    obscureText: cubit.isShowPassword2,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your new password';
                          } else if (value.length < 8) {
                            return 'Password is too short';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'New Password',
                          prefixIcon: const Icon(IconBroken.Unlock),
                          suffixIcon: InkWell(
                            onTap: () {
                              //    cubit.changePasswordVisibility2();
                            },
                            // child: cubit.isShowPassword2
                            //     ? Icon(IconBroken.Hide)
                            //     : Icon(IconBroken.Show),
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
                      gradientButton(
                        context: context,
                        title: const Text(
                          'Change Password',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          if (formState.currentState!.validate()) {
                            cubit.changePassword(
                                currentPassword: currentPasswordController.text,
                                newPassword: newPasswordController.text);
                            currentPasswordController.text = '';
                            newPasswordController.text = '';
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

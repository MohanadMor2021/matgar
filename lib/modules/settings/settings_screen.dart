import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';
import '../../shared/styles/icon_broken.dart';
import '../change_password/change_password_bottom_sheet.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is ShopSuccessChangePasswordState) {
          if (state.changePasswordModel.status!) {
            MotionToast.success(
              title: "Success",
              titleStyle: const TextStyle(fontWeight: FontWeight.bold),
              description: state.changePasswordModel.message!,
              descriptionStyle: const TextStyle(
                  //overflow: TextOverflow.ellipsis,
                  ),
              animationType: ANIMATION.FROM_LEFT,
              position: MOTION_TOAST_POSITION.TOP,
              borderRadius: 10.0,
              width: 300,
              height: 65,
            ).show(context);
          }
        } else if (state is ShopErrorChangePasswordState) {
          MotionToast.error(
            title: "Error",
            titleStyle: const TextStyle(fontWeight: FontWeight.bold),
            description: state.error,
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
      },
      builder: (context, state) {
        ShopCubit cubit = ShopCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff869B4B),
              centerTitle: true,
              title: Text(
                "الإعدادات",
                style: GoogleFonts.cairo(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),



            body: (state is! ShopLoadingGetFAQsState)
                ? ModalProgressHUD(
                    inAsyncCall: state is ShopLoadingChangePasswordState,
                    color: Colors.white,
                    opacity: 0.5,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [


                            Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                "الحساب",
                                style: GoogleFonts.cairo(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ),

                            ListTile(
                              onTap: () {
                                //   navigatorPush(context, ProfileScreen());
                              },
                              dense: true,
                              horizontalTitleGap: -4,
                              //minLeadingWidth: 0,
                              minVerticalPadding: 15.0,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              tileColor: Colors.grey.shade200,
                              leading: Icon(
                                IconBroken.Profile,
                                color: Color(0xff869B4B),
                                size: 26,
                              ),
                              title: Text(
                                "تعديل الحساب الشخصي",
                                style: GoogleFonts.cairo(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              trailing: Icon(
                                IconBroken.Arrow___Left_2,
                                color: Color(0xff869B4B),
                                size: 26,
                              ),
                            ),





                            const SizedBox(
                              height: 10.0,
                            ),



                            ListTile(
                              onTap: () {
                                bottomSheetChangePassword(
                                    context: context, cubit: cubit);
                              },
                              dense: true,
                              horizontalTitleGap: -4,
                              //minLeadingWidth: 0,
                              minVerticalPadding: 15.0,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              tileColor: Colors.grey.shade200,
                              leading: Icon(
                                IconBroken.Password,
                                color: Color(0xff869B4B),
                                size: 26,
                              ),
                              title:  Text(
                                "تغير كلمة المرور",
                                style: GoogleFonts.cairo(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              trailing: Icon(
                                IconBroken.Arrow___Left_2,
                                color: Color(0xff869B4B),
                                size: 26,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                "القوانين",
                                style: GoogleFonts.cairo(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            ListTile(
                              onTap: () {},
                              dense: true,
                              horizontalTitleGap: -4,
                              //minLeadingWidth: 0,
                              minVerticalPadding: 15.0,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              tileColor: Colors.grey.shade200,
                              leading: Icon(
                                IconBroken.Shield_Done,
                                color: Color(0xff869B4B),
                                size: 26,
                              ),
                              title: Text(
                                "السياسات",
                                style: GoogleFonts.cairo(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              trailing: Icon(
                                IconBroken.Arrow___Left_2,
                                color: Color(0xff869B4B),
                                size: 26,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            ListTile(
                              onTap: () {
                                // bottomSheetContactMe(
                                //     context: context, cubit: cubit);
                              },
                              dense: true,
                              horizontalTitleGap: -4,
                              //minLeadingWidth: 0,
                              minVerticalPadding: 15.0,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              tileColor: Colors.grey.shade200,
                              leading: Icon(
                                IconBroken.Call,
                                color: Color(0xff869B4B),
                                size: 26,
                              ),
                              title: Text(
                                "تواصل معنا",
                                style: GoogleFonts.cairo(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              trailing: Icon(
                                IconBroken.Arrow___Left_2,
                                color: Color(0xff869B4B),
                                size: 26,
                              ),
                            ),
                            // SizedBox(height: 10.0,),
                          ],
                        ),
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 15.0, vertical: 20.0),
              child: Container(
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xff869B4B),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [

                    Icon(
                      IconBroken.Logout,
                      color: Colors.white,
                    ),

                    SizedBox(
                      width: 5,
                    ),

                    Text(
                      "تسجيل خروج",
                      style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),





                  ],
                ),

              ),
            ),
          ),
        );
      },
    );
  }
}



/*
Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Logout',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      IconBroken.Logout,
                      color: Colors.white,
                    )
                  ],
                ),
 */
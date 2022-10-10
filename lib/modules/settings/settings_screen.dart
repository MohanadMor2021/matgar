import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              centerTitle: true,
              title: Text(
                'إعدادات',
                style: TextStyle(color: indigo),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  IconBroken.Arrow___Right_2,
                  color: indigo,
                  size: 35,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                  ),
                  child: InkWell(
                      onTap: () {
                        //   navigatorPush(context, ProfileScreen());
                      },
                      child: myCircleAvatar('', 21, 25, 23)),
                ),
              ],
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
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: Text(
                                'الحساب',
                                style: TextStyle(
                                  color: indigo,
                                  fontSize: 16,
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
                              tileColor: Colors.grey[50],
                              leading: Icon(
                                IconBroken.Profile,
                                color: indigo,
                                size: 26,
                              ),
                              title: const Text(
                                ' تعديل البروفايل',
                                style: TextStyle(
                                  fontSize: 14,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              trailing: Icon(
                                IconBroken.Arrow___Left_2,
                                color: indigo,
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
                              tileColor: Colors.grey[50],
                              leading: Icon(
                                IconBroken.Password,
                                color: indigo,
                                size: 26,
                              ),
                              title: const Text(
                                ' تغيير كلمة السر',
                                style: TextStyle(
                                  fontSize: 14,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              trailing: Icon(
                                IconBroken.Arrow___Left_2,
                                color: indigo,
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
                                'القوانين',
                                style: TextStyle(
                                  color: indigo,
                                  fontSize: 16,
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
                              tileColor: Colors.grey[50],
                              leading: Icon(
                                IconBroken.Shield_Done,
                                color: indigo,
                                size: 26,
                              ),
                              title: const Text(
                                'السياسات',
                                style: TextStyle(
                                  fontSize: 14,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              trailing: Icon(
                                IconBroken.Arrow___Left_2,
                                color: indigo,
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
                              tileColor: Colors.grey[50],
                              leading: Icon(
                                IconBroken.Activity,
                                color: indigo,
                                size: 26,
                              ),
                              title: const Text(
                                ' تواصل معنا',
                                style: TextStyle(
                                  fontSize: 14,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              trailing: Icon(
                                IconBroken.Arrow___Left_2,
                                color: indigo,
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
            bottomNavigationBar: BottomAppBar(
              elevation: 10,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 20.0),
                child: gradientButton(
                  context: context,
                  title: Row(
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
                  onPressed: () {
                    logout(context);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matgar/item/detail_screen_item/detail_screen_item.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';
import 'complete_order_screen.dart';

// class DetailsScreen extends StatelessWidget {
//   const DetailsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               ListView.builder(
//                 itemCount: 1,
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   return const DetailScreenItem();
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class DetailsScreen extends StatelessWidget {
  final id;

  const DetailsScreen(this.id);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ShopCubit>(context).getproductdetailsData(2);

    final screenHeight = MediaQuery.of(context).size.height;

    List<String> images = [
      'https://i.pinimg.com/736x/06/2f/04/062f04781eac86ab263412ce0dcf429a.jpg',
      'https://i.pinimg.com/564x/7e/96/33/7e9633452a0a6be661349a7dee7c5bb6.jpg',
      'https://i.pinimg.com/736x/06/2f/04/062f04781eac86ab263412ce0dcf429a.jpg',
    ];

    int index = 0;
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);

        return cubit.productdetailsmodel != null
            ? Directionality(
                textDirection: TextDirection.rtl,
                child: Scaffold(
                  // appBar: CustomAppBar('حري كبير جبر'),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 400,
                          width: double.infinity,
                          child: Swiper(
                            itemBuilder: (context, index) {
                              return Image.network(
                                cubit.productdetailsmodel!.data!.images[index],
                                fit: BoxFit.fill,
                                width: double.infinity,
                                height: 400,
                              );
                            },
                            itemCount: images.length,
                            // viewportFraction: 0.7,
                            scale: 0.8,
                            loop: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    // "${cubit.productdetailsmodel!.data!.name}",
                                    "${cubit.productdetailsmodel!.data!.name}",
                                    style: GoogleFonts.cairo(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Text(
                                      "الوزن | 500كغم",
                                      style: GoogleFonts.cairo(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey.shade300,
                                    ),
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(
                                    "assets/images/whatsapp_icon.png",
                                    width: 50,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Text(
                                "السعر  :  ${cubit.productdetailsmodel!.data!.price}",
                                style: GoogleFonts.cairo(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.red,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              Text(
                                "تفاصيل المنتج : ",
                                style: GoogleFonts.cairo(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(10)
                                .add(EdgeInsets.only(right: 10)),
                            child: Text(
                              "${cubit.productdetailsmodel!.data!.desc}",
                              style: GoogleFonts.cairo(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        Divider(),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              Text(
                                "معلومات عن المالك : ",
                                style: GoogleFonts.cairo(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Container(
                            alignment: Alignment.center,
                            height: 70,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: Color(0xff869B4B))),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(
                                  Icons.phone_iphone_rounded,
                                  color: Color(0xff869B4B),
                                  size: 40,
                                ),
                                VerticalDivider(
                                  thickness: 1,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "970597667284+",
                                  style: GoogleFonts.cairo(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Container(
                            alignment: Alignment.center,
                            height: 70,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: Color(0xff869B4B))),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 25,
                                ),
                                Icon(
                                  Icons.email,
                                  color: Color(0xff869B4B),
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                VerticalDivider(
                                  thickness: 1,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "amjad@gmail.com",
                                  style: GoogleFonts.cairo(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  navigatorPush(context, CompleteOrderScreen());
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 60,
                                  width:
                                      MediaQuery.of(context).size.width * 0.40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xff869B4B),
                                  ),
                                  child: Text(
                                    "طلب",
                                    style: GoogleFonts.cairo(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 60,
                                width: MediaQuery.of(context).size.width * 0.40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xff869B4B),
                                ),
                                child: Text(
                                  "طلب",
                                  style: GoogleFonts.cairo(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ))
            : Center(child: const CircularProgressIndicator());
      },
    );
  }
}

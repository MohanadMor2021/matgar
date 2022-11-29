import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matgar/item/home_screen_item/carousel_slider.dart';
import 'package:matgar/shared/components/components.dart';

import '../../dummy_data/categories_data.dart';
import '../../item/home_screen_item/home_screen_item.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double BnbH = kBottomNavigationBarHeight;
    double whiteContainerHeight =
        MediaQuery.of(context).size.height * 0.81 - BnbH;

    final List<String> imagesSlider = [
      "https://img.freepik.com/free-vector/flat-eid-al-adha-horizontal-sale-banner-template_23-2149446464.jpg?w=826&t=st=1666214404~exp=1666215004~hmac=b6679d35eba839960f1d1b69178ce894a10ac22a233d891230b4ab5be650c989",
      "https://img.freepik.com/free-vector/cow-with-black-spots-with-meadow-background-organic-fresh-milk_1268-15852.jpg?w=900&t=st=1666214574~exp=1666215174~hmac=cb055eff3d9c763b32eea0a0fc7cb13ab3814b8d6975f24ea357a966a7ed6dec",
      "https://img.freepik.com/free-psd/fresh-milk-landing-page_23-2148633839.jpg?size=626&ext=jpg&ga=GA1.2.470920969.1666093479",
    ];

    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ShopCubit cubit = ShopCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Stack(
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/images/farm.jpeg",
                  ),
                  Container(
                    color: Colors.black26,
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 170,
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.7 - BnbH,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        cubit.adsModel != null &&
                                cubit.adsModel!.data!.item!.length > 1
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Container(
                                  height: whiteContainerHeight * 0.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: ClipRRect(
                                    //borderRadius: BorderRadius.circular(20),
                                    child: Carousel_Slider(
                                      imagesSlider: imagesSlider,
                                    ),
                                  ),
                                ),
                              )
                            : Center(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Row(
                            children: [
                              Text(
                                "جميع المواشي : ",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.cairo(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        cubit.categoryModel != null
                            ? Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: ListView.builder(
                                      itemCount: cubit
                                          .categoryModel!.data!.item!.length,
                                      itemBuilder: (context, index) {
                                        return categories
                                            .map((e) => HomeScreenItem(cubit
                                                .categoryModel!
                                                .data!
                                                .item![index]))
                                            .toList()[index];
                                      }),
                                ),
                              )
                            : Center(child: CircularProgressIndicator()),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
























/*
Container(
        margin: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Carousel_Slider(imagesSlider: imagesSlider),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: titleText('جميع المواشي')),
              const Divider(),

              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),

                itemCount: categories.length,
                itemBuilder: (context , index){
                  return  categories.map((e) => HomeScreenItem(categories[index])).toList()[index];
                }
              ),






            ],
          ),
        ),
      ),
 */


/*
GridView.builder(
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 2, crossAxisSpacing: 2, crossAxisCount: 2),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return HomeScreenItem(
                      title: 'المواشي ',
                      subtitle: 'قسم المواشي (الأغنام)',
                      image: 'assets/images/sheep.png');
                },
              ),
 */
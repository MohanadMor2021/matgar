// import 'package:card_swiper/card_swiper.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:matgar/item/detail_screen_item/network_player_video.dart';
//
// import 'package:matgar/shared/components/components.dart';
//
// class DetailsScreen extends StatelessWidget {
//   const DetailsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     List<String> images = [
//       'https://i.pinimg.com/736x/06/2f/04/062f04781eac86ab263412ce0dcf429a.jpg',
//       'https://i.pinimg.com/564x/7e/96/33/7e9633452a0a6be661349a7dee7c5bb6.jpg',
//       'https://i.pinimg.com/736x/06/2f/04/062f04781eac86ab263412ce0dcf429a.jpg',
//     ];
//     int index = 0;
//     return Directionality(
//         textDirection: TextDirection.rtl,
//         child: Scaffold(
//           // appBar: CustomAppBar('حري كبير جبر'),
//           body: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   height: 400,
//                   width: double.infinity,
//                   child: Swiper(
//                     itemBuilder: (context, index) {
//                       return Image.network(
//                         images[index],
//                         fit: BoxFit.fill,
//                         width: double.infinity,
//                         height: 400,
//                       );
//                     },
//                     itemCount: images.length,
//                     // viewportFraction: 0.7,
//                     scale: 0.8,
//                     loop: false,
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         children: [
//                           Text(
//                             "بقرة هولاندية",
//                             style: GoogleFonts.cairo(
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//
//                           Padding(
//                             padding: const EdgeInsets.only(left: 30),
//                             child: Text(
//                               "الوزن | 500كغم",
//                               style: GoogleFonts.cairo(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: Colors.grey.shade300,
//                             ),
//                             child: Icon(
//                               Icons.favorite,
//                               color: Colors.white,
//                               size: 30,
//                             ),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Image.asset(
//                             "assets/images/whatsapp_icon.png",
//                             width: 50,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Row(
//                     children: [
//                       Text(
//                         "السعر  :  4000 ريال سعودي",
//                         style: GoogleFonts.cairo(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.red,
//                         ),
//                       ),
//                       Spacer(),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                   child: Row(
//                     children: [
//                       Text(
//                         "تفاصيل المنتج : ",
//                         style: GoogleFonts.cairo(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                       Spacer(),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   child: Padding(
//                     padding: const EdgeInsets.all(10).add(EdgeInsets.only(right: 10)),
//                     child: Text(
//                       "تتجول الأبقار وترعى في المراعي الخضراء وفي السهول. وخُوارها غالبًا ما يكسر صمت الريف. وتربى الأبقار عادة لإنتاج اللحم أو الحليب، كما أن هناك أنواعًا تُربى للغرضين معًا. وتربى الأبقار في جميع قارات العالم، وتعيش في المناطق الباردة مثل آيسلندا، وفي البلدان الحارة مثل الهند. ويعتقد الهندوس في الهند أن الأبقار حيوانات مقدسة يعبدونها ولا يذبحونها ولا يأكلون لحومها.",
//                       style: GoogleFonts.cairo(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 50),
//                 Divider(),
//                 SizedBox(height: 10),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                   child: Row(
//                     children: [
//                       Text(
//                         "معلومات عن المالك : ",
//                         style: GoogleFonts.cairo(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                       Spacer(),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 50),
//                   child: Container(
//                     alignment: Alignment.center,
//                     height: 70,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(50),
//                         border: Border.all(color: Color(0xff869B4B))),
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           width: 20,
//                         ),
//                         Icon(
//                           Icons.phone_iphone_rounded,
//                           color: Color(0xff869B4B),
//                           size: 40,
//                         ),
//                         VerticalDivider(
//                           thickness: 1,
//                         ),
//                         SizedBox(
//                           width: 20,
//                         ),
//                         Text(
//                           "970597667284+",
//                           style: GoogleFonts.cairo(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 50),
//                   child: Container(
//                     alignment: Alignment.center,
//                     height: 70,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(50),
//                         border: Border.all(color: Color(0xff869B4B))),
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           width: 25,
//                         ),
//                         Icon(
//                           Icons.email,
//                           color: Color(0xff869B4B),
//                           size: 30,
//                         ),
//                         SizedBox(
//                           width: 5,
//                         ),
//                         VerticalDivider(
//                           thickness: 1,
//                         ),
//                         SizedBox(
//                           width: 20,
//                         ),
//                         Text(
//                           "amjad@gmail.com",
//                           style: GoogleFonts.cairo(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 50,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 30),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//
//
//                       Container(
//                         alignment: Alignment.center,
//                         height: 60,
//                         width: MediaQuery.of(context).size.width * 0.40,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Color(0xff869B4B),
//                         ),
//                         child: Text(
//                           "طلب",
//                           style: GoogleFonts.cairo(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         alignment: Alignment.center,
//                         height: 60,
//                         width: MediaQuery.of(context).size.width * 0.40,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Color(0xff869B4B),
//                         ),
//                         child: Text(
//                           "طلب",
//                           style: GoogleFonts.cairo(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }
//
//
//
//
//
//
// /*
//
//
// SingleChildScrollView(
//             child: Column(
//               children: [
//                 Stack(
//                   children: [
//                     Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 50),
//                         child: Container(
//                             height: 300,
//                             width: 200,
//                             child: NetworkPlayerWidget())),
//                     Positioned(
//                         bottom: 3,
//                         right: 3,
//                         child: Container(
//                           width: 40,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: Colors.grey),
//                           child: const Text(
//                             '3/2',
//                             style: TextStyle(fontSize: 18),
//                             textAlign: TextAlign.center,
//                           ),
//                         )),
//                     Positioned(
//                         bottom: 0,
//                         left: 3,
//                         child: Container(
//                           width: 40,
//                           child: likeButton(),
//                         )),
//                   ],
//                 ),
//                 Container(
//                   margin: const EdgeInsets.symmetric(vertical: 10),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.green.withOpacity(0.5),
//                         spreadRadius: 5,
//                         blurRadius: 7,
//                         offset: Offset(0, 3), // changes position of shadow
//                       ),
//                     ],
//                   ),
//                   width: double.infinity,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'النص الرئيسي ',
//                           style: TextStyle(fontSize: 22),
//                         ),
//                         Text(
//                           'النص الفرعي ',
//                           style: TextStyle(
//                               fontSize: 18,
//                               color: Colors.black.withOpacity(0.5),
//                               fontWeight: FontWeight.normal,
//                               letterSpacing: 1.5),
//                         ),
//                         LayoutBuilder(
//                           builder: (context, constraints) =>
//                               SingleChildScrollView(
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.grey.shade200,
//                                   borderRadius: BorderRadius.circular(20)),
//                               //    height: constraints.maxHeight,
//
//                               child: Text(
//                                   'ماريا أو مظالم النساء هي عمل روائي غير مكتمل للكاتبة البريطانية ماري وولستونكرافت، تكملة لعملها ذي الطابع الفلسفي السياسي الثوري دفاعًا عن حقوق المرأة التي نشرته عام 1792. قام زوجها ويليام جودوين بنشر الرواية عام 1798 بعد وفاة مؤلفتها بعام، ويعد العمل الأكثر نسوية للكاتبة بشكل جذري. هذه الرواية هي ذات طابع فلسفي وقوطي على حد سواء، وتتناول قصة امرأة حجزت في مستشفى الأمراض العقلية بسبب زوجها. وتركز الرواية على المظالم التي تعاني منها المرأة، على الصعيد الاجتماعي أكثر مما تعانيه على الصعيد الفردي، إضافة إلى ذلك، فإن الكاتبة تنتقد ما يعتبر مؤسسة للزواج في النظام الأبوي في بريطانيا العظمى في القرن الثامن عشر، وبالمثل النظام القانوني الذي يحميه. ومع ذلك، فإن عجز بطلة الرواية عن التخلي عن أوهامها الرومانسية أيضًا قد ساهم في اتهام النساء بشكل عام في كونهن عرضة للسقوط في العواطف الزائفة وغير المجدية. كانت الرواية عملًا رائدًا في الاحتفال بالحياة الجنسية للأنثى وفي التعريف بين النساء من مختلف الطبقات. وكانت هذه المواضيع بجانب الكتاب الفاضح للروائي البريطاني ويليام جودوين بعنوان مذكرات مؤلفة دفاعًا عن حقوق المرأة عام 1798، والذي تناول حياة ماري وولستونكرافت، سببًا في أن الرواية لم تكن لها شعبية وقت نشرها. وفي القرن العشرين، حلل نقاد النسوية العمل وقاموا بدمجه في تاريخ الرواية والخطاب النسوي. وفي معظم الأوقات، كانوا يقومون بتصنيف العمل باعتباره جزءًا لا يتجزأ من الأدب النسوي المدافع عن حقوق المرأة، وبمثابة امتداد لما قدمته البريطانية وولستونكرافت من موضوعات نسوية في دفاعها عن الحقوق إضافة إلى كونها تمثل سيرتها الذاتية. استغرقت وولستونكرافت أكثر من عام لكتابة روايتها مظالم المرأة؛ وفي المقابل، كان قد انتهت من كتابة دفاعًا عن حقوق الرجل عام 1790 وفي أقل من شهر، وكان بمثابة ردًا على كتاب المفكر الإيرلندي إدموند بيرك تأملات حول الثورة فر فرنسا، الذي أصدره عام 1790، بينما انتهت من كتابها دفاعًا عن حقوق المرأة خلال ستة أسابيع، وقامت بنشره عام 1792.'),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 gradientButton(
//                     context: context,
//                     title: const Text(
//                       'تواصل',
//                       style: TextStyle(color: Colors.white, fontSize: 22),
//                     ))
//               ],
//             ),
//           ),
//  */


//import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newplantapp/pages/details_page.dart';
import 'package:newplantapp/utils/text_util.dart';
import 'package:newplantapp/utils/show_up_animation.dart';
import 'package:newplantapp/data/category_model.dart';
import 'package:newplantapp/widgets/bottom_nav.dart';
import 'package:newplantapp/core/color.dart';
import 'package:newplantapp/data/plant_data.dart';
import 'package:newplantapp/data/plant_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController();
  @override
  void initState() {
    controller=PageController(viewportFraction: 0.6,initialPage: 0);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
       child: SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
           child: Column(
             children: [
               Row(
                 children: [
                   Expanded(child: TextUtil(text:"Find Your\nFavourite Plants",size:30)),

                   GestureDetector(
                     onTap: (){
                       //Navigator.push(context, AnimatedRoute().createRoute())
                     },
                     child: Container(
                       height: 50,
                       width: 50,
                       decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           border: Border.all( color: Colors.grey.shade400,width: 4)
                       ),
                       child:const  Icon(CupertinoIcons.search_circle_fill,color: Colors.green,),
                     ),
                   ),

                    ],
                  ),
               ShowUpAnimation(
                 delay: 100,
                 child: Stack(
                   children: [
                     SizedBox(
                       height: 130,
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           Container(
                             height: 90,
                             width: double.infinity,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(20),
                                 color: Colors.green.shade700
                             ),
                             child: Row(
                               children: [
                                 Expanded(child: Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     TextUtil(text: "30% OFF",weight: true,color: Colors.white,),
                                     const   SizedBox(height: 10,),
                                     TextUtil(text: "03-21 Nov",color: Colors.white,)
                                   ],
                                 )),
                                 const Expanded(child: SizedBox())
                               ],
                             ),
                           ),
                         ],
                       ),
                     ),
                     Positioned(
                       right: 0,
                       child: SizedBox(
                           height: 120,

                           child: Image.asset("assets/plant3.jpg")),),
                   ],
                 ),
               ),
               SizedBox(
                 height: 35,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     for(int i = 0;i <categories.length; i++)
                       GestureDetector(
                         onTap: (){
                           setState(() => selectId = categories[i].id);
                         },child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(categories[i].name,
                             style:  TextStyle(
                               color: selectId == i
                                   ? Colors.green
                                   : Colors.black54,
                               fontSize: 16
                             ),
                           ),
                           if(selectId==i)
                             const CircleAvatar(
                               radius: 3,
                               backgroundColor: CupertinoColors.systemGreen,
                             )
                         ],
                       ),
                       )
                   ],
                 ),
               ),
               SizedBox(
                 height: 320,
                 child: PageView.builder(
                   itemCount: plants.length,
                     controller:controller ,
                     physics: const BouncingScrollPhysics() ,
                     padEnds: false,
                     pageSnapping: true,
                     onPageChanged: (value) => setState(() => activePage = value),
                     itemBuilder: (itemBuilder,index){
                     bool active = index == activePage;
                       return slider(active,index);
                     }),
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text(
                       'Popular',
                       style: TextStyle(
                         color: Colors.black,
                         fontWeight: FontWeight.bold,
                         fontSize: 18,
                       ),
                     ),
                     IconButton(onPressed: (){},
                         icon: Icon(Icons.more_horiz_outlined,color: Colors.green,size: 15,))
                     // Image.asset(
                     //   'assets/icons',
                     //   color: Colors.white,
                     //   height: 15,
                     // )
                   ],
                 ),
               ),
               SizedBox(
                 height: 130,
                 child: ListView.builder(
                   itemCount: populerPlants.length,
                     physics:BouncingScrollPhysics() ,
                     padding: EdgeInsets.only(left: 20),
                     scrollDirection: Axis.horizontal,
                     itemBuilder: (itemBuilder,index){
                       return Container(
                         width: 200,
                         margin: EdgeInsets.only(right: 20,bottom: 10),
                         decoration: BoxDecoration(
                           color: Colors.lightGreen.shade300,
                           boxShadow: [
                             BoxShadow(
                               color: green.withOpacity(0.3),
                               blurRadius: 10,
                               offset: const Offset(0, 5),
                             ),
                           ],
                           borderRadius: BorderRadius.circular(20.0),
                         ),
                         child: Stack(
                           children: [
                             Row(children: [
                               Image.asset(
                                 populerPlants[index].imagePath,
                                 width: 70,
                                 height: 70,
                               ),
                               SizedBox(width: 10,),
                               Column(
                                 crossAxisAlignment:CrossAxisAlignment.start,
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Text(
                                     populerPlants[index].name,
                                     style: TextStyle(
                                       color: black.withOpacity(0.7),
                                       fontWeight: FontWeight.w800,
                                     ),
                                   ),
                                   Text(
                                     '\$${populerPlants[index].price.toStringAsFixed(0)}',
                                     style: TextStyle(
                                       color: black.withOpacity(0.4),
                                       fontWeight: FontWeight.w600,
                                       fontSize: 12.0,
                                     ),
                                   )
                                 ],
                               ),
                             ],
                             ),
                             Positioned(
                               right: 20,
                                 top: 8,
                                 child: IconButton(onPressed: (){},
                                     icon: Icon(CupertinoIcons.add_circled,color: Colors.green,)))

                             // SizedBox(width: 10,),
                             // Column(
                             //   crossAxisAlignment:CrossAxisAlignment.start,
                             //   mainAxisAlignment: MainAxisAlignment.center,
                             //   children: [
                             //     Text(
                             //       populerPlants[index].name,
                             //       style: TextStyle(
                             //         color: black.withOpacity(0.7),
                             //         fontWeight: FontWeight.w800,
                             //       ),
                             //     ),
                             //     Text(
                             //       '\$${populerPlants[index].price.toStringAsFixed(0)}',
                             //       style: TextStyle(
                             //         color: black.withOpacity(0.4),
                             //         fontWeight: FontWeight.w600,
                             //         fontSize: 12.0,
                             //       ),
                             //     )
                             //     ],
                             // ),

                           ],
                         ),
                       );
                     }
                 ),

               )
       ]
    ),
    )
       )
     ),
    );
  }
  AnimatedContainer slider(active,index){
    double margin = active ? 20 : 30;
    return AnimatedContainer(duration: Duration(milliseconds: 500),
    curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      child: mainPlantsCard(index),
    );
  }
  Widget mainPlantsCard(index){
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (builder)=>DetailsPage(plant: plants[index]),
        ),
        );
      },
      child: Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
      color: white,
       boxShadow: [
      BoxShadow(
        color: black.withOpacity(0.05),
        blurRadius: 15,
        offset: const Offset(5, 5),
       ),
       ],
      border: Border.all(color: CupertinoColors.systemGreen, width: 2),
      borderRadius: BorderRadius.circular(30.0),
    ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.lightGreen.shade200,
                boxShadow: [
                  BoxShadow(
                    color: black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(5, 5),
                  ),
                ],
                borderRadius: BorderRadius.circular(25.0),
                image: DecorationImage(
                    image: AssetImage(plants[index].imagePath),
                    fit: BoxFit.cover)
              ),
            ),
            Positioned(
              right: 8,
                top: 7,
                 child: IconButton(onPressed: (){

                 }, icon: Icon(CupertinoIcons.add_circled),color: Colors.green,)// CircleAvatar(

            ),
            Align(alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Text('${plants[index].name} - \$${plants[index].price.toStringAsFixed(0)} ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
  );
  }

  int selectId = 0;
  int activePage=0;

  //void setState(int Function() param0) {}
    }
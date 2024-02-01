
import 'package:flutter/material.dart';
import 'package:newplantapp/pages/home_page.dart';
import 'package:newplantapp/core/color.dart';
import 'package:newplantapp/data/bottom_menu.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  bool _isTap = false;
  PageController pageController = PageController();
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: child.length,
          controller: pageController,
          onPageChanged: (value) => setState(() => selectIndex=value),
          itemBuilder: (itemBuilder,index){
        return Container(
          child: child[index],
        );
    },
    ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               IconButton(
                 icon: Icon(Icons.home,color: _isTap?Colors.white:Colors.green,),
                 onPressed:(){} ,
               ),
               IconButton(
                 icon: Icon(Icons.favorite_outline,color: _isTap?Colors.white:Colors.green,),
                 onPressed:(){} ,
               ),
               IconButton(
                 icon: Icon(Icons.shopping_cart,color: _isTap?Colors.green:Colors.green,),
                 onPressed:(){} ,
               ),
               IconButton(
                 icon: Icon(Icons.settings,color: _isTap?Colors.green:Colors.green,),
                 onPressed:(){} ,
               ),
               // Icon(Icons.favorite),
               // Icon(Icons.shopping_cart),
               // Icon(Icons.settings),
            //   for(int i=0;bottomMenu.length>i;i++)
            //     GestureDetector(
            //         onTap: () {
            //           setState(() {
            //               pageController.jumpToPage(i);
            //               selectIndex = i;
            //             });
            //           },
            //             child: Image.asset(
            //               bottomMenu[i].imagePath,
            //               color: selectIndex == i ? green : grey.withOpacity(0.5),
            //             ),
            //           )
                    ],
                   ),
              ),
          ),
        );

  }
}
List<Widget> child = [
  HomePage(),
  Container(color: Colors.white,)
];
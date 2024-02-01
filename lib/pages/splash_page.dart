
import 'package:flutter/material.dart';
import 'package:newplantapp/widgets/bottom_nav.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 30),
            const Text("PLANT APP PLANT APP",
              style: TextStyle(
                fontSize: 25,
                letterSpacing: 1.8,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 10),
            const Text("since 2002 by anjali",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                letterSpacing: 1.8,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(
              height: 250,
              width: 450,
              child:Image.asset('assets/plant1.jpg',height: 220,width: 200,fit: BoxFit.fitHeight),
            ),
            const SizedBox(height: 25),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBar()));
                },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 9,

                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            TextButton(
                onPressed: () {},
                child:  Text(
                  "Create an Account",
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 13,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w400,
                  ),
                ),
            ),
            TextButton(
              onPressed: () {},
              child:  Text(
                "Login",
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 13,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ),
    );

  }
}

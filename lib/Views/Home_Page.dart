import 'package:flutter/material.dart';
import '../serveses/FetchAudio.dart';
import '../serveses/sharedServises.dart';
import '../serveses/staticVariables.dart';
import 'Gallery_Page.dart';
import 'package:permission_handler/permission_handler.dart';

class Home_Page extends StatefulWidget {
  static String id = "Home_Page";

  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  Future<void> requestPermission() async {
    final status = await Permission.audio.request();
    if (status == PermissionStatus.granted) {
      setState(() {
        permissionGranted = true;
      });
      await fetchAudios();
    } else {



    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.black,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/44 1.png',
                alignment: Alignment.topCenter,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 138),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 290, left: 45),
                        child: const Text(
                          "Dancing between       The shadows       Of rhythm ",
                          style: TextStyle(
                            fontSize: 43,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 65,
                      ),
                      GestureDetector(
                        onTap: () {

                          if(permissionGranted==true){
                            incrindex();

                            Navigator.pushNamed(context, Gallery_Page.id);

                          }
                          else{
                            requestPermission();






                          }



                        },
                        child: Container(
                          width: 290,
                          height: 50,
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: Colors.black12, spreadRadius: 1)
                            ],
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: const Center(
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 83),
                        child: Text(
                          "By continuing you agree to terms of services and Privacy policy",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

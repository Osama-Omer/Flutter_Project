
import 'package:flutter/material.dart';

class profile_body extends StatelessWidget {
  const profile_body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Column(
        children: [
          SizedBox(
            height: 39,
          ),
          SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircleAvatar(backgroundImage: AssetImage("images/logo.png"),child: Text("",style: TextStyle(color: const Color.fromARGB(255, 245, 241, 231),fontSize:  60),),
                  backgroundColor: Colors.red,
                ),
                
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 60,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    elevation: 1,
                    backgroundColor: const Color.fromARGB(255, 238, 238, 237)),
                onPressed: () {Navigator.of(context).pushNamed("HomePage");},
                child: Row(
                  children: [
                    Icon(
                      Icons.person_2_outlined,color: Colors.red,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Text(
                      "MyAccount",
                      style: TextStyle(fontSize: 20),
                    )),
                    Icon(Icons.arrow_forward)
                  ],
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 60,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    elevation: 1,
                    backgroundColor: const Color.fromARGB(255, 238, 238, 237)),
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.notification_important_outlined,color: Colors.red
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Text(
                      "Notifications",
                      style: TextStyle(fontSize: 20),
                    )),
                    Icon(Icons.arrow_forward)
                  ],
                )),
          ),SizedBox(
            height: 20,
          ),
          Container(
            height: 60,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    elevation: 1,
                    backgroundColor: const Color.fromARGB(255, 238, 238, 237)),
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.settings_applications_outlined,color: Colors.red
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Text(
                      "Setting",
                      style: TextStyle(fontSize: 20),
                    )),
                    Icon(Icons.arrow_forward)
                  ],
                )),
          ),SizedBox(
            height: 20,
          ),
          Container(
            height: 60,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    elevation: 1,
                    backgroundColor: const Color.fromARGB(255, 238, 238, 237)),
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.help_center_outlined,color: Colors.red
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Text(
                      "Help Center",
                      style: TextStyle(fontSize: 20),
                    )),
                    Icon(Icons.arrow_forward)
                  ],
                )),
          ),SizedBox(
            height: 20,
          ),
          Container(
            height: 60,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    elevation: 1,
                    backgroundColor: const Color.fromARGB(255, 238, 238, 237)),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed("Sign_In");
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.exit_to_app_outlined,color: Colors.red
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Text(
                      "Log Out",
                      style: TextStyle(fontSize: 20),
                    )),
                    Icon(Icons.arrow_forward)
                  ],
                )),
          )
        ],
      ),
    ));
  }
}

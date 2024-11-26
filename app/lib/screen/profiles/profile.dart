import 'package:app/screen/profiles/profile_body.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
int seclectedItem = 2;
List secreensh=[profile_body(),profile_body(),profile_body()];
List appsh=["Message","Home","Profile"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appsh[seclectedItem],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(255, 245, 243, 243),
        body: secreensh.elementAt(seclectedItem),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: seclectedItem,
            onTap: (index) {
              setState(() {seclectedItem=index;});
            },
            selectedItemColor: const Color.fromARGB(255, 214, 209, 209),
            unselectedItemColor: const Color.fromARGB(255, 43, 42, 41),
            backgroundColor: Colors.red,
            items: [
              BottomNavigationBarItem(
                  label: "Message", icon: Icon(Icons.message_outlined)),
              BottomNavigationBarItem(
                  label: "Home", icon: Icon(Icons.home_outlined)),
              BottomNavigationBarItem(
                  label: "Profile", icon: Icon(Icons.person_2_outlined))
            ]));
  }
}

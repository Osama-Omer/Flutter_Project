import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Intropage extends StatefulWidget {
  const Intropage({super.key});

  @override
  State<Intropage> createState() => _IntropageState();
}

class _IntropageState extends State<Intropage> {
  int change = 0;
  PageController? pc2;
  String? btntext="Next";

  @override
  void initState() {
    pc2 = PageController();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: const Color.fromARGB(255, 241, 243, 245),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * .1,
                    top: MediaQuery.of(context).size.height * .06),
                alignment: Alignment.topRight,
                child: GestureDetector(
                    onTap: () {Navigator.of(context).pushReplacementNamed("Sign_up");},
                    child: Text(
                      "Skip",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 63, 61, 61)),
                    )),
              ),
              Expanded(
                child: PageView(onPageChanged: (val){
                  change=val;
                  if(val==2){
                    setState(() {
                      btntext="Get Start";
                    });
            
                  }
                  else{
                    setState(() {
                         btntext="Next";

                    });
                  }
                },
                  controller: pc2,
                  children: [
                    PageViewInto(
                        imagePath: "images/transparent-black-friday-655abbd5bfc469.4304169317004451417855.png",
                        titleIntro: "Online Shopping",
                        descIntro: "First impressions are everything in business, even in chat service. It’s important to show professionalism and courtesy from the start"),
                    PageViewInto(
                        imagePath: "images/a47ae1b3489a8777694948dcdc72a5a3.png",
                        titleIntro: "Unique Experiment",
                        descIntro: "First impressions are everything in business, even in chat service. It’s important to show professionalism and courtesy from the start"),
                        PageViewInto(
                        imagePath: "images/8a9392267476b0d57760731b0dcbb64c.png",
                        titleIntro: "High Security",
                        descIntro: "First impressions are everything in business, even in chat service. It’s important to show professionalism and courtesy from the start"),
                        

                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * .1),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        backgroundColor: Colors.red),
                    onPressed: () {if(change<2){
                      pc2!.animateToPage(change+1,
                          duration: Duration(milliseconds: 700),
                          curve: Curves.easeIn);

                    }
                     else{
                      Navigator.of(context).pushReplacementNamed("Sign_up");
                     } 
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Text(
                        "$btntext",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 235, 232, 226)),
                      ),
                    )),
              ),
              Container(margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .1),
                child: SmoothPageIndicator(
                  controller: pc2!,
                  count: 3,
                  effect: const WormEffect(
                    dotHeight: 16,
                    dotWidth: 16,
                    type: WormType.thinUnderground,
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

class PageViewInto extends StatelessWidget {
  const PageViewInto({
    this.imagePath,
    this.descIntro,
    this.titleIntro,
    super.key,
  });

  final String? imagePath;

  final String? titleIntro;

  final String? descIntro;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 300,
          child: Image.asset(
            imagePath!,
            width: 300,
          ),
        ),
        Text(titleIntro!,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
        Container(padding: EdgeInsets.all(20),
          child: Text(descIntro!,
              style: TextStyle(
                fontSize: 18,
              ),textAlign: TextAlign.center),
        ),
      ],
    );
  }
}

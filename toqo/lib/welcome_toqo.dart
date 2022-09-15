

import 'package:flutter/material.dart';
import 'package:toqo/Screens/started_page.dart';

class WelcomeToqo extends StatefulWidget {
  const WelcomeToqo({Key? key}) : super(key: key);

  @override
  State<WelcomeToqo> createState() => _WelcomeToqoState();
}

class _WelcomeToqoState extends State<WelcomeToqo> {

  final String _title = "Toqo";

  @override
  Widget build(BuildContext context) {
  
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
           SizedBox(
            height: size.height,
            child: Image.asset(WelcomeImagePaths().backGroundImagePath,fit: BoxFit.fill,)),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(WelcomeImagePaths().logoImagePath),
                    Padding(
                      padding: ProjectPaddings().logoPadding,
                      child: Text(_title,style:ProjectTextStyles(color: Colors.white)),
                    )
                  ],
                ),
                WelcomeBottomCard(size: size),
              ],
            ),
        ]
        ),
      ),
    );
  }
}

class WelcomeImagePaths {
  final String backGroundImagePath  = 'assets/images/toqo.png';
  final String logoImagePath = 'assets/images/toqo-logo.png';
}

class ProjectTextStyles extends TextStyle{

  late final double textSize;
  late final FontWeight fontWeight;
  late final Color color;

  ProjectTextStyles({ this.textSize = 19, this.fontWeight=FontWeight.normal, this.color=Colors.black}):super(
    color: color,
    fontSize: textSize,
    fontWeight: fontWeight
  );

}

class ProjectPaddings {

  final logoPadding =  const EdgeInsets.symmetric(vertical: 20);
  final InformationPadding = const EdgeInsets.symmetric(horizontal:40);
  final horizontalPadding = const EdgeInsets.symmetric(horizontal: 20);
}

class WelcomeBottomCard extends StatelessWidget {
  const WelcomeBottomCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final String title = "Find your dream product here";
    final String subTitle = "We provided to best products for you";

    return SizedBox(
      height: size.height/5*2,
      width: size.width,
      child:Card(
        shape: OutlineInputBorder(
          borderRadius:BorderRadius.circular(20), 
        ),
        color: Color.fromARGB(221, 69, 67, 67),
        child: Padding(
          padding: ProjectPaddings().InformationPadding,
          child: Column(
            children: [
              Divider(color: Colors.white,height: 15,indent: size.width/3,endIndent: size.width/3,),
              Text(title,style: ProjectTextStyles(textSize: size.height/16,color: Colors.white),),
              SizedBox(height: size.height/30,),
              Text(subTitle,textAlign: TextAlign.start,style:ProjectTextStyles(textSize: size.height/40,color: Colors.white),),
              SizedBox(height: size.height/30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: ProjectPaddings().horizontalPadding,
                    child: SizedBox(
                      width: size.width/2,
                      height: size.height/14,
                      child: ProjectButtons(text: "Get Started",),
                    ),
                  ),
                  FloatingActionButton(
                      backgroundColor: Colors.orangeAccent,
                      child: Icon(Icons.arrow_right_sharp,size: 30,),
                      mini: true,
                      onPressed: (){}
                  )
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}

class ProjectButtons extends StatelessWidget {
  final String text;
  const   ProjectButtons({
    Key? key,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        )
      ),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>StartedPage()));
      },
       child: Padding(
         padding: ProjectPaddings().horizontalPadding,
         child: Text(
          text,style: ProjectTextStyles(textSize: 16,fontWeight: FontWeight.bold,color: Colors.white),),
       )
      );
  }
}
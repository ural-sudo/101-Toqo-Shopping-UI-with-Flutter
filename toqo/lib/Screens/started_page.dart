
import 'package:flutter/material.dart';
import 'package:toqo/welcome_toqo.dart';

import '../models/Category_model.dart';
import '../models/Produc_model.dart';
import '../models/advertisement_model.dart';


class StartedPage extends StatefulWidget {
  const StartedPage({Key? key}) : super(key: key);

  @override
  State<StartedPage> createState() => _StartedPageState();
}

class _StartedPageState extends State<StartedPage> {

  late final List<Advertisements> reklamItems;

  late final List<Product> productItems;
  late final List<Categories> categories;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reklamItems = [
      Advertisements(imageUrl: "assets/images/reklam.png"),
      Advertisements(imageUrl: "assets/images/reklam.png"),
      Advertisements(imageUrl: "assets/images/reklam.png"),
      Advertisements(imageUrl: "assets/images/reklam.png"),
      Advertisements(imageUrl: "assets/images/reklam.png"),
    ] ;
    productItems = [
      Product(productId: 1, cateogryId: 1, prodImgUrl: "assets/images/ipad.png", prodTitle: "Ipad Pro"),
      Product(productId: 2, cateogryId: 1, prodImgUrl: "assets/images/robot.png", prodTitle: "New Generation Cleaner"),
      Product(productId: 3, cateogryId: 1, prodImgUrl: "assets/images/smartTv.png", prodTitle: "Television"),
    ];
    categories = [
      Categories(categoryName: "Clothing"),
      Categories(categoryName: "Gadget"),
      Categories(categoryName: "Gaming"),
      Categories(categoryName: "Camping"),
    ];
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    final String _appBarTitle = "Toqo";
    final String logoImagePath = "assets/images/started-toqo.png";
    final String _firePath = "assets/images/fire.png";
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 235, 235),
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(logoImagePath),
            Padding(
              padding: ProjectPaddings().horizontalPadding/3,
              child: Text(_appBarTitle,style: ProjectTextStyles(fontWeight: FontWeight.bold),),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: (){}, icon:Icon(Icons.notification_important,)
          )
        ],
      ),
      drawer: Drawer(),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:EdgeInsets.symmetric(horizontal: size.width/16),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: size.width/20),
                      child: StartedSearchContainer(size: size),
                    ),
                  ),
                  StartedPageFilterButton()
                ],  
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width/17,top: 15),
              child: SizedBox(
                height: size.height/4,
                child: AdvListView(items: reklamItems),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width/16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("Live Discount",style:Styles.liveStyle ,),
                      Image.asset(_firePath),
                    ],
                  ),
                  TextButton(onPressed: (){}, child: Text("View all",style:Styles.txtButtonStyle))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:size.width/16),
              child: SizedBox(
                height: 35,
                child: CategoryListView(categories: categories),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20,left: 20),
              child: SizedBox(
                height: 120,
                child: ProductListView(productItems: productItems, size: size),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled,color:Color.fromARGB(255, 121, 120, 120),),label: "",),
          BottomNavigationBarItem(icon: Icon(Icons.assistant_navigation,color: Color.fromARGB(255, 121, 120, 120),),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.message,color: Color.fromARGB(255, 121, 120, 120),),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person,color: Color.fromARGB(255, 121, 120, 120),),label: "")
        ],
        
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.shopping_basket_rounded),
      mini: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}


class ProductListView extends StatelessWidget {
  const ProductListView({
    Key? key,
    required this.productItems,
    required this.size,
  }) : super(key: key);

  final List<Product> productItems;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: productItems.length,
      itemBuilder: (context, index) {
      return Card(
        child: SizedBox(
          width: size.width/3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: size.height/7,
                    width: size.width/3,
                    child: Image.asset(productItems[index].prodImgUrl,fit: BoxFit.fill,)
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minRadius: 15.0,
                      child:Icon(Icons.add) ,
                    ),
                  ),
                ],
              ),
              Text(
                productItems[index].prodTitle,
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,overflow: TextOverflow.ellipsis,),
                textAlign: TextAlign.start,
                ),
            ],
          ),
        ),
      );
    },);
  }
}

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<Categories> categories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:categories.length ,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal:5),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
              onPressed: (){},
              child: Text(categories[index].categoryName,style: TextStyle(color: Color.fromARGB(255, 104, 104, 104)),),

          ),
        );
      },
    );
  }
}

class AdvListView extends StatelessWidget {
  const AdvListView({
    Key? key,
    required this.items,
    
  }) : super(key: key);

  final List<Advertisements> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
      return
          Card(
            child: Image.asset(items[index].imageUrl,fit: BoxFit.fill,),
          );
    },);
  }
}
class Styles {
  static final liveStyle = TextStyle(fontSize: 18,fontWeight: FontWeight.bold);
  static final txtButtonStyle = TextStyle(color: Color.fromARGB(255, 124, 123, 123));
}


class StartedPageFilterButton extends StatelessWidget {
  const StartedPageFilterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
     onPressed: (){},
     style: ElevatedButton.styleFrom(
      primary: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      )
     ),
     child: Icon(Icons.filter_6,color: Color.fromARGB(255, 192, 190, 190),)
    );
  }
}

class StartedSearchContainer extends StatelessWidget {
  const StartedSearchContainer({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height/16,
      decoration: BoxDecoration(
        color: Colors.white,
        border:Border.all(width: 0.1,color: Colors.white),
        borderRadius: BorderRadius.circular(10)
      ) ,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(Icons.search),
          ),
          Expanded(
            child: TextField(
              
              decoration: InputDecoration(
                labelText: "Search",
                border: OutlineInputBorder(borderSide: BorderSide.none )
              ),
            ),
          )
        ],
      ),
    );
  }
}